// Шейдер, который может перезагрузить вам браузер

struct Matrix {
    size: vec2<u32>,
    numbers: array<f32>,
};
@group(0) @binding(0) var<storage, read> matrixA: Matrix;
@group(0) @binding(1) var<storage, read> matrixB: Matrix;
@group(0) @binding(2) var<storage, read_write> resultMatrix: Matrix;


@compute @workgroup_size(2, 2)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    let x = id.x;
    let y = id.y;
    let widthA = matrixA.size.x;
    let widthB = matrixB.size.x;
    var sum = 0.0;
    for (var i = 0u; i < widthB; i = i + 1u) {
        let a = matrixA.numbers[(y * widthA) + i];
        let b = matrixB.numbers[(i * widthB) + x];
        sum = sum + a * b;
    }
    resultMatrix.numbers[(y * widthB) + x] = sum;
}