import {useCallback, useState, useSyncExternalStore} from "react";

export function usePerformance(precision: number = 50): [number, () => void] {
    const [start, setStart] = useState(performance.now())

    const value = useSyncExternalStore(useCallback(onStoreChange => {
        const id = setInterval(onStoreChange, precision)
        return () => clearInterval(id)
    }, [precision]), performanceSnapshot(start, precision))

    const restart = useCallback(() => setStart(performance.now()), [])
    return [value, restart]
}

function performanceSnapshot(start: DOMHighResTimeStamp, precision: number) {
    return () => Math.round((performance.now() - start) / precision) * precision
}
