import shaderCode from "./mat-mul.wgsl?raw";


export async function setup() {
    const adapter = await navigator.gpu?.requestAdapter();
    const device = await adapter!.requestDevice();

    const bindGroupLayout = device.createBindGroupLayout({
        entries: [
            {binding: 0, visibility: GPUShaderStage.COMPUTE, buffer: {type: 'read-only-storage'}},
            {binding: 1, visibility: GPUShaderStage.COMPUTE, buffer: {type: 'read-only-storage'}},
            {binding: 2, visibility: GPUShaderStage.COMPUTE, buffer: {type: 'storage'}},
            {binding: 3, visibility: GPUShaderStage.COMPUTE, buffer: {type: 'read-only-storage'}},
        ],
    });
    const pipelineLayout = device.createPipelineLayout({
        bindGroupLayouts: [bindGroupLayout],
    })
    const shaderModule = device.createShaderModule({
        code: shaderCode,
    });
    const pipeline = device.createComputePipeline({
        layout: pipelineLayout,
        compute: {
            module: shaderModule,
            entryPoint: 'main',
        },
    });

    return async function calculate(matrixA: Float32Array, matrixB: Float32Array, size: number, iterations: number) {
        if(size % 16 !== 0) throw new Error('Size must be divisible by 16')
        if(matrixA.length !== matrixB.length) throw new Error('Matrix sizes must be equal')
        if(matrixA.length !== size * size) throw new Error('Matrix sizes must be equal')
        if(matrixB.length !== size * size) throw new Error('Matrix sizes must be equal')

        const matrixABuffer = device.createBuffer({
            size: matrixA.byteLength,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
        })
        const matrixBBuffer = device.createBuffer({
            size: matrixB.byteLength,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
        })
        const sizeArr = new Uint32Array([size]);
        const sizeBuffer = device.createBuffer({
            size: sizeArr.byteLength,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
        })

        const resultMatrixByteLength = Float32Array.BYTES_PER_ELEMENT * size * size;
        const resultMatrixBuffer = device.createBuffer({
            size: resultMatrixByteLength,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
        })

        const bindGroup = device.createBindGroup({
            layout: bindGroupLayout,
            entries: [
                {binding: 0, resource: {buffer: matrixABuffer}},
                {binding: 1, resource: {buffer: matrixBBuffer}},
                {binding: 2, resource: {buffer: resultMatrixBuffer}},
                {binding: 3, resource: {buffer: sizeBuffer}},
            ],
        });


        device.queue.writeBuffer(matrixABuffer, 0, matrixA);
        device.queue.writeBuffer(matrixBBuffer, 0, matrixB);
        device.queue.writeBuffer(sizeBuffer, 0, sizeArr);

        const commandEncoder = device.createCommandEncoder();
        for (let i = 0; i < iterations; i++) {
            const passEncoder = commandEncoder.beginComputePass();
            passEncoder.setPipeline(pipeline);
            passEncoder.setBindGroup(0, bindGroup);
            passEncoder.dispatchWorkgroups(size / 16, size / 16);
            passEncoder.end();
        }
        const gpuReadBuffer = device.createBuffer({
            size: resultMatrixByteLength,
            usage: GPUBufferUsage.COPY_DST | GPUBufferUsage.MAP_READ,
        });
        commandEncoder.copyBufferToBuffer(resultMatrixBuffer, 0, gpuReadBuffer, 0, resultMatrixByteLength);

        const s = performance.now()
        device.queue.submit([commandEncoder.finish()]);
        await device.queue.onSubmittedWorkDone()
        await gpuReadBuffer.mapAsync(GPUMapMode.READ);
        const time = performance.now() - s

        const result = new Float32Array(gpuReadBuffer.getMappedRange()).reduce((acc, cur) => acc + cur, 0)
        gpuReadBuffer.unmap();

        return {
            result,
            time
        }
    }
}

