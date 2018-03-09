<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>pensionpaidInfoDetail</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印" onClick="print()" asToolBarItem="true" display="false" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" icon="xui-icon-spotClose" key="关闭" onClick="gb()" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" labelWidth="130" required="true" minLength="1" bpopTipMsg="可输入单位管理码、单位ID、单位名称查询" onChange="callDwRPC();" columnWidth="0.9" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aae044" key="单位名称" display="false" />
			<ta:text id="yak005" key="是否事业单位" display="false" />
			<ta:text id="aae140" key="险种类型" display="false" />
			<ta:text id="yab003" key="经办机构" display="false" />
			<ta:date id="aae002" key="拨付期号" issue="true" showSelectPanel="true" required="true" />
		</ta:panel>
		<ta:panel id="pensionpaidPanel" key="拨付明细信息" fit="true">
			<ta:datagrid id="pensionpaidInfoDtailGrid" fit="true" columnFilter="true" haveSn="true" selectType="radio">
				<ta:datagridItem id="ykc005" key="是否事业单位" collection="sfbz" width="80" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aac001" key="个人编号" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aac003" key="姓名" width="80" dataAlign="left" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aad002" key="实发日期" dataType="date" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aac001_gy" key="供养亲属" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae037" key="支付人员类别" width="120" dataAlign="center" align="center" collection="AAE037">
				</ta:datagridItem>
				<ta:datagridItem id="aae145" key="发放方式" collection="AAE145" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aaf002" key="开户银行类别" collection="AAF002" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae010" key="银行账号" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="aae009" key="银行户名" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="jehj" key="金额合计" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="jcylj" key="基本养老金" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="zhfh" key="账户继承" totals="sum" width="100" collection="AAC063" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="szf" key="丧葬费" totals="sum" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="ycxknbz" key="困难补助费" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="jjf" key="救济费" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="bthj" key="补发费用不含企业发" totals="sum" width="120" dataAlign="right" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="yfswdy" key="预发死亡待遇" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="ycxylj" key="一次性养老金" totals="sum" width="100" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="qyzf" key="企业支付" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:datagridItem id="ycxfxj" key="一次性抚恤金" totals="sum" width="120" dataAlign="center" align="center" hiddenColumn="true">
				</ta:datagridItem>
				<ta:datagridItem id="ygswycxfxj" key="因工死亡一次性抚恤金" totals="sum" width="120" dataAlign="center" align="center">
				</ta:datagridItem>
				<ta:dataGridToolPaging url="" showExcel="true" showCount="true" selectExpButtons="1" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float","left");
		initializeSuggestFramework(2,null,"aab001",700,200,3,null,1,false);
	});
	
	// 单位RPC
	function callDwRPC(){
		sfwQueryUtil_newRPC(2,"getAb01String",{"dto['inputString']":Base.getValue("aab001")});
	}
	
	// 打开单位信息查询页面
	function showDwRPC(){
        Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,fn_setDwData,true);
	}
	
	// 查询单位信息回调函数
	function fn_setDwData(){
		
	}
	
	function query(){
		Base.submit("form1","pensionPaidInfoDetailAction!queryPensionpaidInfoDetail.do");
	}
	
	function gb(){
	    parent.Base.closeWindow("pensionpaidInfo");
	}
	
	function print(){
		var aab001 = Base.getValue("aab001");
		var aae002 = Base.getValue("aae002");
		var yab003 = Base.getValue("yab003");
		var aae140 = Base.getValue("aae140");
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=ylbfqkbdxxxq_yl.raq&" 
	    		+ "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" 
	    		+ "serverPagedPrint=no&mirror=no&" + "paramString=aab001=" + aab001 + ";aae002="+ aae002
				+ ";aae140=" + aae140 + ";yab003=" + yab003);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>