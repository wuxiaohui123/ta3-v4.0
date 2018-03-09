<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>不展示报表直接打印</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	<ta:box fit="true">
	<ta:panel id="f1" key="报表参数" cols="3" withButtonBar="true">
	    <ta:text id="t1" key="字段1" value="中国"/>
	    <ta:text id="t2" key="字段2" value="四川"/>
	    <ta:text id="t3" key="字段3" value="成都"/>
	    <ta:panelButtonBar align="left">
	       <ta:button id="b1" key="打印" onClick="print1()" asToolBarItem="true"/>
	       <ta:button id="b2" key="直接打印" onClick="print2()" asToolBarItem="true"/>
	       <ta:button id="b3" key="导出Excel" onClick="expExcel()" asToolBarItem="true"/>
	       <ta:button id="b4" key="导出Word" onClick="expWord()" asToolBarItem="true"/>
	    </ta:panelButtonBar>
	</ta:panel>
	</ta:box>
</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
  $("body").taLayout();
});
function print1(){	   
	 var t1 = Base.getValue("t1");
	 var t2 = Base.getValue("t2");
	 var t3 = Base.getValue("t3");
     $("#report1_printIFrame").attr("src","/ta3.9/reportServlet?action=2&name=report1&reportFileName=tc.raq&"+
	"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
	"serverPagedPrint=no&mirror=no&"+
	"paramString=t1="+encodeURI(t1)+";t2="+encodeURI(t2)+";t3="+encodeURI(t3));
};
function print2(){	   
	 var t1 = Base.getValue("t1");
	 var t2 = Base.getValue("t2");
	 var t3 = Base.getValue("t3");
     $("#report1_printIFrame").attr("src","/ta3.9/reportServlet?action=30&name=report1&reportFileName=tc.raq&"+
	"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
	"serverPagedPrint=no&mirror=no&needSelectPrinter=yes&"+
	"paramString=t1="+encodeURI(t1)+";t2="+encodeURI(t2)+";t3="+encodeURI(t3));
};
function expExcel(){
   var t1 = Base.getValue("t1");
   var t2 = Base.getValue("t2");
   var t3 = Base.getValue("t3");
   $("#report1_printIFrame").attr("src","/ta3.9/reportServlet?action=3&file=tc.raq&"+
	"srcType=file&columns=0&excelFormat=2003&"+
	"paramString=t1="+encodeURI(t1)+";t2="+encodeURI(t2)+";t3="+encodeURI(t3));
};
function expWord(){
   var t1 = Base.getValue("t1");
   var t2 = Base.getValue("t2");
   var t3 = Base.getValue("t3");
   $("#report1_printIFrame").attr("src","/ta3.9/reportServlet?action=7&file=tc.raq&"+
	"srcType=file&columns=0&"+
	"paramString=t1="+encodeURI(t1)+";t2="+encodeURI(t2)+";t3="+encodeURI(t3));
};
</script>
<%@ include file="/ta/incfooter.jsp"%>