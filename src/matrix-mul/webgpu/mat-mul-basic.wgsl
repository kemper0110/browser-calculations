// Шейдер для вычисления произведения матриц

@group(0) @binding(0) var<storage, read> a: array<f32>;
@group(0) @binding(1) var<storage, read> b: array<f32>;
@group(0) @binding(2) var<storage, read_write> c: array<f32>;
@group(0) @binding(3) var<storage, read> size: u32;

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
  // `x` изменяется раньше чем `y`, поэтому нужно, чтобы `y` был общим у наибольшего числа потоков.
  let row = global_id.x;
  let col = global_id.y;

  if (row < size && col < size) {
    var sum: f32 = 0.0;
    for (var i: u32 = 0u; i < size; i = i + 1u) {
      sum = sum + a[col * size + i] * b[i * size + row];
    }
    c[col * size + row] = sum;
  }
}