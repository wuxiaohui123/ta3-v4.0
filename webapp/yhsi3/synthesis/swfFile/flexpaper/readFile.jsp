<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
			String filePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>

<title>在线阅读></title>
<style type="text/css" media="screen">
html,body {
	height: 100%;
}

body {
	margin: 0;
	padding: 0;
	overflow: auto;
}

#flashContent {
	display: none;
}
</style>

<script type="text/javascript" src="<%=basePath%>yhsi3/synthesis/swfFile/flexpaper/js/flexpaper_flash.js"></script>

<div style="position:absolute;left:200px;top:10px;"></div>
</head>

<body background="">
	<div style="position:absolute;left:0px;top:0px;">
		<a id="viewerPlaceHolder" style="width:990px;height:565px;display:block"></a>
		<script type="text/javascript">
	     		var fp = new FlexPaperViewer(	
						 '<%=basePath%>yhsi3/synthesis/swfFile/flexpaper/FlexPaperViewer',
						 'viewerPlaceHolder', { config : {
						 SwfFile : escape('<%=filePath%>/yhtag/<%=(String) session.getAttribute("fileName")%>'),//tomcat环境下使用 
						 //SwfFile : escape('<%=basePath%>swfFiles/<%=(String) session.getAttribute("fileName")%>
			'), //weblogic时使用						 

					Scale : 1.5, //初始化缩放比例，参数值应该是大于零的整数
					ZoomTransition : 'easeOut',//(String) Flexpaper中缩放样式，它使用和Tweener一样的样式，默认参数值为easeOut.其他可选值包括: easenone, easeout, linear, easeoutquad 

					ZoomTime : 0.5,//(Number) 从一个缩放比例变为另外一个缩放比例需要花费的时间，该参数值应该为0或更大。
					ZoomInterval : 0.1,//(Number) 缩放比例之间间隔，默认值为0.1，该值为正数。
					FitPageOnLoad : true,//(Boolean) 初始化得时候自适应页面，与使用工具栏上的适应页面按钮同样的效果。 
					FitWidthOnLoad : true,//(Boolean) 初始化的时候自适应页面宽度，与工具栏上的适应宽度按钮同样的效果。 
					PrintEnabled : false,
					FullScreenAsMaxWindow : false,//(Boolean) 当设置为true的时候，单击全屏按钮会打开一个flexpaper最大化的新窗口而不是全屏，当由于flash播放器因为安全而禁止全屏，而使用flexpaper作为独立的flash播放器的时候设置为true是个优先选择。 
					ProgressiveLoading : true,//(Boolean) 当设置为true的时候，展示文档时不会加载完整个文档，而是逐步加载，但是需要将文档转化为9以上的flash版本（使用pdf2swf的时候使用-T 9 标签）。 
					MinZoomSize : 0.8,//(Number) 最小的缩放比例
					MaxZoomSize : 2.4,//(Number) 最大的缩放比例。 
					SearchMatchAll : false, //(Boolean) 设置为true的时候，单击搜索所有符合条件的地方高亮显示。 
					InitViewMode : 'Portrait',//(String) 设置启动模式如"Portrait" or "TwoPage". 
					ViewModeToolsVisible : true,//(Boolean) 工具栏上是否显示样式选择框。
					ZoomToolsVisible : true, //(Boolean) 工具栏上是否显示缩放工具。 
					NavToolsVisible : true, //(Boolean) 工具栏上是否显示导航工具。 
					CursorToolsVisible : true, //(Boolean) 工具栏上是否显示光标工具。 
					SearchToolsVisible : true, //(Boolean) 工具栏上是否显示搜索。

					localeChain : 'en_US'// //设置地区（语言）

				}
			});
		</script>
	</div>
</body>
</html>
