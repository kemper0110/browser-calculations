import MatWorker from "./worker.ts?worker";
import {generateMatrixWorker} from "../generate.ts";


export type Message = SetMatricesMessage | RunMessage
export type RunMessage = {
    kind: 'run'
    startRow: number
    endRow: number
}
export type SetMatricesMessage = {
    kind: 'set-matrices'
    a: ArrayBufferLike
    b: ArrayBufferLike
    result: ArrayBufferLike
    size: number
}

export async function mulParallel(concurrency: number, size: number) {
    const buff = new SharedArrayBuffer(Float64Array.BYTES_PER_ELEMENT * size * size);
    const result = new Float64Array(buff);
    const a = generateMatrixWorker(size)
    const b = generateMatrixWorker(size)

    const workers = Array.from({length: concurrency}, () => new MatWorker());

    await new Promise(res => setTimeout(res, 100))

    const rowsPerWorker = Math.ceil(size / concurrency);
    console.log('rowsPerWorker', rowsPerWorker)

    workers.forEach(worker => {
        worker.postMessage({
            kind: 'set-matrices',
            a: a.buffer,
            b: b.buffer,
            result: result.buffer,
            size,
        } satisfies SetMatricesMessage);
    });
    await new Promise(res => setTimeout(res, 100))

    const start = performance.now()
    await Promise.all(
        Array.from({length: concurrency}, (_, i) => i)
            .map(i =>
                new Promise<void>((res, rej) => {
                    const worker = workers[i];
                    const startRow = i * rowsPerWorker;
                    const endRow = Math.min(startRow + rowsPerWorker, size);
                    worker.postMessage({
                        kind: 'run',
                        startRow,
                        endRow,
                    } satisfies RunMessage);
                    worker.onmessage = function () {
                        res();
                    };
                    worker.onerror = function (error) {
                        rej(error);
                    };
                }))
    )
    const end = performance.now()
    workers.forEach(w => w.terminate())
    return {
        result: result.reduce((acc, cur) => acc + cur, 0),
        time: end - start
    }
}