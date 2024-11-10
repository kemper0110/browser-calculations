import {usePerformance} from "../hooks/usePerformance.ts";
import {formatSec} from "../utils/formatTime.ts";
import {Typography} from "antd";

const {Text} = Typography


export function ComputeTimer() {
    const [timer] = usePerformance()
    return (
        <Text style={{color: 'white'}}>{formatSec(timer)}</Text>
    )
}