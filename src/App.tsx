import {Layout, Space, theme, Typography} from "antd";
import {JsArrayCard} from "./matrix-mul/js-array";
import {WebGPUCard} from "./matrix-mul/webgpu";
import {WasmCard} from "./matrix-mul/wasm";
import {WorkerCard} from "./matrix-mul/worker";

const {Title} = Typography;
const {Header, Content, Footer} = Layout

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
                        <WorkerCard/>
                        <WasmCard/>
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
