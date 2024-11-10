type Message = {
  a: SharedArrayBuffer,
  b: SharedArrayBuffer,
  result: SharedArrayBuffer,
  startRow: number,
  endRow: number,
  size: number
}

self.onmessage = e => {
  const {
    a, b, result,
    startRow, endRow, size
  } = e.data as Message;
  multiplyMatrices(
    new Float64Array(a),
    new Float64Array(b),
    new Float64Array(result),
    startRow, endRow, size
  );
  self.postMessage(null);
}


// Функция умножения матриц
function multiplyMatrices(a: Float64Array, b: Float64Array, c: Float64Array, startRow: number, endRow: number, size: number) {
  const start = performance.now();
  for (let i = 0; i < size; i++) {
    for (let j = startRow; j < endRow; j++) {
      let sum = 0;
      for (let k = 0; k < size; k++)
        sum += a[i * size + k] * b[j * size + k];
      c[i * size + j] = sum;
    }
  }
  const end = performance.now();
  console.log('done', end - start);
}