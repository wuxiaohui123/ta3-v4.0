<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>

<html>
<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
 
//得到文件路径
try{

	String raqName=request.getParameter("raqName");
	String filePath=   request.getSession().getServletContext().getRealPath("/runqian/reportFiles/"+raqName);
	//得到文件名称"客户信息导入模板.xls";
	String fileName =  filePath.substring(filePath.lastIndexOf("/")+1,filePath.length()).toString();
	//读到流中
	InputStream inStream=new FileInputStream(filePath);//文件的存放路径
	//设置输出的格式 
	response.reset(); 
	response.setContentType("application/vnd.ms-excel;charset=gb2312");
	//导出raq名字
	String expName=filePath.substring(filePath.lastIndexOf("\\")+1,filePath.length());
	 
	response.addHeader("Content-Disposition","attachment; filename=\"" + java.net.URLEncoder.encode("DEL-"+expName, "UTF-8") + "\"");
	//循环取出流中的数据 
	byte[] b = new byte[1024]; 
	int len; 
	while((len=inStream.read(b)) >0) 
	response.getOutputStream().write(b,0,len);  
	inStream.close(); 
		
	OutputStream os=response.getOutputStream();
	os.flush();
	os.close();

	out.clear();
	out = pageContext.pushBody();

}catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>
