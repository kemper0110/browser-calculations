// Шейдер для вычисления произведения матриц

@group(0) @binding(0) var<storage, read> a: array<f32>;
@group(0) @binding(1) var<storage, read> b: array<f32>;
@group(0) @binding(2) var<storage, read_write> c: array<f32>;
@group(0) @binding(3) var<storage, read> size: u32;

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    let x = id.x;
    let y = id.y;
    var sum: f32 = 0.0;
    for (var i = 0u; i < size; i = i + 1u) {
        sum = sum + a[(y * size) + i] * b[(i * size) + x];
    }
    c[y * size + x] = sum;
}