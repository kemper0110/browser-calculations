// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-expect-error
import MatWorker from "./worker.ts?worker";

const numWorkers = navigator.hardwareConcurrency || 4;
// const numWorkers = 4;
const workers = Array.from({length: numWorkers},
  () => new MatWorker());

export async function mulParallel(a: Float64Array, b: Float64Array, result: Float64Array, size: number) {
  const rowsPerWorker = Math.ceil(size / numWorkers);
  console.log('rowsPerWorker', size / numWorkers)

  await Promise.all(
    Array.from({length: numWorkers}, (_, i) => i).map(i =>
      new Promise((res, rej) => {
        const worker = workers[i];
        const startRow = i * rowsPerWorker;
        const endRow = Math.min(startRow + rowsPerWorker, size);
        console.log('started worker')
        worker.postMessage({
          a: a.buffer,
          b: b.buffer,
          result: result.buffer,
          size,
          startRow,
          endRow,
        });
        worker.onmessage = function () {
          res();
        };
        worker.onerror = function (error) {
          rej(error);
        };
      }))
  )
}