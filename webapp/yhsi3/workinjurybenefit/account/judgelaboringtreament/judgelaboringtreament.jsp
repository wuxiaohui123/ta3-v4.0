<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>JudgeLaboringability</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]"  onClick="printRaq()" hotKey="ctrl+P" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<!-- 个人基本信息初始化，能否从受理页面一起传过来，按照个人ID异步查询 -->
			<ta:panel id="fset1" cols="3" key="人员基本信息">
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
				<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
				<ta:text id="aaz127" key="工伤认定信息ID" display="false"/>
				<ta:text id="userName" key="用户名" display="false"/>
			</ta:panel>

			<!-- 初始化工伤认定信息 -->
			<ta:panel key="工伤认定信息" height="83px" id="lsrdxx"  cssStyle="overflow:auto">
				<ta:datagrid id="gsxxGrid" selectType="radio" onSelectChange="fnGsxxSelectChange" forceFitColumns="true">
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="true" />
					<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="true" />
					<ta:datagridItem id="aae044" key="单位名称" width="100" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc020" key="工伤发生时间" width="95" align="center"  dataAlign="center" />
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" align="center"  dataAlign="center"/>
					<ta:datagridItem id="ala016" key="认定依据类别" width="95" collection="ALA016" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc011" key="认定书编号" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc017" key="受理日期" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc029" key="工伤认定结论" width="95" collection="ALC029" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc030" key="工伤认定机构" width="95" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc031" key="工伤认定日期" width="95" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027" align="center"  dataAlign="center"/>
				</ta:datagrid>
			</ta:panel>
			<ta:panel key="劳动能力鉴定信息" cssStyle="overflow:auto" fit="true">
				<ta:datagrid id="lc03Grid" forceFitColumns="true" fit="true" dblClickEdit="true" selectType="radio">
					<ta:datagridItem id="aaz151" key="劳动能力鉴定ID" hiddenColumn="false" />
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="false" />
					<ta:datagridItem id="alc020" key="工伤发生时间" hiddenColumn="false" />
					<ta:datagridItem id="aaz122" key="工伤待遇核定信息ID" hiddenColumn="false" />
					<ta:datagridItem id="hdbz" key="核定标识" align="center" dataAlign="center"/>
					<ta:datagridItem id="ala019" key="鉴定类别" collection="ALA019" align="center"  dataAlign="center"/>
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc060" key="护理依赖等级" collection="ALC060" width="120" align="center"  dataAlign="center"/>
					<ta:datagridItem id="ylc044" key="医疗终结期" dataType="date" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc017" key="受理日期" align="center"  dataAlign="center" />
					<ta:datagridItem id="alc034" key="鉴定结论日期" width="120" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc035" key="鉴定结论书编号" width="120" align="center"  dataAlign="center" />
					<ta:datagridItem id="aae129" key="鉴定费金额" width="120" align="center"  dataAlign="center" >
					<ta:datagridEditor type="number" precition="2"  onChange="submitData" />
					</ta:datagridItem>
					<ta:datagridItem id="aae127" key="申请日期"  align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc152" key="申请人姓名" align="center"  dataAlign="center"/>
					<ta:datagridItem id="alc049" key="申请人电话" align="center"  dataAlign="center"/>
					<ta:datagridItem id="ylc025" key="鉴定发起方" collection="YLC025" align="center"  dataAlign="center"/>
					<ta:datagridItem id="aae013" key="备注" align="center"  dataAlign="center"/>
				</ta:datagrid>
			</ta:panel>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
        
</html>
<script type="text/javascript">
	//初始化页面布局
	$(document).ready(function() {
		$("form").css("overflow","auto");
	});
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function(){
			Base.submit("","judgeLaboringabilityAction!queryPersonInfo.do");
		}, true);
	}
	
	//回调函数查询初始化页面信息
	function fn_queryInfo(){
   		if (g_Suggest!=""){
   			fn_setPersonBaseInfoData();
			Base.submit("fset1", "judgeLaboringabilityAction!queryPersonInfo.do");  
   		}
	}
	
	//取得历史劳动能力鉴定信息
	function fnGsxxSelectChange(rowsData,n){
		if(rowsData == ""){
			return false;
		}
		
	 	var alc021 = rowsData[0].alc021;
	 	if('1' == alc021||'4' == alc021){
		 	Base.alert("死亡或者失踪人员不能进行劳动能力鉴定！","error");
		 	Base.clearGridDirty("gsxxGrid");
		 	return false;
	 	}
	 	
	 	Base.setValue("aaz127",rowsData[0].aaz127);
	 	Base.setValue("alc020",rowsData[0].alc020);
	 	Base.setValue("aab001",rowsData[0].aab001);
	 	Base.setValue("aae044",rowsData[0].aae044);
	 	 Base.submit("","judgelaboringtreamentAction!getUnitInfo.do",{"dto['aab001']":rowsData[0].aab001,"dto['aaz127']":rowsData[0].aaz127});
	 	//checktimeinterval();
	 }

	//保存经办信息
	function submitData(data,value){
			var aaz151 = data.item.aaz151;
			var aaz122 = data.item.aaz122;
			var hdbz = data.item.hdbz;
			var aae129 = value;
			if(hdbz != '未核定'){
				alert("该劳动能力鉴定费已核定，请确认");
				return false;			
			}
			Base.buttonsDialog("是否要修改吗?",300,150, 
					  [{text:"确定",handler:function(){
						  Base.submit("form1", "judgelaboringtreamentAction!toSave.do",{"dto['aaz151']":aaz151,"dto['aae129']":aae129});
					  }},
					  {text:"取消",handler:function(){
						  Base.submit("form1", "judgelaboringtreamentAction!queryPersonInfo.do");
					  }}]);
	}
	
	//打印
function printRaq(){
		var aac001 = Base.getValue("aac001");	
		//var yab003 = Base.getValue("yab003");
		var aaz127 = Base.getValue("aaz127");
		var userName = Base.getValue("userName");
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GSldnljdf_shd.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aac001="+aac001+";aaz127="+aaz127+";userName="+userName);
}

</script>
<%@ include file="/ta/incfooter.jsp"%>
