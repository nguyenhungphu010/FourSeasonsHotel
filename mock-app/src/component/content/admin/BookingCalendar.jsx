import Footer from "../../admin/Footer";
import HeaderAdmin from "../../admin/Header";
import SiderAdmin from "../../admin/Sider";
import { HomeTwoTone } from "@ant-design/icons";
import { Button, Space } from "antd";
import { Breadcrumb, Layout, theme } from "antd";
import { useState } from "react";
const { Content } = Layout;


export default function BookingCalendar() {  
    const [year, setYear] = useState(2023);
	const currentYear = new Date().getFullYear(); 

    return (
        <Layout
			style={{
				minHeight: "100vh",
			}}
		>
			<SiderAdmin />
			<Layout className="site-layout">
				<HeaderAdmin />
				<Content
					style={{
						margin: "0 16px",
					}}
				>
					<Breadcrumb
						style={{
							margin: "16px 0",
						}}
					>
						<Breadcrumb.Item>
							<HomeTwoTone className="mr-1" />
							Home
						</Breadcrumb.Item>
						<Breadcrumb.Item>Revenue Statistic</Breadcrumb.Item>
						{/* <Breadcrumb.Item>Manager</Breadcrumb.Item> */}
					</Breadcrumb>
					<div
						style={{
							padding: 24,
						}}
					>
						<div>
							<h1
								style={{
									textAlign: "center",
									fontSize: "30px",
									marginBottom: "20px",
								}}
							>
								Booking Calendar
							</h1>
						</div>
					</div>

					{/* design the chart  */}
					<div style={{ marginBottom: "30px" }}>
						<Space wrap>
							<Button
								type="primary"
								style={{
									backgroundColor: year == currentYear - 3 ? "red" : "#1677FF",
								}}
								onClick={() => setYear(currentYear - 3)}
							>
								2020
							</Button>
							<Button
								type="primary"
								style={{
									backgroundColor: year == currentYear - 2 ? "red" : "#1677FF",
								}}
								onClick={() => setYear(currentYear - 2)}
							>
								2021
							</Button>
							<Button
								type="primary"
								style={{
									backgroundColor: year == currentYear - 1 ? "red" : "#1677FF",
								}}
								onClick={() => setYear(currentYear - 1)}
							>
								2022
							</Button>
							<Button
								type="primary"
								style={{
									backgroundColor: year == currentYear ? "red" : "#1677FF",
								}}
								onClick={() => setYear(currentYear)}
							>
								2023
							</Button>
						</Space>
					</div>


				</Content>
				<Footer />
			</Layout>
		</Layout>
    ); 
}