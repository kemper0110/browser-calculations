function range(end: number): number[] {
    return [...Array(end).keys()]
}


function cycle2d(size: number, cb: (i: number, j: number) => string): string {
    return range(size).flatMap(i => range(size).map(j => cb(i, j))).join('\n')
}



function generateMatrixMultiplicationShader(blockSize: number): string {
    return `
// Шейдер для вычисления произведения матриц с развернутыми циклами

@group(0) @binding(0) var<storage, read> a: array<f32>;
@group(0) @binding(1) var<storage, read> b: array<f32>;
@group(0) @binding(2) var<storage, read_write> c: array<f32>;
@group(0) @binding(3) var<storage, read> size: u32;

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let row = global_id.y * ${blockSize}u;
    let col = global_id.x * ${blockSize}u;

    if (row >= size || col >= size) {
        return;
    }
    
    var sums: array<array<f32, ${blockSize}>, ${blockSize}>;
${range(blockSize).flatMap(i => range(blockSize).map(j => 
`    sums[${i}][${j}] = 0.0;`)).join('\n')
    }
    
    for (var k: u32 = 0u; k < size; k = k + 1u) {
${range(blockSize).map(i =>
`      let a_row_${i} = a[(row + ${i}u) * size + k];`
        ).join('\n')}
${range(blockSize).map(j => 
`      let b_col_${j} = b[k * size + (col + ${j}u)];`
        ).join('\n')}
${range(blockSize).flatMap(i => range(blockSize).map(j => 
`      sums[${i}][${j}] += a_row_${i} * b_col_${j};`)).join('\n')
        }
    }
${range(blockSize).flatMap(i => range(blockSize).map(j => 
`    if (row + ${i}u < size && col + ${j}u < size) {\n` +
`        c[(row + ${i}u) * size + (col + ${j}u)] = sums[${i}][${j}];\n` +
`    }`
     )).join('\n')}
}`;
}

// Пример использования
const shaderCode = generateMatrixMultiplicationShader(2);
console.log(shaderCode)