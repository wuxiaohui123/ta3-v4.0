<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>retireEmp</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="在职转退休[S]" icon="xui-icon-spotSave" hotKey="s" onClick="submitData();" asToolBarItem="true" />
			<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="r" type="resetPage" asToolBarItem="true" />
			<ta:button id="closeWinBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="c" onClick="Base.closeWindow('userwin')" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:text id="aaz002" key="业务日志ID" display="false" />
			<ta:panel key="个人基本信息" cols="3" id="fltPerson" scalable="false" expanded="false">
				<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
			</ta:panel>
			<ta:panel key="单位基本信息" cols="3" id="fltUnit" scalable="false" expanded="false">
				<ta:text id="si_aab001" key="单位编号(用于提交)" display="false"/>
				<ta:selectInput id="aab001" key="单位编号" labelWidth="120" required="true" onSelect="fn_queryAb01" showKey="true"/>
				<ta:text id="aae044" key="名称" readOnly="true" span="2" labelWidth="120"/>
				<ta:text id="aab999" key="单位管理码" labelWidth="120" readOnly="true" maxLength="20" />
				<ta:selectInput id="aab019" key="单位类型" labelWidth="120" collection="AAB019"  readOnly="true"/>
				<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" collection="YAB019"  readOnly="true"/>
			</ta:panel>
			<ta:panel key="个人退休信息" id="fltOther" cols="3" scalable="false" expanded="false">
				<ta:selectInput id="aic161" key="离退休类别" labelWidth="120" required="true" collection="AIC161" readOnly="false" />
				<ta:date id="aic162" key="离退休日期" showSelectPanel="true" required="true" labelWidth="120" />
				<ta:number id="aac040" key="医疗退休工资" precision="2" bpopTipMsg="医保退休划账户工资" max="99999999" min="0" alignLeft="true" labelWidth="120" />
				<ta:text id="aae013" key="备注" maxLength="100" span="3" labelWidth="120" />
				<ta:text id="aab001_1" key="单位编号" readOnly="true" labelWidth="120" display="false" />
				<ta:selectInput id="aae140" key="险种类型" labelWidth="120" collection="AAE140" display="false" readOnly="true" />
				<ta:selectInput id="aac050" key="变更类型" labelWidth="120" collection="AAC050" value="25" display="false" readOnly="true" />
				<ta:date id="aae035" key="退休时间" readOnly="true" labelWidth="120" display="false" />
			</ta:panel>
			<ta:tabs id="tab_all" fit="true">
				<ta:tab id="tab_1" key="个人参保信息">
					<ta:datagrid id="ac20Grid" selectType="checkbox" fit="true" haveSn="true"  onSelectChange="checkMedical" >
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="6"/>
						<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="left" maxChart="10"/>
						<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="left" maxChart="6"/>
						<ta:datagridItem id="aac003" key="姓名" showDetailed="true" align="center" dataAlign="left" maxChart="4"/>
						<ta:datagridItem id="aae140" key="险种" showDetailed="true" align="center" dataAlign="left" collection="aae140" maxChart="10"/>
						<ta:datagridItem id="yac084" key="离退休标志" showDetailed="true" align="center" dataAlign="left" collection="YAC084" maxChart="5" formatter="fnFormatter"/>
						<ta:datagridItem id="ykc005" key="特殊人员类型" showDetailed="true" align="center" dataAlign="left" collection="YKC005" maxChart="6"/>
						<ta:datagridItem id="ykc006" key="特殊人员类别" showDetailed="true" align="center" dataAlign="left" collection="YKC006" maxChart="6"/>
						<ta:datagridItem id="aac030" key="参保日期" align="center" dataAlign="center" maxChart="6"/>
						<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" maxChart="6"/>
						<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" maxChart="6"/>
						<ta:datagridItem id="aaz136" key="基数规则" showDetailed="true" align="center" dataAlign="left" collection="aaz136" maxChart="10"/>
						<ta:datagridItem id="yaz289" key="缴费规则" showDetailed="true" align="center" dataAlign="left" collection="yaz289" maxChart="16"/>
						<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="right" maxChart="6"/>
						<ta:datagridItem id="jfz" key="缴费至" align="center" dataAlign="right" maxChart="4"/>
						<ta:datagridItem id="jfy" key="缴费月" align="center" dataAlign="right" maxChart="3"/>
						<ta:datagridItem id="djjfy" key="单建缴费月" align="center" dataAlign="right" maxChart="5"/>
						<ta:datagridItem id="tzjfy" key="统帐缴费月" align="center" dataAlign="right" maxChart="5"/>
						<ta:datagridItem id="yab139" key="参保所属机构" align="center" dataAlign="left" collection="yab003" maxChart="6"/>
						<ta:datagridItem id="aaz159" key="参保关系ID" align="center" dataAlign="left" maxChart="6" hiddenColumn="true"/>
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab_4" key="视同缴费信息">
					<ta:datagrid id="dg_rdxx" forceFitColumns="true" fit="true" haveSn="true">
						<ta:datagridItem id="aaz185" key="人员工作经历ID" align="center" dataAlign="center" hiddenColumn="false" />
						<ta:datagridItem id="aab004" key="单位名称" align="center" dataAlign="center" width="200" />
						<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" />
						<ta:datagridItem id="aae042" key="终止年月" align="center" dataAlign="center" />
						<ta:datagridItem id="yae599" key="月数" align="center" dataAlign="center" />
						<ta:datagridItem id="aae140" key="险种" align="center" dataAlign="center" />
						<ta:datagridItem id="aae013" key="原因" align="center" dataAlign="center" />
					</ta:datagrid>
				</ta:tab>

				<ta:tab id="tab_0" key="行政审批信息">
					<ta:datagrid id="ic08Grid" fit="true" haveSn="true" forceFitColumns="true">
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" width="100"/>
						<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="aae140" width="180"/>
						<ta:datagridItem id="aic161" key="离退休类别" align="center" dataAlign="left" collection="aic161" width="100"/>
						<ta:datagridItem id="aic162" key="退休时间" align="center" dataAlign="center" width="80"/>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab_2" key="事件流程记录">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus("aac001");
		initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10,fn_queryAc01, 0, false);
	});
	
	function fn_setRyInfo(){
		Base.submit("fltPerson", "retireEmpAction!checkAac01.do", {
			"dto['aac003']": g_Suggest[1],
			"dto['aac004']": g_Suggest[3],
			"dto['aac006']": g_Suggest[4]
		},
		null, false,
		function() {
			Base.submit("fltPerson", "retireEmpAction!queryAc01.do");
		},
		function() {
			Base.openWindow("userwin", "", myPath() + "/process/publicBusiness/manageEmployee/retireemp/retireEmpAction!toEdit.do", {
				"dto['aac003']": encodeURI(g_Suggest[1]),
				"dto['aac004']": encodeURI(g_Suggest[3]),
				"dto['aac006']": g_Suggest[4]
			},
			"95%", "90%", null,
			function() {
				Base.submit("fltPerson", "retireEmpAction!queryAc01.do");
			},
			true);
		});
	}
	
	//个人回调函数 ：查询单位信息和个人信息，和参保信息,视同缴费情况
	function fn_queryAc01() {
		Base.setValue("aac001", g_Suggest[2]);
		if (g_Suggest != "") {
			Base.submit("fltPerson", "retireEmpAction!checkAac01.do", {
				"dto['aac003']": g_Suggest[1],
				"dto['aac004']": g_Suggest[3],
				"dto['aac006']": g_Suggest[4]
			},
			null, false,
			function() {
				Base.submit("fltPerson", "retireEmpAction!queryAc01.do");
			},
			function() {
				Base.openWindow("userwin", "", myPath() + "/process/publicBusiness/manageEmployee/retireemp/retireEmpAction!toEdit.do", {
					"dto['aac003']": encodeURI(g_Suggest[1]),
					"dto['aac004']": encodeURI(g_Suggest[3]),
					"dto['aac006']": g_Suggest[4]
				},
				"95%", "90%", null,
				function() {
					Base.submit("fltPerson", "retireEmpAction!queryAc01.do");
				},
				true);
			});
	
		}
	}
	
	function fn_queryAb01(key,value) {
    	//设置其key为aab001传入
        Base.submit("fltPerson", "retireEmpAction!queryAb01.do",{"dto['aab001']":key});
        Base.setValue("aae044",value);
        Base.setValue("si_aab001",key);
    }
    
    //选择了医疗保险才能输入工资+不能选择已退休险种
    function checkMedical(rowsData,n){
    	if(rowsData == "" || rowsData == undefined){
    		return;
    	}
    	var count310 = 0;
    	for(var i=0;i<rowsData.length;i++){
    		if(rowsData[i].aae140 == "310"){
    			count310 = 1;
    			break;
    		}
    	}
    	if(count310 > 0){
    		Base._setReadOnly("aac040",false);
    	}
    	else{
    		Base.setReadOnly("aac040");
    		Base.setValue("aac040","0");
    	}
    }
    
    function fnFormatter(row, cell, value, columnDef, dataContext){
    	if(value == "1" || value == "是"){
    		return "<span style = 'color:red;'>"+value+"</span>";
    	}
    	return value;
    }
	
	//保存
	function submitData() {
		var rowsData = Base.getGridSelectedRows("ac20Grid");
		var param = {};
		if (rowsData == '' || rowsData == null) {
			Base.alert("请勾选需要保存的信息！","warn");
			return;
		}
		for(var i=0;i<rowsData.length;i++){
    		if(rowsData[i].yac084 == "1"){
    			Base.alert("不能选择已退休的参保信息！","warn");
    			return false;
    		}
    	}
    	
		param.d2List = Ta.util.obj2string(rowsData);
		Base.submit("form1", "retireEmpAction!toSave.do", param);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>