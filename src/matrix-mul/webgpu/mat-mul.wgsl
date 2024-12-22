// Шейдер для вычисления произведения матриц с развернутыми циклами

@group(0) @binding(0) var<storage, read> a: array<f32>;
@group(0) @binding(1) var<storage, read> b: array<f32>;
@group(0) @binding(2) var<storage, read_write> c: array<f32>;
@group(0) @binding(3) var<storage, read> size: u32;

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let row = global_id.y * 8u;
    let col = global_id.x * 8u;
    if (row >= size || col >= size) {
        return;
    }

    var sums: array<array<f32, 8>, 8>;
    sums[0][0] = 0.0;
    sums[0][1] = 0.0;
    sums[0][2] = 0.0;
    sums[0][3] = 0.0;
    sums[0][4] = 0.0;
    sums[0][5] = 0.0;
    sums[0][6] = 0.0;
    sums[0][7] = 0.0;
    sums[1][0] = 0.0;
    sums[1][1] = 0.0;
    sums[1][2] = 0.0;
    sums[1][3] = 0.0;
    sums[1][4] = 0.0;
    sums[1][5] = 0.0;
    sums[1][6] = 0.0;
    sums[1][7] = 0.0;
    sums[2][0] = 0.0;
    sums[2][1] = 0.0;
    sums[2][2] = 0.0;
    sums[2][3] = 0.0;
    sums[2][4] = 0.0;
    sums[2][5] = 0.0;
    sums[2][6] = 0.0;
    sums[2][7] = 0.0;
    sums[3][0] = 0.0;
    sums[3][1] = 0.0;
    sums[3][2] = 0.0;
    sums[3][3] = 0.0;
    sums[3][4] = 0.0;
    sums[3][5] = 0.0;
    sums[3][6] = 0.0;
    sums[3][7] = 0.0;
    sums[4][0] = 0.0;
    sums[4][1] = 0.0;
    sums[4][2] = 0.0;
    sums[4][3] = 0.0;
    sums[4][4] = 0.0;
    sums[4][5] = 0.0;
    sums[4][6] = 0.0;
    sums[4][7] = 0.0;
    sums[5][0] = 0.0;
    sums[5][1] = 0.0;
    sums[5][2] = 0.0;
    sums[5][3] = 0.0;
    sums[5][4] = 0.0;
    sums[5][5] = 0.0;
    sums[5][6] = 0.0;
    sums[5][7] = 0.0;
    sums[6][0] = 0.0;
    sums[6][1] = 0.0;
    sums[6][2] = 0.0;
    sums[6][3] = 0.0;
    sums[6][4] = 0.0;
    sums[6][5] = 0.0;
    sums[6][6] = 0.0;
    sums[6][7] = 0.0;
    sums[7][0] = 0.0;
    sums[7][1] = 0.0;
    sums[7][2] = 0.0;
    sums[7][3] = 0.0;
    sums[7][4] = 0.0;
    sums[7][5] = 0.0;
    sums[7][6] = 0.0;
    sums[7][7] = 0.0;

    for (var k: u32 = 0u; k < size; k = k + 1u) {
      let a_row_0 = a[(row + 0u) * size + k];
      let a_row_1 = a[(row + 1u) * size + k];
      let a_row_2 = a[(row + 2u) * size + k];
      let a_row_3 = a[(row + 3u) * size + k];
      let a_row_4 = a[(row + 4u) * size + k];
      let a_row_5 = a[(row + 5u) * size + k];
      let a_row_6 = a[(row + 6u) * size + k];
      let a_row_7 = a[(row + 7u) * size + k];
      let b_col_0 = b[k * size + (col + 0u)];
      let b_col_1 = b[k * size + (col + 1u)];
      let b_col_2 = b[k * size + (col + 2u)];
      let b_col_3 = b[k * size + (col + 3u)];
      let b_col_4 = b[k * size + (col + 4u)];
      let b_col_5 = b[k * size + (col + 5u)];
      let b_col_6 = b[k * size + (col + 6u)];
      let b_col_7 = b[k * size + (col + 7u)];
      sums[0][0] += a_row_0 * b_col_0;
      sums[0][1] += a_row_0 * b_col_1;
      sums[0][2] += a_row_0 * b_col_2;
      sums[0][3] += a_row_0 * b_col_3;
      sums[0][4] += a_row_0 * b_col_4;
      sums[0][5] += a_row_0 * b_col_5;
      sums[0][6] += a_row_0 * b_col_6;
      sums[0][7] += a_row_0 * b_col_7;
      sums[1][0] += a_row_1 * b_col_0;
      sums[1][1] += a_row_1 * b_col_1;
      sums[1][2] += a_row_1 * b_col_2;
      sums[1][3] += a_row_1 * b_col_3;
      sums[1][4] += a_row_1 * b_col_4;
      sums[1][5] += a_row_1 * b_col_5;
      sums[1][6] += a_row_1 * b_col_6;
      sums[1][7] += a_row_1 * b_col_7;
      sums[2][0] += a_row_2 * b_col_0;
      sums[2][1] += a_row_2 * b_col_1;
      sums[2][2] += a_row_2 * b_col_2;
      sums[2][3] += a_row_2 * b_col_3;
      sums[2][4] += a_row_2 * b_col_4;
      sums[2][5] += a_row_2 * b_col_5;
      sums[2][6] += a_row_2 * b_col_6;
      sums[2][7] += a_row_2 * b_col_7;
      sums[3][0] += a_row_3 * b_col_0;
      sums[3][1] += a_row_3 * b_col_1;
      sums[3][2] += a_row_3 * b_col_2;
      sums[3][3] += a_row_3 * b_col_3;
      sums[3][4] += a_row_3 * b_col_4;
      sums[3][5] += a_row_3 * b_col_5;
      sums[3][6] += a_row_3 * b_col_6;
      sums[3][7] += a_row_3 * b_col_7;
      sums[4][0] += a_row_4 * b_col_0;
      sums[4][1] += a_row_4 * b_col_1;
      sums[4][2] += a_row_4 * b_col_2;
      sums[4][3] += a_row_4 * b_col_3;
      sums[4][4] += a_row_4 * b_col_4;
      sums[4][5] += a_row_4 * b_col_5;
      sums[4][6] += a_row_4 * b_col_6;
      sums[4][7] += a_row_4 * b_col_7;
      sums[5][0] += a_row_5 * b_col_0;
      sums[5][1] += a_row_5 * b_col_1;
      sums[5][2] += a_row_5 * b_col_2;
      sums[5][3] += a_row_5 * b_col_3;
      sums[5][4] += a_row_5 * b_col_4;
      sums[5][5] += a_row_5 * b_col_5;
      sums[5][6] += a_row_5 * b_col_6;
      sums[5][7] += a_row_5 * b_col_7;
      sums[6][0] += a_row_6 * b_col_0;
      sums[6][1] += a_row_6 * b_col_1;
      sums[6][2] += a_row_6 * b_col_2;
      sums[6][3] += a_row_6 * b_col_3;
      sums[6][4] += a_row_6 * b_col_4;
      sums[6][5] += a_row_6 * b_col_5;
      sums[6][6] += a_row_6 * b_col_6;
      sums[6][7] += a_row_6 * b_col_7;
      sums[7][0] += a_row_7 * b_col_0;
      sums[7][1] += a_row_7 * b_col_1;
      sums[7][2] += a_row_7 * b_col_2;
      sums[7][3] += a_row_7 * b_col_3;
      sums[7][4] += a_row_7 * b_col_4;
      sums[7][5] += a_row_7 * b_col_5;
      sums[7][6] += a_row_7 * b_col_6;
      sums[7][7] += a_row_7 * b_col_7;
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
    if (row + 0u < size && col + 4u < size) {
        c[(row + 0u) * size + (col + 4u)] = sums[0][4];
    }
    if (row + 0u < size && col + 5u < size) {
        c[(row + 0u) * size + (col + 5u)] = sums[0][5];
    }
    if (row + 0u < size && col + 6u < size) {
        c[(row + 0u) * size + (col + 6u)] = sums[0][6];
    }
    if (row + 0u < size && col + 7u < size) {
        c[(row + 0u) * size + (col + 7u)] = sums[0][7];
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
    if (row + 1u < size && col + 4u < size) {
        c[(row + 1u) * size + (col + 4u)] = sums[1][4];
    }
    if (row + 1u < size && col + 5u < size) {
        c[(row + 1u) * size + (col + 5u)] = sums[1][5];
    }
    if (row + 1u < size && col + 6u < size) {
        c[(row + 1u) * size + (col + 6u)] = sums[1][6];
    }
    if (row + 1u < size && col + 7u < size) {
        c[(row + 1u) * size + (col + 7u)] = sums[1][7];
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
    if (row + 2u < size && col + 4u < size) {
        c[(row + 2u) * size + (col + 4u)] = sums[2][4];
    }
    if (row + 2u < size && col + 5u < size) {
        c[(row + 2u) * size + (col + 5u)] = sums[2][5];
    }
    if (row + 2u < size && col + 6u < size) {
        c[(row + 2u) * size + (col + 6u)] = sums[2][6];
    }
    if (row + 2u < size && col + 7u < size) {
        c[(row + 2u) * size + (col + 7u)] = sums[2][7];
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
    if (row + 3u < size && col + 4u < size) {
        c[(row + 3u) * size + (col + 4u)] = sums[3][4];
    }
    if (row + 3u < size && col + 5u < size) {
        c[(row + 3u) * size + (col + 5u)] = sums[3][5];
    }
    if (row + 3u < size && col + 6u < size) {
        c[(row + 3u) * size + (col + 6u)] = sums[3][6];
    }
    if (row + 3u < size && col + 7u < size) {
        c[(row + 3u) * size + (col + 7u)] = sums[3][7];
    }
    if (row + 4u < size && col + 0u < size) {
        c[(row + 4u) * size + (col + 0u)] = sums[4][0];
    }
    if (row + 4u < size && col + 1u < size) {
        c[(row + 4u) * size + (col + 1u)] = sums[4][1];
    }
    if (row + 4u < size && col + 2u < size) {
        c[(row + 4u) * size + (col + 2u)] = sums[4][2];
    }
    if (row + 4u < size && col + 3u < size) {
        c[(row + 4u) * size + (col + 3u)] = sums[4][3];
    }
    if (row + 4u < size && col + 4u < size) {
        c[(row + 4u) * size + (col + 4u)] = sums[4][4];
    }
    if (row + 4u < size && col + 5u < size) {
        c[(row + 4u) * size + (col + 5u)] = sums[4][5];
    }
    if (row + 4u < size && col + 6u < size) {
        c[(row + 4u) * size + (col + 6u)] = sums[4][6];
    }
    if (row + 4u < size && col + 7u < size) {
        c[(row + 4u) * size + (col + 7u)] = sums[4][7];
    }
    if (row + 5u < size && col + 0u < size) {
        c[(row + 5u) * size + (col + 0u)] = sums[5][0];
    }
    if (row + 5u < size && col + 1u < size) {
        c[(row + 5u) * size + (col + 1u)] = sums[5][1];
    }
    if (row + 5u < size && col + 2u < size) {
        c[(row + 5u) * size + (col + 2u)] = sums[5][2];
    }
    if (row + 5u < size && col + 3u < size) {
        c[(row + 5u) * size + (col + 3u)] = sums[5][3];
    }
    if (row + 5u < size && col + 4u < size) {
        c[(row + 5u) * size + (col + 4u)] = sums[5][4];
    }
    if (row + 5u < size && col + 5u < size) {
        c[(row + 5u) * size + (col + 5u)] = sums[5][5];
    }
    if (row + 5u < size && col + 6u < size) {
        c[(row + 5u) * size + (col + 6u)] = sums[5][6];
    }
    if (row + 5u < size && col + 7u < size) {
        c[(row + 5u) * size + (col + 7u)] = sums[5][7];
    }
    if (row + 6u < size && col + 0u < size) {
        c[(row + 6u) * size + (col + 0u)] = sums[6][0];
    }
    if (row + 6u < size && col + 1u < size) {
        c[(row + 6u) * size + (col + 1u)] = sums[6][1];
    }
    if (row + 6u < size && col + 2u < size) {
        c[(row + 6u) * size + (col + 2u)] = sums[6][2];
    }
    if (row + 6u < size && col + 3u < size) {
        c[(row + 6u) * size + (col + 3u)] = sums[6][3];
    }
    if (row + 6u < size && col + 4u < size) {
        c[(row + 6u) * size + (col + 4u)] = sums[6][4];
    }
    if (row + 6u < size && col + 5u < size) {
        c[(row + 6u) * size + (col + 5u)] = sums[6][5];
    }
    if (row + 6u < size && col + 6u < size) {
        c[(row + 6u) * size + (col + 6u)] = sums[6][6];
    }
    if (row + 6u < size && col + 7u < size) {
        c[(row + 6u) * size + (col + 7u)] = sums[6][7];
    }
    if (row + 7u < size && col + 0u < size) {
        c[(row + 7u) * size + (col + 0u)] = sums[7][0];
    }
    if (row + 7u < size && col + 1u < size) {
        c[(row + 7u) * size + (col + 1u)] = sums[7][1];
    }
    if (row + 7u < size && col + 2u < size) {
        c[(row + 7u) * size + (col + 2u)] = sums[7][2];
    }
    if (row + 7u < size && col + 3u < size) {
        c[(row + 7u) * size + (col + 3u)] = sums[7][3];
    }
    if (row + 7u < size && col + 4u < size) {
        c[(row + 7u) * size + (col + 4u)] = sums[7][4];
    }
    if (row + 7u < size && col + 5u < size) {
        c[(row + 7u) * size + (col + 5u)] = sums[7][5];
    }
    if (row + 7u < size && col + 6u < size) {
        c[(row + 7u) * size + (col + 6u)] = sums[7][6];
    }
    if (row + 7u < size && col + 7u < size) {
        c[(row + 7u) * size + (col + 7u)] = sums[7][7];
    }
}

//// Шейдер для вычисления произведения матриц
//
//@group(0) @binding(0) var<storage, read> a: array<f32>;
//@group(0) @binding(1) var<storage, read> b: array<f32>;
//@group(0) @binding(2) var<storage, read_write> c: array<f32>;
//@group(0) @binding(3) var<storage, read> size: u32;
//
//@compute @workgroup_size(16, 16)
//fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
//    let row = global_id.y * 8;
//    let col = global_id.x * 8;
//
//    var sums: array<array<f32, 8>, 8>;
//    for (var i = 0u; i < 8; i++) {
//        for (var j = 0u; j < 8; j++) {
//            sums[i][j] = 0.0;
//        }
//    }
//
//    for (var k = 0u; k < size; k++) {
//        for (var i = 0u; i < 8; i++) {
//            let a_element = a[(row + i) * size + k];
//            for (var j = 0u; j < 8; j++) {
//                sums[i][j] += a_element * b[k * size + (col + j)];
//            }
//        }
//    }
//
//    // Записываем результаты
//    for (var i = 0u; i < 8; i++) {
//        for (var j = 0u; j < 8; j++) {
//            let output_row = row + i;
//            let output_col = col + j;
//            if (output_row < size && output_col < size) {
//                c[output_row * size + output_col] = sums[i][j];
//            }
//        }
//    }
//}



//    let row = global_id.y;
//    let col = global_id.x * 4;
//
//    if (row >= size || col >= size) {
//        return;
//    }
//
//    var sum00: f32 = 0.0;
//    var sum01: f32 = 0.0;
//    var sum02: f32 = 0.0;
//    var sum03: f32 = 0.0;
//
//    for (var i: u32 = 0u; i < size; i = i + 1u) {
//        let a_elem = a[row * size + i];
//        sum00 = sum00 + a_elem * b[i * size + col];
//        sum01 = sum01 + a_elem * b[i * size + col + 1u];
//        sum02 = sum02 + a_elem * b[i * size + col + 2u];
//        sum03 = sum03 + a_elem * b[i * size + col + 3u];
//    }
//
//    c[row * size + col] = sum00;
//    c[row * size + col + 1u] = sum01;
//    c[row * size + col + 2u] = sum02;
//    c[row * size + col + 3u] = sum03;