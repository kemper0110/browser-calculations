// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-expect-error
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import MatWorker from "./parallel-worker.ts?worker";
import {useState} from "react";
import {ComputeResult} from "../../components/ComputeResult.tsx";
import {Card} from "../../components/Card.tsx";
import {Alert, Button, Flex, InputNumber, Select, Slider, Space, Typography} from "antd";
import {ComputeTimer} from "../../components/ComputeTimer.tsx";
import {mulParallel} from "./worker-preload";
import {formatMs} from "../../utils/formatTime.ts";

// const numWorkers = navigator.hardwareConcurrency || 4;
// // const numWorkers = 4;
// const workers = Array.from({length: numWorkers},
//   () => new MatWorker());

// export async function mulParallel(a: Float64Array, b: Float64Array, result: Float64Array, size: number) {
//   const rowsPerWorker = Math.ceil(size / numWorkers);
//   console.log('rowsPerWorker', size / numWorkers)
//
//   await Promise.all(
//     Array.from({length: numWorkers}, (_, i) => i).map(i =>
//       new Promise((res, rej) => {
//         const worker = workers[i];
//         const startRow = i * rowsPerWorker;
//         const endRow = Math.min(startRow + rowsPerWorker, size);
//         console.log('started worker')
//         worker.postMessage({
//           a: a.buffer,
//           b: b.buffer,
//           result: result.buffer,
//           size,
//           startRow,
//           endRow,
//         });
//         worker.onmessage = function () {
//           res();
//         };
//         worker.onerror = function (error) {
//           rej(error);
//         };
//       }))
//   )
// }


const {Text} = Typography

export function WorkerCard() {
    const concurrency = navigator.hardwareConcurrency

    const [size, setSize] = useState<number>(512)
    const [threads, setThreads] = useState<number>(concurrency >= 4 ? 4 : concurrency)

    const [calculating, setCalculating] = useState<boolean>(false)
    const [result, setResult] = useState<ComputeResult | undefined>()

    const onRunClick = async () => {
        setCalculating(true)
        try {
            const {time, result} = await mulParallel(threads, size)
            console.log('workers result', result)
            setResult({
                kind: 'ok',
                value: formatMs(time)
            })
        } catch (e) {
            setResult({
                kind: 'err',
                // eslint-disable-next-line @typescript-eslint/ban-ts-comment
                // @ts-ignore
                value: e.message ?? e
            })
        } finally {
            setCalculating(false)
        }
    }

    return (
        <Card title={'Умножение матриц с помощью нескольких web worker'}>
            <Space direction={'vertical'} size={8}>
                <Flex align={'center'} gap={8}>
                    <Text>Размер матрицы</Text>
                    <Select<number> style={{minWidth: 100}} options={[
                        {
                            value: 128,
                            label: '128x128',
                        },
                        {
                            value: 256,
                            label: '256x256',
                        },
                        {
                            value: 512,
                            label: '512x512',
                        },
                        {
                            value: 1024,
                            label: '1024x1024',
                        },
                        {
                            value: 1536,
                            label: '1536x1536',
                        },
                        {
                            value: 2048,
                            label: '2048x2048',
                        },
                    ]} value={size} onChange={(value) => setSize(value)}/>
                </Flex>
                <Alert type={'info'} message={<>На вашем устройстве доступно {concurrency} потоков вычислений.</>}/>
                <Flex wrap={true} align={'center'} gap={8}>
                    <Text>Количество потоков</Text>
                    <Slider min={1} max={concurrency} style={{width: 200}}
                            onChange={v => setThreads(v)}
                            value={threads}
                    />
                    <InputNumber
                        min={1}
                        max={20}
                        value={threads}
                        onBlur={e => {
                            const value = Number.parseInt(e.target.value)
                            if (Number.isNaN(value)) return
                            setThreads(value)
                        }}
                    />
                </Flex>
                {
                    threads > concurrency ? (
                        <Alert type={'warning'} message={<>Вы выбрали больше потоков, чем доступно на вашем устройстве. Скорее всего это приведет к замедлению. </>}/>
                    ) : null
                }
                <Button type={'primary'} onClick={onRunClick}>
                    Запустить {calculating ? <ComputeTimer/> : ''}
                </Button>
                <ComputeResult result={result}/>
            </Space>
        </Card>
    )
}