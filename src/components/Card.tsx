import {Card as AntdCard, CardProps} from "antd";

export const Card = (props: CardProps) => <AntdCard {...props} classNames={{
    ...props.classNames,
    title: props.classNames?.title + ' card-title'
}} style={{width: '100%', ...props.style}}/>
