import {get_c, init_c, mul_global, multiply_matrices_returning, set_a, set_b, set_size} from '@dardanda/rust-mat-mul'

export function mulWasmReturningGlue(a: Float64Array, b: Float64Array, size: number): Float64Array {
  return multiply_matrices_returning(a, b, size);
}

export function generateMatrixWasm(size: number): Float64Array {
  const result = new Float64Array(size * size);
  for (let i = 0; i < size; i++)
    for (let j = 0; j < size; j++)
      result[i * size + j] = Math.random();
  return result;
}

export function prepare(size: number) {
  const a = generateMatrixWasm(size);
  const b = generateMatrixWasm(size);
  set_size(size);
  init_c();
  set_a(a);
  set_b(b);
}

export function run() {
  mul_global();
}

export function getResult() {
  return get_c();
}