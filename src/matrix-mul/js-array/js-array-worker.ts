export type Message = {
    size: number
    arrayType: ArrayType
}

export type ArrayType = 'common' | 'typed'
export type Result = {
    result: number
    time: number
}

self.onmessage = (e: MessageEvent<Message>) => {
    const {size, arrayType} = e.data
    const {a, b, c} = arrayType === 'common' ? {
        a: new Array<number>(size * size),
        b: new Array<number>(size * size),
        c: new Array<number>(size * size),
    } : {
        a: new Float64Array(size * size),
        b: new Float64Array(size * size),
        c: new Float64Array(size * size),
    }
    generateMatrix(a)
    generateMatrix(b)
    const s = performance.now()
    mul(a, b, c, size)
    const time = performance.now() - s
    // eslint-disable-next-line @typescript-eslint/ban-ts-comment
    // @ts-expect-error
    const result: number = c.reduce((acc, cur) => acc + cur, 0)
    self.postMessage({result, time} satisfies Result)
}


function generateMatrix(result: number[] | Float64Array) {
    for (let i = 0; i < result.length; i++)
        result[i] = Math.random();
}

function mul(a: number[] | Float64Array, b: number[] | Float64Array, c: number[] | Float64Array, size: number) {
    for (let i = 0; i < size; i++) {
        for (let j = 0; j < size; j++) {
            let sum = 0;
            for (let k = 0; k < size; k++) {
                sum += a[i * size + k] * b[j * size + k];
            }
            c[i * size + j] = sum;
        }
    }
}
