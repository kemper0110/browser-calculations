import tiled2x2ShaderCode from "./mat-mul-2x2.wgsl?raw";
import tiled4x4ShaderCode from "./mat-mul-4x4.wgsl?raw";
import tiled8x8ShaderCode from "./mat-mul-8x8.wgsl?raw";
import tiledCycleShaderCode from "./mat-mul-cycle.wgsl?raw";
import basicShaderCode from './mat-mul-basic.wgsl?raw'

export type GpuComputeMethod = 'basic' | 'tiled2x2' | 'tiled4x4' | 'tiled8x8' | 'tiledCycle'

export async function calculate(method: GpuComputeMethod, matrixA: Float32Array, matrixB: Float32Array, size: number, iterations: number) {
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
        code: {
            basic: basicShaderCode,
            tiled2x2: tiled2x2ShaderCode,
            tiled4x4: tiled4x4ShaderCode,
            tiled8x8: tiled8x8ShaderCode,
            tiledCycle: tiledCycleShaderCode,
        }[method],
    });
    const pipeline = device.createComputePipeline({
        layout: pipelineLayout,
        compute: {
            module: shaderModule,
            entryPoint: 'main',
        },
    });

    if (size % 16 !== 0) throw new Error('Size must be divisible by 16')
    if (matrixA.length !== matrixB.length) throw new Error('Matrix sizes must be equal')
    if (matrixA.length !== size * size) throw new Error('Matrix sizes must be equal')
    if (matrixB.length !== size * size) throw new Error('Matrix sizes must be equal')

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
    const gpuReadBuffer = device.createBuffer({
        size: resultMatrixByteLength,
        usage: GPUBufferUsage.COPY_DST | GPUBufferUsage.MAP_READ,
    });

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
        switch (method) {
            case "basic": {
                const wgSize = 16;
                passEncoder.dispatchWorkgroups(size / wgSize, size / wgSize);
                break;
            }
            case "tiled2x2": {
                const wgSize = 16, tileSize = 2;
                passEncoder.dispatchWorkgroups(size / wgSize / tileSize, size / wgSize / tileSize);
                break;
            }
            case "tiled4x4": {
                const wgSize = 16, tileSize = 4;
                passEncoder.dispatchWorkgroups(size / wgSize / tileSize, size / wgSize / tileSize);
                break;
            }
            case "tiled8x8": {
                const wgSize = 16, tileSize = 8;
                passEncoder.dispatchWorkgroups(size / wgSize / tileSize, size / wgSize / tileSize);
                break;
            }
            case 'tiledCycle': {
                const wgSize = 16, tileSize = 4;
                passEncoder.dispatchWorkgroups(size / wgSize / tileSize, size / wgSize / tileSize);
                break;
            }
        }
        passEncoder.end();
    }
    commandEncoder.copyBufferToBuffer(resultMatrixBuffer, 0, gpuReadBuffer, 0, resultMatrixByteLength);

    const s = performance.now()
    {
        device.queue.submit([commandEncoder.finish()]);
        await device.queue.onSubmittedWorkDone()
        await gpuReadBuffer.mapAsync(GPUMapMode.READ);
    }
    const time = performance.now() - s

    const result = new Float32Array(gpuReadBuffer.getMappedRange()).reduce((acc, cur) => acc + cur, 0)
    gpuReadBuffer.unmap();

    return {
        result,
        time
    }
}

