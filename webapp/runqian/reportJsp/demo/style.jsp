<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
	<head>
		<title>自定义样式</title>
		<%@ include file="/ta/inc.jsp"%>
		<style type="text/css">
		    .row-header{background-color:#F4F4F4; border:1px solid #D4D4D4; font-weight:bold;}
            .row-odd{background-color:#FFFFFF;}
            .row-even{background-color:#F8FBFD;}
            .row-highlight{background-color:#DAF1FF;}
            .text-left{text-align:left;}
		</style>
	</head>
	<body>
	   <ta:pageloading />
	   <ta:tabs fit="true" id="styleReport">
	     <ta:tab id="r1" key="无样式">
	       <ta:box fit="true" cssStyle="overflow:auto">
	       <report:html name="report1" srcType="file"
			reportFileName="styleReport.raq"
			funcBarLocation="" width="-1" height="-1"
		    />
		    </ta:box>
	     </ta:tab>
	     <ta:tab id="r2" key="有样式">
	      <ta:box fit="true" cssStyle="overflow:auto">
	       <report:html name="report2" srcType="file"
			reportFileName="styleReport.raq"
			funcBarLocation="" width="-1" height="-1"
		    />
		  </ta:box>
	     </ta:tab>
	   </ta:tabs>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
		var t = 'report1';
	    // 清空所有表格样式
	    $('#'+t).get()[0].style.cssText = '';
	    $('#'+t).find("td").css({"border":"solid 1px","border-color":"#8DB2E3"});
	    // 设置奇数行样式
	    $('#report1 tr:nth-child(odd)').find('td').removeClass().addClass('row-odd');
	    // 设置偶数行样式
	    $('#report1 tr:nth-child(even)').find('td').removeClass().addClass('row-even');
	    // 设置表头样式
	    $('#report1 tr:nth-child(1)').find('td').removeClass().addClass('row-header');
	    //设置文字居左
	    $('#report1 tr:gt(0)').find('td').addClass('text-left');
	});
	$(function(){
	// 设置高亮
	$('#report1 tr:gt(0)').hover(function(){
		$(this).find('td').addClass('row-highlight');
	},function(){
		$(this).find('td').removeClass('row-highlight');
	});
});
</script>
<%@ include file="/ta/incfooter.jsp"%>
