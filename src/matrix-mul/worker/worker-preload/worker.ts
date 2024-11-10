import type {Message} from "./index.ts";

let size = 0, a: Float64Array | null = null, b: Float64Array | null = null, result: Float64Array | null = null;

self.onmessage = e => {
    const data = e.data as Message
    if (data.kind === 'run') {
        multiplyMatrices(a!, b!, result!, e.data.startRow, e.data.endRow, size);
        self.postMessage(null);
    } else if (data.kind === 'set-matrices') {
        a = new Float64Array(data.a)
        b = new Float64Array(data.b)
        result = new Float64Array(data.result)
        size = data.size
    } else {
        throw new Error("Unknown kind!")
    }
}


// Функция умножения матриц
function multiplyMatrices(a: Float64Array, b: Float64Array, c: Float64Array, startRow: number, endRow: number, size: number) {
    const r = new Float64Array(size * size);
    const start = performance.now();
    for (let i = 0; i < size; i++) {
        for (let j = startRow; j < endRow; j++) {
            let sum = 0;
            for (let k = 0; k < size; k++)
                sum += a[i * size + k] * b[j * size + k];
            // c[i * size + j] = sum;
            r[i * size + j] = sum;
        }
    }
    const end = performance.now();
    console.log('done', end - start);
}