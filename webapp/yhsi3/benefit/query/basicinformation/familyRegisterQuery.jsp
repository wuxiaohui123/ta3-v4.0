<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>familyRegisterQuery</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body style="margin:0px;padding:0px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">
		<ta:panel id="jbxxfset" key="死亡人员基本信息" cols="3">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<ta:text id="qxkzAction" key="qxkzAction" display="false" />
			<ta:text id="yab003" key="经办机构" display="false" />
			<ta:selectInput id="rylx" key="查询人员类型" labelWidth="130" required="true" data="[{'id':'0','name':'死亡人员'},{'id':'1','name':'供养人员'}]" />
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" labelWidth="130" required="true" columnWidth="0.9" onChange="callRyRPC();" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();" />
				</ta:buttonLayout>
			</ta:box>
			<ta:text id="aab001" key="单位编号" labelWidth="130" />
			<ta:selectInput id="gynn" key="供养到期年龄" labelWidth="130" data="[{'id':'18','name':'18岁以上人员供养到期人员'}]" />
		</ta:panel>
		<ta:panel id="gyqs" key="供养亲属信息[双击查看待遇详情]" fit="true">
			<ta:datagrid id="gyqsxxGrid" fit="true" onRowDBClick="QueryInfo" columnFilter="true">
				<ta:datagridItem icon="xui-icon-spotPrint" key="打印" id="printBtn" width="80" align="center" click="fnPtint" />
				<ta:datagridItem id="swrybh" key="死亡人员编号" width="140" formatter="convertState" />
				<ta:datagridItem id="swryxm" key="死亡人员姓名" width="140" formatter="convertState" />
				<ta:datagridItem id="aac001" key="供养人员编号" width="140" />
				<ta:datagridItem id="aae140" key="险种类型" width="140" hiddenColumn="false" />
				<ta:datagridItem id="aac002" key="证件号码" width="140" />
				<ta:datagridItem id="aac003" key="姓名" width="60" />
				<ta:datagridItem id="aac004" key="性别" collection="AAC004" width="60" />
				<ta:datagridItem id="aac006" key="出生日期" />
				<ta:datagridItem id="aae044" key="单位名称" width="100" />
				<ta:datagridItem id="aae116" key="待遇发放状态" width="100" collection="AAE116" />
				<ta:datagridItem id="aae210" key="待遇应享受开始年月" width="130" />
				<ta:datagridItem id="aac086" key="孤寡标志" collection="AAC086" />
				<ta:datagridItem id="aae144" key="供养关系" collection="AAE144" width="100" />
				<ta:datagridItem id="yac520" key="是否丧失劳动能力" width="120" collection="AAC086" />
				<ta:datagridItem id="aic172" key="享受比例" />
				<ta:datagridItem id="aae235" key="待遇享受终止年月" width="120" />
				<ta:datagridItem id="aae013" key="备注" />
				<ta:datagridItem id="aae006" key="联系地址" />
				<ta:datagridItem id="aae005" key="联系电话" />
				<ta:datagridItem id="aae007" key="邮政编码" />
				<ta:datagridItem id="aae004" key="联系人" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("form").css("overflow","auto");
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float","left");
		initializeSuggestFramework(1, null, "aac001", 600, 200,5,"",2,false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
	});
	
	/* 个人编号RPC */
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAc01String', {"dto['inputString']" : Base.getValue("aac001")});
	}
	
	function convertState(row, cell, value, columnDef, dataContext){
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>"+value+"</div>";
	}
	
	//回调函数
	function fn_queryInfo(){
	   if (g_Suggest!=""){        
	   		fn_setPersonBaseInfoData();
			Base.submit("jbxxfset",Base.getValue("qxkzAction")+"!queryFamilyInfo.do");
	   }
	}
	
	function query(){
		     Base.submit("jbxxfset",Base.getValue("qxkzAction")+"!queryFamilyInfo.do");
		}
	
	function QueryInfo(e, rowdata){
		Base.openWindow("queryinfo", ">>待遇发放明细","familyRegisterQueryAction!queryInfo.do", {
			"dto['aac001']" : rowdata.aac001,
			"dto['aae140']" : rowdata.aae140
			}, "95%", "90%", null, null, true);
		
	}
	
	function convertState(row, cell, value, columnDef, dataContext){
		return "<div style='color:blue;margin-top:4px'>"+value+"</div>";
	}
	
	//打印供养人员--年审证
	function fnPtint(data,e){
	    var aac111 = data.swrybh;
		var aae140 = data.aae140;
		var yab003 = Base.getValue("yab003");
		var aac001 = data.aac001;
		$("#report1_printIFrame").attr("src","<%=path%>
	/reportServlet?action=2&name=report1&reportFileName=i_gyhd_nsz.raq&" + "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&" + "serverPagedPrint=no&mirror=no&" + "paramString=aac001=" + aac001 + ";aac111=" + aac111
						+ ";aae140=" + aae140 + ";yab003=" + yab003);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>