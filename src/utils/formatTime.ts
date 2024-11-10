export function formatMs(timeMs: number): string {
    return timeMs.toFixed(0) + 'ms'
}

export function formatSec(timeMs: number): string {
    return (timeMs / 1000).toFixed(2) + 's'
}