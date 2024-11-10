import shaderCode from "./shader.wgsl?raw";

export async function killer() {
    const adapter = await navigator.gpu?.requestAdapter();
    const device = await adapter!.requestDevice();

    const bindGroupLayout = device.createBindGroupLayout({
        entries: [
            {binding: 0, visibility: GPUShaderStage.COMPUTE, buffer: {type: 'read-only-storage'}},
            {binding: 1, visibility: GPUShaderStage.COMPUTE, buffer: {type: 'read-only-storage'}},
            {binding: 2, visibility: GPUShaderStage.COMPUTE, buffer: {type: 'storage'}},
        ]
    });
    const pipelineLayout = device.createPipelineLayout({bindGroupLayouts: [bindGroupLayout]})
    const shaderModule = device.createShaderModule({code: shaderCode});
    const pipeline = device.createComputePipeline({
        layout: pipelineLayout,
        compute: {
            module: shaderModule,
            entryPoint: 'main',
        },
    });

    return async function kill() {
        const matrixA = new Float32Array([0, 1, 2, 3])
        const matrixABuffer = device.createBuffer({
            size: matrixA.byteLength,
            usage: GPUBufferUsage.STORAGE,
            mappedAtCreation: true,
        })
        new Float32Array(matrixABuffer.getMappedRange()).set(matrixA);
        matrixABuffer.unmap();

        const matrixB = new Float32Array([4, 5, 6, 7])
        const matrixBBuffer = device.createBuffer({
            size: matrixB.byteLength,
            usage: GPUBufferUsage.STORAGE,
            mappedAtCreation: true,
        })
        new Float32Array(matrixBBuffer.getMappedRange()).set(matrixB);
        matrixBBuffer.unmap();

        const resultMatrixByteLength = Float32Array.BYTES_PER_ELEMENT * 4;
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
            ],
        });

        const commandEncoder = device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();
        passEncoder.setPipeline(pipeline);
        passEncoder.setBindGroup(0, bindGroup);
        passEncoder.dispatchWorkgroups(1);
        passEncoder.end();

        const gpuReadBuffer = device.createBuffer({
            size: resultMatrixByteLength,
            usage: GPUBufferUsage.COPY_DST | GPUBufferUsage.MAP_READ,
        });
        commandEncoder.copyBufferToBuffer(resultMatrixBuffer, 0, gpuReadBuffer, 0, resultMatrixByteLength);
        device.queue.submit([commandEncoder.finish()]);
        await device.queue.onSubmittedWorkDone()

        await gpuReadBuffer.mapAsync(GPUMapMode.READ);
        const result = new Float32Array(gpuReadBuffer.getMappedRange()).join(', ')
        gpuReadBuffer.unmap();

        console.log('ok', result)
    }
}

