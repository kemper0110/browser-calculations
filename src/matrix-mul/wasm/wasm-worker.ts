import {multiply_matrices_returning} from '@dardanda/rust-mat-mul'

console.log('wasm worker created')

export type Message = {
    size: number
}

export type Result = {
    result: number
    time: number
}

function generateMatrixTyped(size: number): Float64Array {
    const result = new Float64Array(size * size);
    for (let i = 0; i < size; i++)
        for (let j = 0; j < size; j++)
            result[i * size + j] = Math.random();
    return result;
}


self.onmessage = (e: MessageEvent<Message>) => {
    const {size} = e.data
    const a = generateMatrixTyped(size);
    const b = generateMatrixTyped(size);
    const s = performance.now()
    const c = multiply_matrices_returning(a, b, size)
    const time = performance.now() - s
    const result = c.reduce((acc, cur) => acc + cur, 0)
    self.postMessage({result, time} satisfies Result)
}
