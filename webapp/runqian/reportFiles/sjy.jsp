<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="com.runqian.report4.usermodel.*"%>
<%@ page import="com.runqian.report4.util.*,java.sql.*"%>

<%
    //���û������������������ݿ����ӣ�
	Context context = new Context();
//�������ݿ�������θĳ������Լ��ķ�ʽ���У�����con����
	Driver driver = (Driver) Class.forName("org.hsqldb.jdbcDriver").newInstance();
	DriverManager.registerDriver(driver);
	Connection con= DriverManager.getConnection("jdbc:hsqldb:hsql://localhost/runqianDB","sa","");
   System.out.println(con);
    context.setConnection(context.getDefDataSourceName(),con);
    request.setAttribute( "myContext", context );	
%>

<report:html name="report1"
    reportFileName="sjy.raq"
    contextName="myContext"
/>
