<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>mateaBaseInForAction</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px" class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />

	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="margin-right:5px">

		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:text id="aae140" key="险种类型" display="false" />
			<ta:text id="aac001" key="个人" bpopTipMsg="可输入身份证号、姓名、人员ID" onChange="sfwQueryUtilDY(1,'getAac001DY',Base.getValue('aac001'),null,Base.getValue('aae140'))" />
			<ta:text id="aac003" key="姓名" readOnly="true" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004" />
			<ta:selectInput id="amc026" key="生育类别" collection="AMC026" />
			<ta:selectInput id="ymc032" key="计划生育手术类别" collection="YMC032" />
			<ta:text id="aab001" key="单位" bpopTipMsg="可输入单位名称、单位代码、单位ID" onChange="sfwQueryUtil(2,'getAab001',Base.getValue('aab001'))" />
			<ta:text id="aae044" key="单位名称" readOnly="true" />
			<ta:selectInput id="aab019" key="单位类型" collection="AAB019" />
			<ta:selectInput id="aaa076" key="核定类型" collection="AAA076" filter="51,52" reverseFilter="true" />
			<ta:selectInput id="sfjs" key="是否结算" data="[{'id':'0','name':'已结算'},{'id':'1','name':'未结算'}]" />
			<ta:selectInput id="aae016" key="复核标志" collection="AAE016" display="false" />
			<ta:date id="aae002" key="支付期号" issue="true" showSelectPanel="true" />
			<ta:selectInput id="aae110" key="支付标志" data="[{'id':'1','name':'已支付'},{'id':'0','name':'未支付'}]" />
			<ta:box span="1" cols="2">
				<ta:date id="aae036_djs" key="登记时间起" showSelectPanel="true" labelWidth="99" columnWidth="0.62" />
				<ta:date id="aae036_dje" key="至" cssStyle="color:blue" showSelectPanel="true" labelWidth="15" columnWidth="0.38" />
			</ta:box>
			<ta:box span="1" cols="2">
				<ta:date id="aae036_jss" key="结算时间起" showSelectPanel="true" labelWidth="99" columnWidth="0.62" />
				<ta:date id="aae036_jse" key="至" cssStyle="color:blue" showSelectPanel="true" labelWidth="15" columnWidth="0.38" />
			</ta:box>
			<ta:box span="1" cols="2">
				<ta:date id="aae036_zfs" key="支付时间起" showSelectPanel="true" labelWidth="99" columnWidth="0.62" />
				<ta:date id="aae036_zfe" key="至" cssStyle="color:blue" showSelectPanel="true" labelWidth="15" columnWidth="0.38" />
			</ta:box>
			<ta:box span="1" cols="2">
				<ta:number id="amc030_min" key="生育津贴>=" labelWidth="99" columnWidth="0.62" />
				<ta:number id="amc030_max" key="<=" cssStyle="color:blue" labelWidth="15" columnWidth="0.38" />
			</ta:box>
		</ta:panel>


		<ta:panel id="Ac71Panel" key="生育医疗费用结算信息" fit="true">
			<ta:datagrid id="BaseGrid" fit="true" columnFilter="true" haveSn="true" defaultColumnWidth="100" rowColorfn="fnColor">
				<!-- 按钮 -->
				<ta:datagridItem icon="xui-icon-spotPrint" key="打印审核表" id="printBtn1" width="80" align="center" click="fnPtint" />
				<ta:datagridItem icon="xui-icon-spotPrint" key="打印结算表" id="printBtn2" width="80" align="center" click="fnPtint" />
				<!-- 基本信息 -->
				<ta:datagridItem id="gr" key="个人" dataAlign="center" align="center" showDetailed="true" width="250" />
				<ta:datagridItem id="aac004" key="性别" dataAlign="center" align="center" collection="AAC004" width="60" />
				<ta:datagridItem id="age" key="年龄" dataAlign="center" align="center" width="60" />
				<ta:datagridItem id="ykc005" key="是否事业单位在编人员" dataAlign="center" align="center" collectionData="[{'id':'0','name':'非在编'},{'id':'1','name':'在编'},{'id':'2','name':'不明确'}]" sortable="true" />
				<ta:datagridItem id="dw" key="单位" dataAlign="center" align="center" showDetailed="true" width="250" />
				<ta:datagridItem id="aaa076" key="待遇核定类型" collection="AAA076" dataAlign="center" align="center" sortable="true" />
				<!-- 登记信息  -->
				<ta:datagridItem id="amc026" key="<font color='green'>生育类别</font>" collection="AMC026" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="ymc032" key="<font color='green'>手术类别</font>" collection="YMC032" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="amc020" key="<font color='green'>生育日期</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="akb021" key="<font color='green'>医疗机构名称</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="amc028" key="<font color='green'>胎儿数</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="amc031" key="<font color='green'>胎次</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="aae005" key="<font color='green'>联系电话</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="yae150" key="<font color='green'>新农合</font>" dataAlign="center" align="center" formatter="fnFormatter" totals="sum" sortable="true" />
				<ta:datagridItem id="aae198" key="<font color='green'>实际医疗费</font>" dataAlign="center" align="center" formatter="fnFormatter" totals="sum" sortable="true" />
				<ta:datagridItem key="<font color='green'>生育津贴</font>" id="amc030" align="center" dataAlign="center" formatter="fnFormatter" totals="sum" sortable="true" />
				<ta:datagridItem key="<font color='green'>医疗费</font>" id="aae187" align="center" dataAlign="center" formatter="fnFormatter" totals="sum" sortable="true" />
				<ta:datagridItem id="ake051" key="<font color='blue'>自费金额</font>" dataAlign="center" align="center" formatter="fnFormatter" totals="sum" sortable="true" />
				<ta:datagridItem id="aae129" key="<font color='blue'>基金支付</font>" dataAlign="center" align="center" formatter="fnFormatter" totals="sum" sortable="true" />
				<ta:datagridItem id="djr" key="<font color='green'>登记人</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="aae036_dj" key="<font color='green'>登记时间</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<!-- 结算信息 -->
				<ta:datagridItem id="jsjbr" key="<font color='blue'>结算经办人</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="aae036_jsjb" key="<font color='blue'>结算经办时间</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="jsspr" key="<font color='blue'>结算审批人</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="aae036_jssp" key="<font color='blue'>结算审批时间</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="aae016" key="<font color='blue'>复核标志</font>" collection="AAE016" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<!-- 支付信息 -->
				<ta:datagridItem id="zfr" key="<font color='red'>支付人</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="aae036_zf" key="<font color='red'>支付时间</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<ta:datagridItem id="aae002" key="<font color='red'>支付期号</font>" dataAlign="center" align="center" formatter="fnFormatter" sortable="true" />
				<!-- 隐藏ID -->
				<ta:datagridItem id="lx" key="登记类型" dataAlign="center" align="center" collection="AAA076" hiddenColumn="true" />
				<ta:datagridItem id="aaz157" key="人员社会保险明细ID" dataAlign="center" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aaz159" key="人员参保关系ID" dataAlign="center" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aaz170" key="人员待遇核定事件ID" dataAlign="center" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aac001" key="个人编号" dataAlign="center" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aaz002_dj" key="登记日志ID" dataAlign="center" align="center" hiddenColumn="true" />
				<ta:datagridItem id="aaz002_js" key="结算日志ID" dataAlign="center" align="center" hiddenColumn="true" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<br />
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom", "10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float", "left");
		initializeSuggestFramework(1, "ac01", "aac001", 850, 200, 7, fn_setPersonBaseInfoData, 1, false);
		initializeSuggestFramework(2, null, "aab001", 1000, 200, 7, fn_setUnitBaseInfoData, 1, false);
	});

	//开始流转(指定"开始流转"按钮的Action方法)
	function query() {
		Base.submit("form1", "mateaBaseInForAction!query.do", null, false, false, function(data) {
			Base.setPanelTitle("Ac71Panel", "生育医疗费用结算信息,合计:" + data.fieldData.rows + "人次");
		});
	}
	
	// rpc 查询给页面个人基本信息赋值
	function fn_setPersonBaseInfoData() {
		Base.setValue("aac001", g_Suggest[2]);
		Base.setValue("aac002", g_Suggest[0]);
		Base.setValue("aac003", g_Suggest[1]);
		Base.setValue("aac004", g_Suggest[3]);
	}

	//rpc 查询给页面单位基本信息赋值
	function fn_setUnitBaseInfoData() {
		Base.setValue("aab001", g_Suggest[1]);
		Base.setValue("aae044", g_Suggest[2]);
	}

	// 列渲染方法,结算但未拨付表示蓝色，已拨付红色
	function fnFormatter(row, cell, value, columnDef, dataContext) {
		var djr = dataContext.djr;//登记人
		var jsjbr = dataContext.jsjbr;//结算人
		var zfr = dataContext.zfr;//支付人
		if (zfr != null) {
			if ("" == value || null == value)
				value = "";
			else
				value = "<span style = 'color:red;margin-top:4px'>" + value + "</span>";
		} else if (jsjbr != null) {
			if ("" == value || null == value)
				value = "";
			else
				value = "<span style = 'color:blue;margin-top:4px'>" + value + "</span>";
		} else if (djr != null) {
			if ("" == value || null == value)
				value = "";
			else
				value = "<span style = 'color:green;margin-top:4px'>" + value + "</span>";
		}
		return value;
	}

	function fnColor(data) {
		if (data.lx == "51") {
			return "#FFD700";
		} else if (data.lx == "52") {
			return "#C0FF3E";
		} else {
			return "#48D1CC";
		}
	}
	
	function fnPtint(data,e){
		var cell = data.cell;
		var aaz002_dj = data.aaz002_dj;
		var aaz002_js = data.aaz002_js;
		var aae016 = data.aae016;
		if(cell==1){
			if(aaz002_dj == ''||aaz002_dj == null){
				Base.alert("未获取到登记时业务日志ID！","error");
			}else{
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_syjt_shb.raq&"+
					"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString=aaz002="+aaz002_dj);				
			}
		}
		if(cell == 2){
			if(aaz002_js == ''||aaz002_js == null){
				Base.alert("未获取到结算时业务日志ID！","error");
			}else{
				if(aae016 != '1'){
					Base.alert("此报销还未复核通过，不能打印！","error");
				}else{
			         $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_zybxjsd.raq&"+
					   "srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					   "serverPagedPrint=no&mirror=no&"+
					   "paramString=aaz002="+aaz002_js);
				}
			}
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>