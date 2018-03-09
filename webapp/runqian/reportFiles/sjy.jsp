<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="com.runqian.report4.usermodel.*"%>
<%@ page import="com.runqian.report4.util.*,java.sql.*"%>

<%
    //设置环境变量（参数和数据库连接）
	Context context = new Context();
//下面数据库连接这段改成你们自己的方式就行，返回con即可
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
