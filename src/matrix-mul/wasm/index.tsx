import {Card} from "../../components/Card.tsx";
import {Alert, Button, Flex, Select, Space, Typography} from "antd";
import {useState} from "react";
import {ComputeResult} from "../../components/ComputeResult.tsx";
import {formatMs} from "../../utils/formatTime.ts";
import {ComputeTimer} from "../../components/ComputeTimer.tsx";

import MulWorker from './wasm-worker.ts?worker'
import type {Message, Result} from './wasm-worker.ts'

const {Text} = Typography

const w: Worker = new MulWorker()

export function WasmCard() {
    const [size, setSize] = useState<number>(512)

    const [calculating, setCalculating] = useState<boolean>(false)

    const [result, setResult] = useState<ComputeResult | undefined>()


    const onRunClick = async () => {
        setCalculating(true)
        try {
            w.postMessage({size} satisfies Message)
            console.log('posted')
            const {result, time} = await new Promise<Result>((res, rej) => {
                w.onmessage = (e: MessageEvent<Result>) => res(e.data)
                w.onerror = e => rej(e)
            })
            // результат не интересен, его просто отправляем в консоль
            console.log('wasm result', result)
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
        <Card title={'Умножение матриц с помощью WebAssembly'}>
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
                <Button type={'primary'} onClick={onRunClick}>
                    Запустить {calculating ? <ComputeTimer/> : ''}
                </Button>
                <ComputeResult result={result}/>
            </Space>
        </Card>
    )
}