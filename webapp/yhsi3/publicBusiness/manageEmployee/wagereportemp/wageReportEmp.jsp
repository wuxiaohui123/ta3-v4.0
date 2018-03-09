<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>wageReportEmp</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true"/>
			<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true"/>
			<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="fnClose()" asToolBarItem="true"/>
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:panel key="个人基本信息" cols="3" id="fltPerson" >
				<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
				<ta:text id="aaz002" key="业务日志ID" display="false" />
			</ta:panel>
			<ta:panel key="单位基本信息" cols="3" id="fltUnit" >
				<ta:text id="si_aab001" key="单位编号(用于提交)" display="false" />
				<ta:selectInput id="aab001" key="单位编号" labelWidth="120" required="true" onSelect="fnQuery" showKey="true"/>
				<ta:text id="aae044" key="名称" readOnly="true" span="2" labelWidth="120"/>
				<ta:text id="aab999" key="单位管理码" labelWidth="120" readOnly="true" maxLength="20" />
				<ta:selectInput id="aab019" key="单位类型" labelWidth="120" collection="AAB019"  readOnly="true"/>
				<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" collection="YAB019"  readOnly="true"/>
			</ta:panel>
			<ta:panel key="申报工资信息" cols="3" id="fltOther" >
				<ta:date id="aae041" key="开始年月" onBlur="checkDate();checkStartTime();" showSelectPanel="true" issue="true" labelWidth="120" required="true"/>
				<ta:date id="aae042" key="结束年月" onBlur="checkDate()" showSelectPanel="true" issue="true" required="true" labelWidth="120"/>
				<ta:number id="aac040" key="工资" precision="2"  max="99999999" min="0" required="true" alignLeft="true" labelWidth="120"/>
				<ta:text id="aae013" key="备注" span="3" maxLength="100" labelWidth="120"/>
			</ta:panel>
			<ta:tabs id="tab" fit="true">
				<ta:tab id="tab1" key="个人参保信息">
					<ta:datagrid id="ac20Grid" fit="true" haveSn="true" selectType="checkbox" onSelectChange="checkStartTime">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab2" key="缴费基数信息">
					<ta:datagrid id="ac04Grid" fit="true" forceFitColumns="true" haveSn="true">
						<%@ include file="/yhsi3/commonJSP/jfjsxx.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab6" key="申报错误信息">
					<ta:datagrid id="errorList" fit="true" forceFitColumns="true" haveSn="true">
						<%@ include file="/yhsi3/commonJSP/tmp_ac04.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab3" key="本次申报信息">
					<ta:datagrid id="ac37Grid" forceFitColumns="true" fit="true" haveSn="true">
						<%@ include file="/yhsi3/commonJSP/bcsbxx.jsp"%>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab4" key="申报结果信息">
					<ta:datagrid id="ac38Grid" forceFitColumns="true" fit="true" haveSn="true">
						<ta:datagridItem id="aac001" key="个人ID" align="center" maxChart="6"/>
						<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="4"/>
						<ta:datagridItem id="aab001" key="单位ID" align="center" maxChart="6"/>
						<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="12" showDetailed="true"/>
						<ta:datagridItem id="aae140" key="险种类型" align="center" maxChart="12" collection="aae140" showDetailed="true"/>
						<ta:datagridItem id="aae041" key="开始年月" align="center" maxChart="4" dataAlign="center"/>
						<ta:datagridItem id="aae042" key="结束年月" align="center" maxChart="4" dataAlign="center"/>
						<ta:datagridItem id="aac040" key="工资" align="center" maxChart="3" dataAlign="right"/>
						<ta:datagridItem id="aae180" key="缴费基数" align="center" maxChart="4" dataAlign="right"/>
						<ta:datagridItem id="aaz184" key="人员工资变更事件" align="center" hiddenColumn="false"/>
						<ta:datagridItem id="yab139" key="社保经办机构" maxChart="9" align="center" collection="yab003"/>
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab5" key="事件流程记录">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:form>
		<ta:text id="sysdate" key="系统年度" display="false" />
	</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $("body").taLayout();
        Base.setReadOnly('aab001');
        Base.setReadOnly('aae041');
        Base.setReadOnly('aae042');
        Base.setReadOnly('aac040');
        Base.setReadOnly('aae013');
        Base.hideObj('closeBtn');
        initializeSuggestFramework(1, 'ac01', 'aac001', 990, 200, 10, fn_queryInfoPerson, 0, false);
    });
    
   //在子窗口调用主页面业务
   function fn_setRyInfo(){
	   Base.submit("fltPerson", "wageReportEmpAction!toQueryPerson.do");
       Base.submit('aac001', 'wageReportEmpAction!toCheckAAC001.do');
   }
	
    //人员回调函数
    function fn_queryInfoPerson() {
        if (g_Suggest != "") {
            Base.setValue("aac001", g_Suggest[2]);
            //清空列表
            Base.clearGridData("ac20Grid");
            Base.clearGridData("ac04Grid");
            Base.clearGridData("ac37Grid");
            Base.clearGridData("ae02Grid");
            Base.submit("fltPerson", "wageReportEmpAction!toQueryPerson.do");
            Base.submit('aac001', 'wageReportEmpAction!toCheckAAC001.do');
        }
    }

    function fnQuery(key,value) {
    	//设置其key为aab001传入
        Base.submit("aac001", "wageReportEmpAction!toQuery.do",{"dto['aab001']":key});
        Base.setValue("aae044",value);
        Base.setValue("si_aab001",key);
    }
    
    //保存
    function submitData() {
        if (!Base.validateForm('form1', true)) {
            Base.alert("打红星的为必录项，不能为空");
            return;
        }
        var rows = Base.getGridSelectedRows("ac20Grid");
        var param = {};
        if ("" == rows) {
            Base.alert("请勾选险种信息！");
            return;
        }
        param.d2List = Ta.util.obj2string(rows);
        Base.submit("form1", "wageReportEmpAction!toSave.do", param, false, false, null);
        Base.setReadOnly('aac001');
        Base.setReadOnly('aab001');
        Base.setReadOnly('aae041');
        Base.setReadOnly('aae042');
        Base.setReadOnly('aac040');
        Base.setReadOnly('aae013');
    }

    //日期校验
    function checkDate() {
        var aae041 = Base.getValue("aae041");
        var aae042 = Base.getValue("aae042");
        var sysdate = Base.getValue("sysdate");
        var rows = Base.getGridSelectedRows("ac20Grid");
        if (aae041 == '' || aae042 == '') {
            return;
        }
        if (aae041 > aae042) { //判断开始时间和结束时间
            alert('开始年月不能大于结束年月！');
            Base.setValue('aae042', '');
            return;
        }
        if (aae042 > sysdate) { //判断结束时间是否超出下年度
            alert('结束年月最大只能到' + sysdate);
            Base.setValue('aae042', '');
            return;
        }
    }

    function checkDate1() {
        var rowData = Base.getGridSelectedRows('ac04Grid');
        for (var i = 0; i < rowData.length; i++) {
            var aae149 = rowData[i].aae149;
        }
    }
    
    // 检查勾选险种与申报开始年月比较
    function checkStartTime() {
        var rowData = Base.getGridSelectedRows('ac20Grid');
        var aae041 = Base.getValue("aae041");
        if(rowData.length == 0 || aae041 == ""){
        	return false;
        }
        var aae149 = "";
        // 获取勾选险种的最小开始年月
        for (var i = 0; i < rowData.length; i++) {
            if(aae149 == ""){
            	aae149 = rowData[i].aae041;
            }
            if(aae149 < rowData[i].aae041){
            	aae149 = rowData[i].aae041;
            }
        }
        // 比较
        if(aae149 > aae041){
        	Base.alert("开始年月不能早于本次申报险种的最小开始参保时间【"+aae149+"】","warn");
        	Base.setValue("aae041","");
        }
    }
    
    //重置
    function fnReset() {
        Base.clearData("form1");
        Base.clearGridData("ac20Grid");
        Base.clearGridData("ac37Grid");
        Base.clearGridData("ac04Grid");
        Base.clearGridData("ae02Grid");
        Base.setEnable("saveBtn");
        Base.focus("aac001");
    }
    
    //关闭编辑窗口
    function fnClose() {
        parent.Base.closeWindow("userwin");
    }

</script>
<%@ include file="/ta/incfooter.jsp"%>