import {Card} from "../../components/Card.tsx";
import {Alert, Button, Flex, InputNumber, Select, Slider, Space, Typography} from "antd";
import {formatMs} from "../../utils/formatTime.ts";
import {ComputeResult} from "../../components/ComputeResult.tsx";
import {useEffect, useState} from "react";
import {ComputeTimer} from "../../components/ComputeTimer.tsx";
import {calculate, GpuComputeMethod} from "./gpu.ts";
import {killer} from "./killer";

const {Text} = Typography


function generateMatrixTyped(size: number): Float32Array {
    const result = new Float32Array(size * size);
    for (let i = 0; i < size; i++)
        for (let j = 0; j < size; j++)
            result[i * size + j] = Math.floor(Math.random() * 10);
    return result;
}


export function WebGPUCard() {
    const [size, setSize] = useState<number>(768)
    const [iterations, setIterations] = useState<number>(20)

    const [calculating, setCalculating] = useState<boolean>(false)

    const [result, setResult] = useState<ComputeResult | undefined>()

    const [notAvailable, setNotAvailable] = useState<string | undefined>(undefined)
    const [method, setMethod] = useState<GpuComputeMethod>('basic')

    const onRunClick = async () => {
        setCalculating(true)
        try {
            const matrixA = generateMatrixTyped(size);
            const matrixB = generateMatrixTyped(size);
            // const {result: r1, time: t1} = await calculate('basic', matrixA, matrixB, size, iterations)
            const {result: r2, time: t2} = await calculate(method, matrixA, matrixB, size, iterations)
            // console.log('gpu result', r1, r2)
            console.log('gpu result', r2)
            setResult({
                kind: 'ok',
                // value: formatMs(t1) + ' ' + formatMs(t2)
                value: formatMs(t2)
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
        <Card title={'Умножение матриц с помощью WebGPU'}>
            <Space direction={'vertical'} size={8}>
                <Flex align={'center'} gap={8}>
                    <Text>Метод умножения</Text>
                    <Select<GpuComputeMethod> options={[
                        {
                            value: '',
                            label: '',
                        },
                        {
                            value: 2560,
                            label: '2560x2560',
                        },
                        {
                            value: 3200,
                            label: '3200x3200',
                        },
                    ]} value={size} onChange={(value) => setSize(value)}/>
                </Flex>
                <Flex align={'center'} gap={8}>
                    <Text>Размер матрицы</Text>
                    <Select<number> options={[
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
                            value: 768,
                            label: '768x768',
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
                        {
                            value: 2560,
                            label: '2560x2560',
                        },
                        {
                            value: 3200,
                            label: '3200x3200',
                        },
                    ]} value={size} onChange={(value) => setSize(value)}/>
                </Flex>
                <Flex wrap={true} align={'center'} gap={8}>
                    <Text>Количество итераций</Text>
                    <Slider min={1} max={20} style={{
                        width: 200
                    }}
                            onChange={v => setIterations(v)}
                            value={iterations}
                    />
                    <InputNumber
                        min={1}
                        max={2000}
                        value={iterations}
                        onBlur={e => {
                            const value = Number.parseInt(e.target.value)
                            if (Number.isNaN(value)) return
                            setIterations(value)
                        }}
                    />
                </Flex>
                <Alert type={'warning'} message={<> Выполнение проводится асинхронно, но на слабых устройствах интерфейс может зависать. </>}/>
                {
                    notAvailable ? (
                        <Alert type={'error'} message={notAvailable}/>
                    ) : (
                        <Button type={'primary'} onClick={onRunClick}>
                            Запустить {calculating ? <ComputeTimer/> : ''}
                        </Button>
                    )
                }
                {/*<Button onClick={() => {*/}
                {/*    killer().then(kill => kill())*/}
                {/*        .then(() => console.log('killed'))*/}
                {/*}}>*/}
                {/*    Kill*/}
                {/*</Button>*/}
                <ComputeResult result={result}/>
            </Space>
            {/*<TextArea style={{marginTop: 16}} rows={4} readOnly={true} value={logString}/>*/}
        </Card>
    )
}