// Шейдер для вычисления произведения матриц с развернутыми циклами

@group(0) @binding(0) var<storage, read> a: array<f32>;
@group(0) @binding(1) var<storage, read> b: array<f32>;
@group(0) @binding(2) var<storage, read_write> c: array<f32>;
@group(0) @binding(3) var<storage, read> size: u32;

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let row = global_id.y * 2u;
    let col = global_id.x * 2u;
    if (row >= size || col >= size) {
        return;
    }

    var sums: array<array<f32, 2>, 2>;
    sums[0][0] = 0.0;
    sums[0][1] = 0.0;
    sums[1][0] = 0.0;
    sums[1][1] = 0.0;

    for (var k: u32 = 0u; k < size; k = k + 1u) {
      let a_row_0 = a[(row + 0u) * size + k];
      let a_row_1 = a[(row + 1u) * size + k];
      let b_col_0 = b[k * size + (col + 0u)];
      let b_col_1 = b[k * size + (col + 1u)];
      sums[0][0] += a_row_0 * b_col_0;
      sums[0][1] += a_row_0 * b_col_1;
      sums[1][0] += a_row_1 * b_col_0;
      sums[1][1] += a_row_1 * b_col_1;
    }
    if (row + 0u < size && col + 0u < size) {
        c[(row + 0u) * size + (col + 0u)] = sums[0][0];
    }
    if (row + 0u < size && col + 1u < size) {
        c[(row + 0u) * size + (col + 1u)] = sums[0][1];
    }
    if (row + 1u < size && col + 0u < size) {
        c[(row + 1u) * size + (col + 0u)] = sums[1][0];
    }
    if (row + 1u < size && col + 1u < size) {
        c[(row + 1u) * size + (col + 1u)] = sums[1][1];
    }
}