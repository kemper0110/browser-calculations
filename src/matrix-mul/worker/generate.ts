export function generateMatrixWorker(size: number): Float64Array {
  const buff = new SharedArrayBuffer(Float64Array.BYTES_PER_ELEMENT * size * size);
  const result = new Float64Array(buff);
  for (let i = 0; i < size; i++)
    for (let j = 0; j < size; j++)
      result[i * size + j] = Math.random();
  return result;
}