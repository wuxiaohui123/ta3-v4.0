<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
	<head>
		<title>YOURTITLE</title>
		<%@ include file="/ta/inc.jsp"%>
        <style type="text/css">
			body{width:100%; margin:0 auto; padding: 10px 0; font-size:12px;}
			#report_wrapper{width:auto; margin:10px auto; text-align:center;}
			.report-table{font-size:12px; border-collapse:collapse; border: 1px solid #D4D4D4;}
			.report-table tr td{padding-left:4px; cursor:default;}
			.row-header{background-color:#F4F4F4; border:1px solid #D4D4D4; font-weight:bold;}
			.row-odd{background-color:#FFFFFF;}
			.row-even{background-color:#F8FBFD;}
			.row-highlight{background-color:#DAF1FF;}
			.row-selected{background-color:#3366FF; color:#FFF;}
			.row-up{background-image:url('up.png');background-position:center right;background-repeat:no-repeat; border:1px solid #D4D4D4; font-weight:bold;}
			.row-down{background-image:url('down.png');background-position:center right;background-repeat:no-repeat; border:1px solid #D4D4D4; font-weight:bold;}
			.resizeDivClass{position:absolute;background-color:#F4F4F4;width:2px;height:15px;z-index:1px;display: block;cursor:e-resize}
        </style>
        <script type="text/javascript" src="report_style.js"></script>
	    <script type="text/javascript" src="report_sort.js"></script>
	</head>
	<body style="margin:0px;padding:1px;" class="no-scrollbar" >
	<div id='pageloading'></div>
	    <report:html name="report1" reportFileName="sort.raq"
						needPageMark="no"
						generateParamForm="no"
						needLinkStyle="yes"
						width="-1"
						submit=""
						height="-1"
						useCache="yes"
			            timeout="-1"
					/>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>
