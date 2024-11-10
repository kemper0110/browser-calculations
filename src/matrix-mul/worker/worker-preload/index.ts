import MatWorker from "./worker.ts?worker";

// const numWorkers = navigator.hardwareConcurrency || 1;
const numWorkers = 8;
const workers = Array.from({length: numWorkers}, () => new MatWorker());

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

export async function mulParallel(a: Float64Array, b: Float64Array, result: Float64Array, size: number) {
    const rowsPerWorker = Math.ceil(size / numWorkers);
    console.log('rowsPerWorker', size / numWorkers)

    workers.forEach(worker => {
        worker.postMessage({
            kind: 'set-matrices',
            a: a.buffer,
            b: b.buffer,
            result: result.buffer,
            size,
        } satisfies SetMatricesMessage);
    });

    return function() {
        return Promise.all(
            Array.from({length: numWorkers}, (_, i) => i)
            // [0]
                .map(i =>
                new Promise((res, rej) => {
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
    }
}