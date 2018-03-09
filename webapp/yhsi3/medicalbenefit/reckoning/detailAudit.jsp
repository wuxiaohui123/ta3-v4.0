<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构明细审核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar">
	<ta:pageloading />
		<ta:toolbar id="tbr1" >
			<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
			<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
			<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
		</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:box id="bxIds" cols="3">
			<ta:text id="kc24Row" key="获取扣款的结算行数" display="false" />
			<ta:text id="aaz272" key="医疗机构费用结算事件ID" display="false"  />
			<ta:text id="aaz212" key="人员医疗费用扣款事件ID" display="false" />
			<ta:text id="aaz002" key="业务日志ID" display="false" />
		</ta:box>
		<ta:panel id="fltCxtj" key="查询条件" cols="3" >
			  <%@ include file="../common/qsQuery.jsp"%>
		</ta:panel>
		<ta:panel id="pnlRandomAudit" key="待结算信息(双击查看明细)" height="100" expanded="false" >
			<ta:datagrid id="dgrdJSLX" fit="true" onRowDBClick="fnClickDgrd1" haveSn="true" selectType="checkbox" forceFitColumns="true" >
			  <%@ include file="../common/kf20.jsp"%>
			</ta:datagrid>
		</ta:panel>
		<ta:panel id="pnlRYJS" key="消费明细(红色背景说明已扣款)" fit="true" >
			<ta:datagrid id="dgrdRYJS" fit="true"  forceFitColumns="true" haveSn="true" columnFilter="true" rowColorfn="fnColor2">
				<ta:datagridItem id="checkDetail" key="查看明细" icon="icon-find" click="fnClickDgrd2" align="center" maxChart="4" />
			    <%@ include file="../common/kc24.jsp"%>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.filterSelectInput("yka316", "17,18,24", false);//清算类别过滤掉离休
		initializeSuggestFramework(2,"", "akb020", 500, 100, 4, fn_getHospital, 0, false);
	});
	//医疗机构suggestframe快捷查询,医疗机构编码change事件,并加上提示
	$("#akb020").change(function(){
		sfwQueryUtil(2,'getKb01',Base.getValue('akb020'));
	})
	.CreateBubblePopup({selectable: false,
		                innerHtml: "输入医疗机构名称或ID,可自动查询相关数据！", 
		                themeName:'all-orange',
		                themePath:Base.globvar.contextPath + '/ta/resource/themes/base/bubblepop'});
	
	//医疗机构suggestframework回调方法
	function fn_getHospital(){
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",
					{"dto['akb020']":Base.getValue("akb020")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg);
							Base.setValue("akb020","");
							return false;
						}
						if(data && data.hospitalInfoDto) {
							Base.setValue("akb022",data.hospitalInfoDto.akb022);
							Base.setValue("akb097",data.hospitalInfoDto.akb097);
							Base.setValue("akb021",data.hospitalInfoDto.akb021);
						}
					});
	}
	//查询
	function query()
	{
		Base.clearGridData("dgrdJSLX");
		Base.clearGridData("dgrdRYJS");
		Base.submit("fltCxtj","detailAuditAction!toQueryHospitalInfo.do");
	}
	//表格颜色设置
	function fnColor2(data)
	{
		if(data.akc265 > 0){
			return '#FF8080';
		}
	}
	//查看抽中的信息,即人员医疗费用结算信息
	 function fnClickDgrd1(e,data)
	{
		//医疗机构费用结算事件ID
		var aaz272 = data.aaz272;
		if("undefined" == typeof(aaz272) || "" == aaz272)
			return Base.alert("数据错误,没有获取到医疗机构结算事件ID!","warn");
		var parameter={"dto['aaz272']":aaz272};
		Base.setValue("aaz272",aaz272); 
		//查询清算申请下的人员结算数据
		Base.submit("","detailAuditAction!checkCSXX.do",parameter,false,null,null);
		
		// panel标题设置
		var akb021 = data.akb021; // 当前医疗机构名称
		var yka316 = data.yka316s; // 清算类型
		var akb079 = data.akb079; // 人次
		var akb065 = data.akb065; // 总费用
		var title = "名称:"+akb021+"    清算类型:"+yka316+"    总人次:"+akb079+"    总费用:"+akb065;
		Base.setPanelTitle("pnlRYJS", "<pre>"+title+"</pre>", true);
	}
	//查看明细
	function fnClickDgrd2(data,e)
	{
		var aaz216 = data.aaz216;//人员医疗费用结算事件ID
		var aaz217 = data.aaz217;//人员医疗费用就诊事件ID
		var aaz272 = data.aaz272;//医疗机构清算事件ID
		var aaz212 = data.aaz212;//人员医疗费用扣款事件ID
		var aaz002 = data.aaz002;//业务日志ID
		if("" == aaz272 || null == aaz272)
			aaz272 = Base.getValue("aaz272");
		if("" == aaz216 || null == aaz216)
			return;
		var params={"dto['aaz216']":aaz216,
				    "dto['aaz217']":aaz217,
				    "dto['aaz272']":aaz272,
				    "dto['aaz212']":aaz212,
				    "dto['row']":data.row,
				    "dto['aaz002']":aaz002
				    };
		Base.setValue("kc24Row",data.row); //设置操作的行数
		Base.setValue("aaz212",aaz212); //人员医疗费用扣款事件ID
		Base.setValue("aaz002",aaz002); //业务日志ID
		parent.Base.openWindow('detailWin',"明细信息","<%=path%>/process/medicalbenefit/reckoning/detailAuditAction!checkDetail.do", params, "95%", "90%",null,function(){
			//刷新人员结算数据
			Base.submit("","detailAuditAction!checkCSXX.do",{"dto['aaz272']":aaz272},null,false,null,null);
		},true);
	}
	//保存
	function toSave()
	{
		//医疗机构清算数据
		var dgrdJSLX=Base.getGridSelectedRows("dgrdJSLX");
		if(1 > dgrdJSLX.length){
			Base.alert("请勾选需要稽核的待结算信息！","warn");
		}else{
			Base.confirm("确定要保存吗?",function(yes){
				if(yes){
					Base.clearGridData("dgrdRYJS");
					var parameter={};
					var grdStr=Ta.util.obj2string(dgrdJSLX);
					parameter["dgrdJSLX"]=grdStr;
					Base.submit("form1","detailAuditAction!toSave.do",parameter,false,null,null);
				}
			}); 
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>