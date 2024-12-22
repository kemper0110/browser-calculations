import {Card} from "../../components/Card.tsx";
import {Alert, Button, Flex, Segmented, Select, Space, Typography} from "antd";
import {useState} from "react";
import {formatMs} from "../../utils/formatTime.ts";

import MulWorker from './js-array-worker.ts?worker'
import type {ArrayType, Message, Result} from './js-array-worker.ts'

import {ComputeResult} from "../../components/ComputeResult.tsx";
import {ComputeTimer} from "../../components/ComputeTimer.tsx";

const {Text, Paragraph, Link} = Typography


export function JsArrayCard() {
    const [size, setSize] = useState<number>(512)
    const [arrayType, setArrayType] = useState<ArrayType>('common')

    const [calculating, setCalculating] = useState<boolean>(false)

    const [result, setResult] = useState<ComputeResult | undefined>()

    const onRunClick = async () => {
        setCalculating(true)
        let w: Worker | undefined
        try {
            w = new MulWorker()
            w.postMessage({size, arrayType} satisfies Message)
            const {result, time} = await new Promise<Result>((res, rej) => {
                w!.onmessage = (e: MessageEvent<Result>) => res(e.data)
                w!.onerror = e => rej(e)
            })
            // результат не интересен, его просто отправляем в консоль
            console.log('js result', result)
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
            w?.terminate()
            setCalculating(false)
        }
    }

    return (
        <Card title={arrayType === 'common' ? 'Умножение матриц в обычных js массивах' : 'Умножение матриц в типизированных js массивах'}>
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
                <Flex align={'center'} gap={8}>
                    <Text>Тип массива</Text>
                    <Segmented<'common' | 'typed'> options={[
                        {
                            value: 'common',
                            label: 'Обычный',
                        },
                        {
                            value: 'typed',
                            label: 'Типизированный',
                        },
                    ]} value={arrayType} onChange={(value) => setArrayType(value)}/>
                </Flex>
                <Button type={'primary'} onClick={onRunClick}>
                    Запустить {calculating ? <ComputeTimer/> : ''}
                </Button>
                <ComputeResult result={result}/>
                <Paragraph>
                    {
                        arrayType === 'common' ? (
                            <>Генерируемый движком v8 <Link href={'/js-array.asm'} target={'_blank'}>ассемблер</Link> для обычных массивов.</>
                        ) : (
                            <>Генерируемый движком v8 <Link href={'/typed-array.asm'} target={'_blank'}>ассемблер</Link> для типизированных массивов.</>
                        )
                    }
                </Paragraph>
            </Space>
        </Card>
    )
}