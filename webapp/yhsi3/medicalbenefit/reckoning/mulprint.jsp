<%@ page contentType="text/html;charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report"%>
<%@ page session="true"
	import="java.lang.StringBuffer,com.runqian.report4.usermodel.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.view.*"%>
<%@ page import="com.runqian.base4.util.*"%>
<%@ taglib prefix="ta" uri="/ta3"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ȷ����ӡ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="/runqian/reportJsp/css/styles.css" />
<style type="text/css">
.style1 {
	font-size: 18px;
	color: #0000FF;
}

a {
	TEXT-DECORATION: none
}

.style3 {
	font-size: 12px;
	font-family: "����";
	color: #0000FF;
}

.style4 {
	color: #666666
}

.style5 {
	font-size: 12pt
}

.style6 {
	color: #0000FF
}

.style7 {
	color: #000000
}

.style15 {
	font-family: "����";
	font-size: 20px;
	color:blue;
}
.mul-div{
}
</style>
</head>
<body style="margin:0px;padding:0px;background:#FFFFCC;">
	<br /><br />
	<div class="mul-div">
		<p align="center" class="style4 style1">
			<strong>
				<span class="style6">
					<span class="style7">
						<span class="style15">ȷ��������ӡ?</span>
					</span>
				</span>
			</strong>
		</p><br /> <br />
		<div align="center">
			<%
				//��JSP������ʽΪ��report={�޲���������}{����1(����1=value1;����2=value2;...)}{����2(����1=value1;����2=value2;...)}...prompt=yes

				request.setCharacterEncoding("GBK");
				String prompt = request.getParameter("prompt");
				String report = request.getParameter("report");
				if (report == null || report.trim().length() == 0)
					throw new Exception(
							"�����뱨���ļ�����������report={�޲���������}{����1(����1=value1;����2=value2;...)}{����2(����1=value1;����2=value2;...)}...");
				String appmap = request.getContextPath();
				String serverPort = String.valueOf(request.getServerPort());
				String serverName = request.getServerName();
				String appRoot = "http://" + serverName + ":" + serverPort + appmap;
			%>

			<object classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"
				codebase="<%=appRoot%>/j2re-1_4_1-windows-i586-i.exe#Version=1,4,1,0"
				width="40" height="18" id="report1_directPrintApplet"
				style="vertical-align:middle;position:relative;top:-2px;">
				<param name="name" value="report1_directPrintApplet">
				<param name="code"
					value="com.runqian.report4.view.applet.DirectPrintApplet.class">
				<param name="archive"
					value="<%=appmap%>/runqian/runqianReport4Applet.jar">
				<param name="type" value="application/x-java-applet;version=1.4">
				<param name="appRoot" value="<%=appRoot%>">
				<param name="dataServlet" value="/reportServlet?action=1">
				<param name="needSelectPrinter" value="yes">
				<param name="srcType" value="file">
				<param name="fontFace" value="����">
				<param name="fontSize" value="18px">
				<param name="fontColor" value="#0000FF">
				<param name="label" value="ȷ��">
				<param name="needPrintPrompt" value="<%=prompt%>">
				<param name="scriptable" value="true">

				<!-- [����������������] -->
				<!--[if !IE]>-->
				<object type="application/x-java-applet;version=1.4"
					style="vertical-align:middle;position:relative;top:-2px;"
					archive="<%=appmap%>/runqian/runqianReport4Applet.jar" width="40"
					height="19" name="report1_directPrintApplet" label="ȷ��"
					needPrintPrompt="<%=prompt%>" srcType="file"
					dataServlet="/reportServlet?action=1" appRoot="<%=appRoot%>"
					code="com.runqian.report4.view.applet.DirectPrintApplet.class"
					needSelectPrinter="yes" scriptable="true" fontSize="18px"
					fontFace="����" fontColor="#0000FF"> </object>
				<!--<![endif]-->
			</object>
			&nbsp;&nbsp;&nbsp;<a href="javascript:fnClose()"
				class="style3 style5">ȡ��</a>
		</div>
	</div>
</body>
</html>
<script language=javascript>
	//�˺������صĸ�ʽΪ��"{�޲���������}{����1(����1=value1;����2=value2;...)}{����2(����1=value1;����2=value2;...)}..."
	function runqian_getPrintReports() {
		//���ڴ˺�������ϴ�ӡǰ��Ҫ�Ĵ�����󷵻���Ҫ��ӡ�ı���
		return "<%=report%>";
	}
	
	function fnClose(){
		window.parent.Base.closeWindow("main");
	}
</script>
