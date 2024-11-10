// import {mulParallel} from "./matrix-mul/worker/worker-preload";
// import {generateMatrixWorker} from "./matrix-mul/worker/generate.ts";
import {Layout, Space, theme, Typography} from "antd";
import {JsArrayCard} from "./matrix-mul/js-array";
import {WebGPUCard} from "./matrix-mul/webgpu";

const {Title} = Typography;
const {Header, Content, Footer} = Layout
// import {generateMatrixBasic, mulBasic} from "./matrix-mul/basic.ts";
// import {generateMatrixTyped, mulTyped} from "./matrix-mul/typed.ts";
//
// const generateMatrix = generateMatrixWasm
// const mul = mulWasmReturningGlue

// const generateMatrix = generateMatrixTyped
// const mul = mulTyped

// const mul = mulBasic
// const generateMatrix = generateMatrixBasic


function App() {
    const {
        token: {colorBgContainer, borderRadiusLG},
    } = theme.useToken();

    return (
        <Layout style={{
            minHeight: '100dvh',
        }}>
            <Header
                style={{
                    width: '100%',
                    display: 'flex',
                    alignItems: 'center',
                    height: '100px'
                }}
            >
                <Title level={3} style={{color: 'white'}}>
                    Matrix Multiplication Tester
                </Title>
            </Header>
            <Content>
                <div style={{
                    width: '100%',
                    display: 'flex',
                    justifyContent: 'center',
                }}>
                    <Space direction="vertical" size={16}
                           style={{
                               maxWidth: '1024px',
                               width: '100%',
                               padding: 24,
                               background: colorBgContainer,
                               borderRadius: borderRadiusLG,
                           }}
                    >
                        <JsArrayCard/>
                        <WebGPUCard/>
                    </Space>
                </div>
            </Content>
            <Footer style={{textAlign: 'center'}}>
                Голосуев Данил Витальевич ©{new Date().getFullYear()}
            </Footer>
        </Layout>
    )
}

export default App
