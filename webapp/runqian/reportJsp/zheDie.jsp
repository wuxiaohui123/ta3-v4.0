<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@ include file="/ta/inc.jsp"%>
	<link type="text/css" href="css/style.css" rel="stylesheet"/>
	<link rel="stylesheet" href="zhedie/default.css" type="text/css"/>
	<script type="text/javascript" src="zhedie/report_tree.js"></script>
</head>
<body>
<ta:pageloading/>
<table align="left">
   <button onclick="downRaq()">下载模板</button>
</table>
<center>
		<report:html name="report1" srcType="file"
			reportFileName="zhedie.raq"
			funcBarLocation="" width="-1" height="-1"
		/>
</center>
<ta:box id="pxs"></ta:box>
</body>
</html>
<script language="javascript">
$(document).ready(function(){
    $("body").taLayout();
	var t = 'report1';
	// 清空所有表格样式
	$('#'+t).get()[0].style.cssText = '';
	$('#'+t).find("td").css({"border":"solid 1px","border-color":"#8DB2E3"});
	// 设置奇数行样式
	$('tr:nth-child(odd)').find('td').removeClass().addClass('row-odd');
	// 设置偶数行样式
	$('tr:nth-child(even)').find('td').removeClass().addClass('row-even');
	// 设置表头样式
	$('tr:nth-child(1)').find('td').removeClass().addClass('row-header');
	//设置文字居左
	$('tr:gt(0)').find('td').addClass('text-left');
	//将指定报表渲染为折叠报表
	ReportTreeManager.init("report1");
});
$(function(){
	// 设置高亮
	$('tr:gt(0)').hover(function(){
		$(this).find('td').addClass('row-highlight');
	},function(){
		$(this).find('td').removeClass('row-highlight');
	});
});
function downRaq(){
	 	 var raqName="zhedie.raq";
	  	 window.open(Base.globvar.contextPath+"/runqian/reportJsp/downRaq.jsp?raqName="+raqName);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>