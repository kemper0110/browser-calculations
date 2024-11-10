import {Typography} from "antd";

export type ComputeResult = OkComputeResult | ErrComputeResult
export type OkComputeResult = {
    kind: 'ok'
    value: string
}
export type ErrComputeResult = {
    kind: 'err'
    value: string
}

const {Text} = Typography


export function ComputeResult({result}: {result?: ComputeResult}) {
    if(!result) return null

    return (
        {
            ok: <Text type={'success'}>{result.value}</Text>,
            err: <Text type={'danger'}>{result.value}</Text>
        }[result.kind]
    )
}