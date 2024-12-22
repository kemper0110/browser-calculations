const BLOCKSIZE: u32 = 16;
const TILE_M: u32 = 4;
const TILE_N: u32 = 4;

@compute @workgroup_size(BLOCKSIZE, BLOCKSIZE)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let row = global_id.y * TILE_M;
    let col = global_id.x * TILE_N;

    // initialize the array with all 0s
    var sums: array<array<f32, TILE_N>, TILE_M>;
    for (var i = 0u; i < TILE_M; i++) {
        for (var j = 0u; j < TILE_N; j++) {
            sums[i][j] = 0.0;
        }
    }

    // Вычисляем 2D-фрагмент
    for (var k = 0u; k < dimensions.K; k++) {
        // для каждой строки
        for (var i = 0u; i < TILE_M; i++) {
            let a_element = a[(row + i) * dimensions.K + k];
            // вычисляем скалярное произведение
            for (var j = 0u; j < TILE_N; j++) {
                let b_element = b[k * dimensions.N + (col + j)];
                sums[i][j] += a_element * b_element;
            }
        }
    }

    // Записываем результаты
    for (var i = 0u; i < TILE_M; i++) {
        for (var j = 0u; j < TILE_N; j++) {
            let output_row = row + i;
            let output_col = col + j;
            if (output_row < dimensions.M && output_col < dimensions.N) {
                result[output_row * dimensions.N + output_col] = sums[i][j];
            }
        }
    }
}