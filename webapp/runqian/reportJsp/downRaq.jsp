<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>

<html>
<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
 
//�õ��ļ�·��
try{

	String raqName=request.getParameter("raqName");
	String filePath=   request.getSession().getServletContext().getRealPath("/runqian/reportFiles/"+raqName);
	//�õ��ļ�����"�ͻ���Ϣ����ģ��.xls";
	String fileName =  filePath.substring(filePath.lastIndexOf("/")+1,filePath.length()).toString();
	//��������
	InputStream inStream=new FileInputStream(filePath);//�ļ��Ĵ��·��
	//��������ĸ�ʽ 
	response.reset(); 
	response.setContentType("application/vnd.ms-excel;charset=gb2312");
	//����raq����
	String expName=filePath.substring(filePath.lastIndexOf("\\")+1,filePath.length());
	 
	response.addHeader("Content-Disposition","attachment; filename=\"" + java.net.URLEncoder.encode("DEL-"+expName, "UTF-8") + "\"");
	//ѭ��ȡ�����е����� 
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
