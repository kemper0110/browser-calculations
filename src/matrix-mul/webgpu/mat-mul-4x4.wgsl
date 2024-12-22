// Шейдер для вычисления произведения матриц с развернутыми циклами
// Шейдер для вычисления произведения матриц с развернутыми циклами

@group(0) @binding(0) var<storage, read> a: array<f32>;
@group(0) @binding(1) var<storage, read> b: array<f32>;
@group(0) @binding(2) var<storage, read_write> c: array<f32>;
@group(0) @binding(3) var<storage, read> size: u32;

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let row = global_id.y * 4u;
    let col = global_id.x * 4u;
    if (row >= size || col >= size) {
        return;
    }

    var sums: array<array<f32, 4>, 4>;
    sums[0][0] = 0.0;
    sums[0][1] = 0.0;
    sums[0][2] = 0.0;
    sums[0][3] = 0.0;
    sums[1][0] = 0.0;
    sums[1][1] = 0.0;
    sums[1][2] = 0.0;
    sums[1][3] = 0.0;
    sums[2][0] = 0.0;
    sums[2][1] = 0.0;
    sums[2][2] = 0.0;
    sums[2][3] = 0.0;
    sums[3][0] = 0.0;
    sums[3][1] = 0.0;
    sums[3][2] = 0.0;
    sums[3][3] = 0.0;

    for (var k: u32 = 0u; k < size; k = k + 1u) {
      let a_row_0 = a[(row + 0u) * size + k];
      let a_row_1 = a[(row + 1u) * size + k];
      let a_row_2 = a[(row + 2u) * size + k];
      let a_row_3 = a[(row + 3u) * size + k];
      let b_col_0 = b[k * size + (col + 0u)];
      let b_col_1 = b[k * size + (col + 1u)];
      let b_col_2 = b[k * size + (col + 2u)];
      let b_col_3 = b[k * size + (col + 3u)];
      sums[0][0] += a_row_0 * b_col_0;
      sums[0][1] += a_row_0 * b_col_1;
      sums[0][2] += a_row_0 * b_col_2;
      sums[0][3] += a_row_0 * b_col_3;
      sums[1][0] += a_row_1 * b_col_0;
      sums[1][1] += a_row_1 * b_col_1;
      sums[1][2] += a_row_1 * b_col_2;
      sums[1][3] += a_row_1 * b_col_3;
      sums[2][0] += a_row_2 * b_col_0;
      sums[2][1] += a_row_2 * b_col_1;
      sums[2][2] += a_row_2 * b_col_2;
      sums[2][3] += a_row_2 * b_col_3;
      sums[3][0] += a_row_3 * b_col_0;
      sums[3][1] += a_row_3 * b_col_1;
      sums[3][2] += a_row_3 * b_col_2;
      sums[3][3] += a_row_3 * b_col_3;
    }
    if (row + 0u < size && col + 0u < size) {
        c[(row + 0u) * size + (col + 0u)] = sums[0][0];
    }
    if (row + 0u < size && col + 1u < size) {
        c[(row + 0u) * size + (col + 1u)] = sums[0][1];
    }
    if (row + 0u < size && col + 2u < size) {
        c[(row + 0u) * size + (col + 2u)] = sums[0][2];
    }
    if (row + 0u < size && col + 3u < size) {
        c[(row + 0u) * size + (col + 3u)] = sums[0][3];
    }
    if (row + 1u < size && col + 0u < size) {
        c[(row + 1u) * size + (col + 0u)] = sums[1][0];
    }
    if (row + 1u < size && col + 1u < size) {
        c[(row + 1u) * size + (col + 1u)] = sums[1][1];
    }
    if (row + 1u < size && col + 2u < size) {
        c[(row + 1u) * size + (col + 2u)] = sums[1][2];
    }
    if (row + 1u < size && col + 3u < size) {
        c[(row + 1u) * size + (col + 3u)] = sums[1][3];
    }
    if (row + 2u < size && col + 0u < size) {
        c[(row + 2u) * size + (col + 0u)] = sums[2][0];
    }
    if (row + 2u < size && col + 1u < size) {
        c[(row + 2u) * size + (col + 1u)] = sums[2][1];
    }
    if (row + 2u < size && col + 2u < size) {
        c[(row + 2u) * size + (col + 2u)] = sums[2][2];
    }
    if (row + 2u < size && col + 3u < size) {
        c[(row + 2u) * size + (col + 3u)] = sums[2][3];
    }
    if (row + 3u < size && col + 0u < size) {
        c[(row + 3u) * size + (col + 0u)] = sums[3][0];
    }
    if (row + 3u < size && col + 1u < size) {
        c[(row + 3u) * size + (col + 1u)] = sums[3][1];
    }
    if (row + 3u < size && col + 2u < size) {
        c[(row + 3u) * size + (col + 2u)] = sums[3][2];
    }
    if (row + 3u < size && col + 3u < size) {
        c[(row + 3u) * size + (col + 3u)] = sums[3][3];
    }
}