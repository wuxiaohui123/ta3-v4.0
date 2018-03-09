<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>wageReportEmpPL</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:tabs id="tab1" fit="true" onSelect="fnSelectTabs">
			<ta:tab id="tab_sgsb" key="手工申报方式">
				<ta:form id="form1" fit="true" cssStyle="overflow:auto;">
					<ta:toolbar id="tlb">
						<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery();" asToolBarItem="true"/>
						<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true"/>
						<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true"/>
					</ta:toolbar>
					<ta:box id="procInc">
						<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
					</ta:box>
					<ta:panel key="单位信息" cols="3" id="fltUnit" >
						<%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
					</ta:panel>
					<%@ include file="/yhsi3/commonJSP/xzlx_dw4.jsp"%>
					<ta:panel key="申报起止时间" cols="4" id="fltdate" >
						<ta:date id="aae041" key="开始年月" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkDate()" />
						<ta:date id="aae042" key="结束年月" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkDate()" />
						<ta:number id="aac040" key="工资" precision="2" max="99999999" min="0" alignLeft="true" labelWidth="120" />
						<ta:button id="setBtn" key="批量设置" onClick="setAae042();" />
						<ta:button id="setBtn1" key="上浮10%" onClick="setAae042P();" />
					</ta:panel>
					<ta:panel id="pnl" fit="true" minHeight="280">
						<ta:tabs id="tab2" fit="true">
							<ta:tab id="tab_bcsb" key="本次申报信息">
								<ta:datagrid id="ac20Grid" selectType="checkbox" forceFitColumns="true" fit="true" haveSn="true" columnFilter="true">
									<ta:datagridItem id="aac001" key="个人ID" align="center" maxChart="6"/>
									<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="4"/>
									<ta:datagridItem id="aac002" key="证件号码" align="center" maxChart="8"/>
									<ta:datagridItem id="aab001" key="单位ID" align="center" maxChart="6"/>
									<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="10" showDetailed="true"/>
									<ta:datagridItem id="aac040_old" key="原工资" align="center" maxChart="5" dataAlign="right"/>
									<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" maxChart="4">
										<ta:datagridEditor type="number" max="999999" min="111111" onChange="fncheck" />
									</ta:datagridItem>
									<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" maxChart="4">
										<ta:datagridEditor type="number" max="999999" min="111111" onChange="fncheck" />
									</ta:datagridItem>
									<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" maxChart="5">
										<ta:datagridEditor type="number" max="999999" min="0" precition="2" />
									</ta:datagridItem>
									<ta:datagridItem id="aae013" key="备注" align="center" maxChart="5">
										<ta:datagridEditor type="text" />
									</ta:datagridItem>
									<ta:dataGridToolPaging url="aaa" pageSize="100" selectExpButtons="1,2" showButton="false" showCount="false" showDetails="false">
									</ta:dataGridToolPaging>
								</ta:datagrid>
							</ta:tab>
							<ta:tab id="tab6" key="申报错误信息">
								<ta:datagrid id="errorList" fit="true" forceFitColumns="true" haveSn="true">
									<%@ include file="/yhsi3/commonJSP/tmp_ac04.jsp"%>
								</ta:datagrid>
							</ta:tab>
							<ta:tab id="tab2_lssb" key="事件流程记录">
								<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
							</ta:tab>
						</ta:tabs>
					</ta:panel>
				</ta:form>
			</ta:tab>
			<ta:tab id="tab_wjsb" key="文件申报方式">
				<ta:form id="form2" fit="true">
					<ta:toolbar id="tlb1">
						<ta:button id="saveBtn1" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData2();" asToolBarItem="true"/>
						<ta:button key="导出错误数据[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('failGrid');" asToolBarItem="true"/>
						<ta:button id="resetBtn1" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true"/>
					</ta:toolbar>
					<ta:panel id="fltname" key="数据文件" cols="3" >
						<ta:fileupload key="上传文件" id="file" submitIds="form2" url="wageReportEmpPLAction!upload.do" />
					</ta:panel>
					<ta:panel id="xzlx" key="险种选择" expanded="true" scalable="false">
						<ta:fieldset>
							<ta:checkboxgroup id="aaa">
								<ta:box cols="8">
									<ta:box span="1">
										<ta:checkbox id="aae140c_all" key="全选" onClick="checkedAae140All_1()" />
									</ta:box>
									<ta:box span="1">
										<ta:checkbox id="aae140c_110" key="企业养老" onClick="checkedAae140_1('110')" />
										<ta:checkbox id="aae140c_120" key="机关养老" onClick="checkedAae140_1('120')" />
									</ta:box>
									<ta:box span="1">
										<ta:checkbox id="aae140c_210" key="失业" onClick="checkedAae140_1('210')" />
									</ta:box>
									<ta:box span="1">
										<ta:checkbox id="aae140c_310" key="基本医疗" onClick="checkedAae140_1('310')" />
									</ta:box>
									<ta:box span="1">
										<ta:checkbox id="aae140c_410" key="工伤" onClick="checkedAae140_1('410')" />
									</ta:box>
									<ta:box span="1">
										<ta:checkbox id="aae140c_510" key="生育" onClick="checkedAae140_1('510')" />
									</ta:box>
								</ta:box>
							</ta:checkboxgroup>
						</ta:fieldset>
					</ta:panel>
					<ta:text id="checkBoxInfo" display="false" />
					<ta:tabs id="tab3" fit="true">
						<ta:tab id="tab_s" key="数据成功信息">
							<ta:datagrid id="successGrid" fit="true" forceFitColumns="true" selectType="checkbox" haveSn="true">
								<ta:datagridItem id="aac001" key="个人ID" align="center" maxChart="6"/>
								<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="4"/>
								<ta:datagridItem id="aac002" key="证件号码" align="center" maxChart="8"/>
								<ta:datagridItem id="aab001" key="单位ID" align="center" maxChart="6"/>
								<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="10" showDetailed="true"/>
								<ta:datagridItem id="aac040_old" key="原工资" align="center" maxChart="3" dataAlign="right"/>
								<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" maxChart="4"/>
								<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" maxChart="4"/>
								<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" maxChart="3"/>
								<ta:datagridItem id="aae013" key="备注" align="center" maxChart="4" showDetailed="true"/>
							</ta:datagrid>
						</ta:tab>
						<ta:tab id="tab2_f" key="数据失败信息">
							<ta:datagrid id="failGrid" fit="true" forceFitColumns="true" haveSn="true">
								<ta:datagridItem id="aac001" key="个人ID" align="center" maxChart="6"/>
								<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="4"/>
								<ta:datagridItem id="aab001" key="单位ID" align="center" maxChart="6"/>
								<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="10" showDetailed="true"/>
								<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" maxChart="4"/>
								<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" maxChart="4"/>
								<ta:datagridItem id="aac040" key="工资" align="center" maxChart="3"/>
								<ta:datagridItem id="aae013" key="备注" align="center" maxChart="4" showDetailed="true"/>
								<ta:datagridItem id="error" key="错误信息" showDetailed="true" align="center" collection="yab139" maxChart="12"/>
							</ta:datagrid>
						</ta:tab>
						<ta:tab id="tab_error" key="保存失败信息">
							<ta:datagrid id="errorGrid" fit="true" haveSn="true">
								<ta:datagridItem id="aac001" key="个人ID" align="center" maxChart="6"/>
								<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="4"/>
								<ta:datagridItem id="aac002" key="证件号码" align="center" maxChart="9"/>
								<ta:datagridItem id="aab001" key="单位ID" align="center" maxChart="6"/>
								<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="10" showDetailed="true"/>
								<ta:datagridItem id="aac040_old" key="原工资" align="center" maxChart="3" dataAlign="right"/>
								<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" maxChart="4"/>
								<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" maxChart="4"/>
								<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" maxChart="3"/>
								<ta:datagridItem id="aae013" key="备注" align="center" maxChart="8" showDetailed="true"/>
								<ta:datagridItem id="yae238" key="错误原因" align="center" maxChart="16" showDetailed="true"/>
							</ta:datagrid>
						</ta:tab>
						<ta:tab id="tab_dh" key="打回信息">
							<ta:datagrid id="dahuiGrid" fit="true" forceFitColumns="true" haveSn="true">
								<ta:datagridItem id="aac001" key="个人ID" align="center" maxChart="6"/>
								<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="4"/>
								<ta:datagridItem id="aac002" key="证件号码" align="center" maxChart="9"/>
								<ta:datagridItem id="aab001" key="单位ID" align="center" maxChart="6"/>
								<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="10" showDetailed="true"/>
								<ta:datagridItem id="aac040_old" key="原工资" align="center" maxChart="3" dataAlign="right"/>
								<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" maxChart="4"/>
								<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" maxChart="4"/>
								<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" maxChart="3"/>
								<ta:datagridItem id="aae013" key="备注" align="center" maxChart="8" showDetailed="true"/>
							</ta:datagrid>
						</ta:tab>
						<ta:tab id="tab_sh" key="待审核信息">
							<ta:datagrid id="shenheGrid" fit="true" forceFitColumns="true" haveSn="true">
								<ta:datagridItem id="aac001" key="个人ID" align="center" maxChart="6"/>
								<ta:datagridItem id="aac003" key="姓名" align="center" maxChart="4"/>
								<ta:datagridItem id="aac002" key="证件号码" align="center" maxChart="9"/>
								<ta:datagridItem id="aab001" key="单位ID" align="center" maxChart="6"/>
								<ta:datagridItem id="aae044" key="单位名称" align="center" maxChart="10" showDetailed="true"/>
								<ta:datagridItem id="aac040_old" key="原工资" align="center" maxChart="3" dataAlign="right"/>
								<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" maxChart="4"/>
								<ta:datagridItem id="aae042" key="结束年月" align="center" dataAlign="center" maxChart="4"/>
								<ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" maxChart="3"/>
								<ta:datagridItem id="aae013" key="备注" align="center" maxChart="6" showDetailed="true"/>
							</ta:datagrid>
						</ta:tab>
					</ta:tabs>
				</ta:form>
			</ta:tab>
		</ta:tabs>
		<ta:text id="aaz002" key="业务日志ID" display="false" />
		<ta:text id="sysdate" key="系统年度" display="false" />
	</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $("body").taLayout();
        Base.hideObj('setBtn,tab_dh,tab_sh,tab_error,setBtn1');
        Base.focus("aab001");
        Base.setDisabled('aae041,aae042,aac040,ueryBtn,saveBtn,saveBtn1,setBtn');
        initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fnQueryBack, 0, false);
    });

    //单位回调函数
    function fnQueryBack() {
        if (g_Suggest != "") {
            Base.setValue("aab001", g_Suggest[0]);
            Base.setValue("aae044", g_Suggest[1]);
            Base.setValue("aab999", g_Suggest[2]);
            Base.setValue("aab019", g_Suggest[3]);
            Base.setValue("yab019", g_Suggest[4]);
            Base.clearGridData("ac20Grid");
            Base.clearGridData("ac37lSGrid");
            Base.submit("fltUnit", "wageReportEmpPLAction!toQuery.do");
            Base.submit("aab001", "wageReportEmpPLAction!toCheckAAB001.do");
        }
    }
    
    //在子窗口调用主页面业务
    function fn_setDwInfo(){
    	 Base.submit("fltUnit", "wageReportEmpPLAction!toQuery.do");
         Base.submit("aab001", "wageReportEmpPLAction!toCheckAAB001.do");
    }

    //CheckBox全选 控制方法
    function fnSelect(a) {
        var insArr = Base.getValue("unitIns");
        var insArrNew = new Array();
        if (insArr.indexOf(",") >= 0) {
            insArrNew = insArr.split(",");
        } else {
            insArrNew[0] = insArr;
        }
        var len = insArrNew.length;
        if (Base.getObj('cbx' + a).checked) {
            for (i = 0; i < len; i++) {
                Base.setValue("cbx_" + getAae140(insArrNew[i]) + a, "on");
            }
        } else {
            for (i = 0; i < len; i++) {
                Base.setValue("cbx_" + getAae140(insArrNew[i]) + a, null);
            }
        }
    }

    //日期校验
    function checkDate() {
        var aae041 = Base.getValue("aae041");
        var aae042 = Base.getValue("aae042");
        var sysdate = Base.getValue("sysdate");
        if (aae041 == '' || aae042 == '') {
            Base.setDisabled('setBtn,setBtn1');
            return;
        } else if (aae041 > aae042) { //判断开始时间和结束时间
            Base.alert('开始年月不能大于结束年月！', "warn");
            Base.setDisabled('setBtn,setBtn1');
            Base.setValue('aae042', '');
            return;
        }
        Base.setEnable('setBtn,setBtn1');
    }

    function checkDate1() {
        var rowData = Base.getGridSelectedRows('ac04Grid');
        for (var i = 0; i < rowData.length; i++) {
            var aae149 = rowData[i].aae149;
        }
    }

    //手工申报方式设置结束期号
    function setAae042() {
        var aae041 = Base.getValue('aae041');
        var aae042 = Base.getValue('aae042');
        var aac040 = Base.getValue('aac040');
        var selectData = Base.getGridSelectedRows("ac20Grid");
        if (selectData == "") {
			Base.alert('请勾选数据!',"warn");
            return;
        }
        var j = selectData.length;
        for (var i = 1; i <= j; i++) {
            Base.setGridRowData("ac20Grid", selectData[i - 1]._row_ + 1, {
                "aae041": aae041,
                "aae042": aae042,
                "aac040": aac040
            });
        }
        Base.alert('批量赋值成功!', 'success');
        Base.setEnable("saveBtn");
    }

    //手工申报方式设置结束期号
    function setAae042P() {
        var aae041 = Base.getValue('aae041');
        var aae042 = Base.getValue('aae042');
        var selectData = Base.getGridSelectedRows("ac20Grid");
        if (selectData == "" || selectData.length == 0) {
            Base.alert('请勾选数据!',"warn");
            return;
        }
        var j = selectData.length;
        for (var i = 0; i < j; i++) {
            var aac040 = Number(selectData[i].aac040_old);
            aac040 = aac040 + Math.ceil(aac040 / 10);
            if (aae041 != '' && aae042 != '') {
                Base.setGridRowData("ac20Grid", selectData[i]._row_ + 1, {
                    "aae041": aae041,
                    "aae042": aae042,
                    "aac040": aac040
                });
            } else {
                Base.setGridRowData("ac20Grid", selectData[i]._row_ + 1, {
                    "aac040": aac040
                });
            }
        }
        Base.alert('批量赋值成功!', 'success');
        Base.setEnable("saveBtn");
    }

    //手工申报方式查询
    function fnQuery() {
        if (!Base.validateForm('form1', true)) {
            Base.alert("打红星的为必录项，不能为空","warn");
            return;
        }

        Base.clearGridData("ac20Grid");
        Base.clearGridData("ae04Grid");
        Base.submit("fltUnit", "wageReportEmpPLAction!Query.do", {
            "dto['aae140str']": createAae140str()
        });
        Base.setEnable("saveBtn");
    }
    
    //手工申报方式时间检查
    function fncheck(data, value) {
        var aae041 = data.item.aae041;
        var aae042 = data.item.aae042;
        var aac030 = data.item.aac030.substring(0, 7).replaceAll('-', '');
        var sysdate = Base.getValue("sysdate");
        if (aac030 > aae041) {
            Base.alert("开始时间不能早于参保日期!", "warn");
            Base.setDisabled('saveBtn');
            return;
        }
        if (aac030 > aae042) {
            Base.alert("结束时间不能早于参保日期!", "warn");
            Base.setDisabled('saveBtn');
            return;
        }
        if (aae041 == '' || aae042 == '') {
            Base.setDisabled('saveBtn');
            return;
        }
        if (aae041 > aae042) { //判断开始时间和结束时间
            Base.alert('开始年月不能大于结束年月！', "warn");
            Base.setDisabled('saveBtn');
            return;
        }
        if (aae042 > sysdate) { //判断结束时间是否超出本年度
            Base.alert('结束年月超过本年度！' + sysdate,"warn");
            Base.setDisabled('saveBtn');
            return;
        }
        Base.setEnable('saveBtn');
    }

    //手工申报方式保存
    function submitData() {
        if (!Base.validateForm('form1', true)) {
            Base.alert("打红星的为必录项，不能为空","warn");
            return;
        }
        var rows = Base.getGridSelectedRows("ac20Grid");
        var param = {};
        if ("" == rows) {
            Base.alert("请至少勾选一条人员信息！","warn");
            return;
        }
        // 校验选中人员的信息完整
        for(var i=0;i < rows.length;i++){
        	if(rows[i].aae041 == "" || rows[i].aae042 == "" || rows[i].aac040 == ""
        		|| rows[i].aae041 == undefined || rows[i].aae042 == undefined || rows[i].aac040 == undefined){
        		Base.alert("人员【"+rows[i].aac003+"】申报信息不完整，请核实！","warn");
        		return false;
        	}
        }
        param.d2List = Ta.util.obj2string(rows);
        param["dto['aae140str']"] = createAae140str();
        Base.submit("form1,aaz002", "wageReportEmpPLAction!Save1.do", param, false, false, null);
    }
    
    //**************************************************************//
    //手工申报方式模板下载
    function fnMoban() {
        Base.submit("form2", "wageReportEmpPLAction!download.do");
    }

    function fnSelectTabs(tabid) {
        if (tabid == "tab_wjsb") {
            Base.activeTab("tab_s");
        }
    }

    //手工申报方式保存
    function submitData2() {
        var rows = Base.getGridSelectedRows("successGrid");
        var param = {};
        if ("" == rows) {
            Base.alert("请至少勾选一条人员信息！","warn");
            return;
        }
        Base.submit("successGrid,aaz002", "wageReportEmpPLAction!Save2.do", {
            "dto['aae140str']": createAae140str1()
        });
    }

    function createAae140str() {
        var ary = ["aae140_110", "aae140_120", "aae140_210", "aae140_310", "aae140_410", "aae140_510"];
        var aae140str = "";
        for (var i = 0; i < ary.length; i++) {
            if (Base.getObj(ary[i]).checked) {

                if (Base.getObj(ary[i]).hide) {
                    continue;
                }
                if (Base.getObj(ary[i]).disabled) {
                    continue;
                }
                aae140str = aae140str + ary[i].substring(ary[i].indexOf("_") + 1) + ",";
            }

        }
        return aae140str.substring(0, aae140str.length - 1);
    }

    function createAae140str1() {
        var ary = ["aae140c_110", "aae140c_120", "aae140c_210", "aae140c_310", "aae140c_410", "aae140c_510"];
        var aae140str = "";
        for (var i = 0; i < ary.length; i++) {
            if (Base.getObj(ary[i]).checked) {

                if (Base.getObj(ary[i]).hide) {
                    continue;
                }
                if (Base.getObj(ary[i]).disabled) {
                    continue;
                }
                aae140str = aae140str + ary[i].substring(ary[i].indexOf("_") + 1) + ",";
            }

        }
        return aae140str.substring(0, aae140str.length - 1);
    }

    // 选择所有险种
    function checkedAae140All_1() {
        var ary = ["aae140c_110", "aae140c_120", "aae140c_210", "aae140c_310", "aae140c_410", "aae140c_510"];
        // 是否被选择
        if (Base.getObj("aae140c_all").checked) {
            for (var i = 0; i < ary.length; i++) {
                Base.setValue(ary[i], "on");
            }
        } else {
            for (var i = 0; i < ary.length; i++) {
                Base.setValue(ary[i], null);
            }
        }
        checkIsChecked();
    }
    
    // 选择单一险种
    function checkedAae140_1(id) {
        var flag;
        // 是否被选择
        if (Base.getObj("aae140c_" + id).checked) {
            if (id == "310") {
                Base.getObj("aae140c_330").checked = true;
            } else if (id == "330") {
                Base.getObj("aae140c_310").checked = true;
            } else if (id == "320") {
                Base.getObj("aae140c_310").checked = true;
                Base.getObj("aae140c_330").checked = true;
            } else if (id == "370") {
                Base.getObj("aae140c_310").checked = true;
                Base.getObj("aae140c_330").checked = true;
            }
            flag = '1'; // 选择	
            checkIsChecked();
        } else {
            if (id == "310") {
                Base.getObj("aae140c_330").checked = false;
            } else if (id == "330") {
                Base.getObj("aae140c_310").checked = false;
            }
            flag = '0'; // 未选择			
        }
        checkIsChecked();
    }

    function checkIsChecked() {
        var aae140Array = ['110', '120', '210', '310', '410', '510'];
        var len = aae140Array.length;
        var hasCk = false;
        var checkStrs;
        for (var i = 0; i < len; i++) {
            var isck = Base.getObj('aae140c_' + aae140Array[i]).checked;
            if (isck) {
                hasCk = true;
                if (typeof(checkStrs) == 'undefined') {
                    checkStrs = aae140Array[i];
                } else {
                    checkStrs = checkStrs + ',' + aae140Array[i];
                }
            }
        }
        Base.setValue('checkBoxInfo', checkStrs);
    }
    
    //输出excel表格信息
    function fnExpFile(gridId) {
        var rows = Base.getGridData(gridId);
        if (rows != "") {
            Base.expGridExcel(gridId);
        } else {
            Base.alert("没有错误数据需要导出,请确认!", "warn");
        }
    }
</script>
<%@ include file="/ta/incfooter.jsp"%>