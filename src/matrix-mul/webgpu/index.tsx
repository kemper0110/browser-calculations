import {Card} from "../../components/Card.tsx";
import {Alert, Button, Flex, InputNumber, Segmented, Select, Slider, Space, Typography} from "antd";
import {formatMs} from "../../utils/formatTime.ts";
import {ComputeResult} from "../../components/ComputeResult.tsx";
import {useEffect, useMemo, useState} from "react";
import {ComputeTimer} from "../../components/ComputeTimer.tsx";
import {setup} from "./gpu.ts";
import {killer} from "./killer";

const {Text, Paragraph, Link} = Typography


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

    const [calculate, setCalculate] = useState<{ fn: Awaited<ReturnType<typeof setup>> } | undefined>(undefined)
    useEffect(() => {
        (async () => {
            try {
                setCalculate({fn: await setup()})
            } catch (e) {
                console.error(e)
                setNotAvailable('Кажется, у вас нет поддержки WebGPU в этом браузере: ' + (e as Error).message)
            }
        })()
    }, [])

    const onRunClick = async () => {
        setCalculating(true)
        try {
            const matrixA = generateMatrixTyped(size);
            const matrixB = generateMatrixTyped(size);
            const {result, time} = await calculate!.fn(matrixA, matrixB, size, iterations)
            console.log('gpu result', result)
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
        <Card title={'Умножение матриц с помощью WebGPU'}>
            <Space direction={'vertical'} size={8}>
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
                <Paragraph>
                    Выполнение проводится асинхронно, но на слабых устройствах интерфейс может зависать.
                </Paragraph>
                {
                    notAvailable ? (
                        <Alert type={'error'} message={notAvailable}/>
                    ) : (
                        <Button type={'primary'} onClick={onRunClick}>
                            Запустить {calculating ? <ComputeTimer/> : ''}
                        </Button>
                    )
                }
                <Button onClick={() => {
                    killer().then(kill => kill())
                        .then(() => console.log('killed'))
                }}>
                    Kill
                </Button>
                <ComputeResult result={result}/>
            </Space>
            {/*<TextArea style={{marginTop: 16}} rows={4} readOnly={true} value={logString}/>*/}
        </Card>
    )
}