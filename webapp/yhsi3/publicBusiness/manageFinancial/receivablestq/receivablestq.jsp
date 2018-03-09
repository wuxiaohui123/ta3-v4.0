<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>基金收款登帐(特权)</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:form id="form1" fit="true">
			<ta:toolbar id="tlb1">
				<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery();" asToolBarItem="true" />
				<ta:button id="saveBtn" key="基金收款登帐[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
				<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true" />
			</ta:toolbar>
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:panel id="pnlJS" key="查询条件" cols="3" expanded="true" scalable="false">
				<ta:box cols="2">
					<ta:text id="aaz010" key="当事人ID" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callDsrRPC()"  bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询"/>
					<ta:buttonLayout align="left" columnWidth="0.1">
						<ta:button id="showDsrBtn" key="?" onClick="showDsrRPC()"/>
					</ta:buttonLayout>
				</ta:box>
				<ta:text id="yaa030" key="当事人名称" readOnly="true" />
			</ta:panel>
			<ta:panel id="pnlFina" key="基金收款信息录入" cols="3">
				<ta:box cols="2">
					<ta:text id="yaf010" key="社保机构银行帐号ID" required="true" maxLength="40" labelWidth="140" columnWidth="0.9" onChange="callBankRPC()"/>
					<ta:buttonLayout align="left" columnWidth="0.1">
						<ta:button id="showBankBtn" key="?" onClick="showBankRPC()"/>
					</ta:buttonLayout>
				</ta:box>
				<ta:text id="yae597" key="开户银行名称" labelWidth="140" readOnly="true" />
				<ta:text id="aae010" key="社保机构银行账号" labelWidth="140" />
				<ta:text id="aae009" key="社保机构银行户名" labelWidth="140" />
				<ta:selectInput id="aad005" key="收款结算类型" labelWidth="140" collection="AAD005" required="true" isAutoExtend="true" filter="10,11" reverseFilter="true" />
				<ta:date id="aad017" key="收款时间" showSelectPanel="true" labelWidth="140" required="true" validNowTime="left" />
				<ta:number id="yad003" key="收款金额" alignLeft="true" required="true" precision="2" labelWidth="140" max="999999999999.99" cssStyle="color: red,font-weight: bold" />
				<ta:text id="aad009" key="缴费凭证编号" labelWidth="140" maxLength="20" />
				<ta:selectInput id="yae819" key="是否立即实收分配" labelWidth="140" collection="YAE819" required="true" />
				<ta:text id="aae008" key="银行编号" display="false" />
				<ta:text id="heji" key="合计" display="false" />
				<ta:text id="yad158" key="征集套账类型-dataGrid" display="false" />
				<ta:text id="yad158_m" key="征集套账类型-rpc" display="false" />
			</ta:panel>
			<ta:panel id="pnl1" key="业务单据信息（单次操作只能操作相同帐套数据）" fit="true">
				<ta:datagrid id="danjuGrid" fit="true" onRowDBClick="dbClick" forceFitColumns="true" snWidth="30" haveSn="true" selectType="radio" onSelectChange="selectChage">
					<ta:datagridItem id="aaz288" key="征集通知ID" align="center" maxChart="7" />
					<ta:datagridItem id="aaz010" key="当事人ID" align="center" maxChart="5" />
					<ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" maxChart="7" />
					<ta:datagridItem id="aae019" key="应处理金额" dataAlign="right" align="center" maxChart="5" totals="sum" formatter="fnFormatter1" tatalsTextShow="false" />
					<ta:datagridItem id="aae041" key="开始期号" dataAlign="right" align="center" maxChart="3" />
					<ta:datagridItem id="aae042" key="结束期号" dataAlign="right" align="center" maxChart="3" />
					<ta:datagridItem id="yad158" key="帐套类型" align="center" collection="YAD158" maxChart="5" />
					<ta:datagridItem id="aae013" key="备注" align="center" maxChart="6" showDetailed="true" />
					<ta:datagridItem id="aae281" key="征集通知单据号" hiddenColumn="true" />
				</ta:datagrid>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $("body").taLayout();
        Ta.autoPercentHeight();
        //当事人下拉
        initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 4, fnSelect1, 0, false);
        //社保机构银行帐号ID下拉
        initializeSuggestFramework(3, 'af07', 'yaf010', 600, 100, 4, fnSelect3, 0, false);
    });
    
  //当事人ID RPC
    function callDsrRPC(){
    	sfwQueryUtil_newRPC(1,'getDSRXXString',{"dto['inputString']":Base.getValue('aaz010')});
    }
    function showDsrRPC(){
    	Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow06.do",null,1000,450,null,fn_setDsrData,true);
    }
    function fn_setDsrData(){
    	 Base.submit("pnlJS", "receivablestqAction!toCheckAAZ010.do");
    }
    //当事人ID 回调
    function fnSelect1() {
        //当事人ID 名称赋值
        Base.setValue("aaz010", g_Suggest[1]);
        Base.setValue("yaa030", g_Suggest[2]);
        //清空列表
        Base.clearGridData("danjuGrid");
        Base.clearData("pnlFina");
        Base.setValue("yae819", "1");
        //当事人ID 查询征集单信息
        Base.submit("pnlJS", "receivablestqAction!toCheckAAZ010.do");
    }
    
    // 社保机构账号信息
    function fnSelect3() {
        Base.setValue("yaf010", g_Suggest[5]); //社保机构银行帐号ID
        Base.setValue("yae597", g_Suggest[0]); //开户银行名称
        Base.setValue("aae009", g_Suggest[1]); //社保机构银行户名
        Base.setValue("aae010", g_Suggest[2]); //社保机构银行账号
        Base.setValue("yad158_m", g_Suggest[4]); //征集套账类型
        Base.setValue("aae008", g_Suggest[6]); //银行编号
    }
    
    //查询
    function fnQuery() {
        //清空列表
        Base.clearGridData("danjuGrid");
        Base.clearData("pnlFina");
        Base.setValue("yae819", "1");
        //当事人ID 查询征集单信息
        Base.submit("pnlJS", "receivablestqAction!toCheckAAZ010.do");
    }
    
    //保存
    function submitData() {
        //获取选中的单据信息
        var rows = Base.getGridSelectedRows("danjuGrid");
        var param = {};
        var yad003 = Base.getValue("yad003");
        // 未选择征集单直接待转金分配
        if(rows.length != 0){
        	var yad158 = Base.getValue("yad158");
	    	var yad158_m = Base.getValue("yad158_m");
	        if (yad158 != yad158_m) {
	            Base.alert("银行信息套账类型和征集单据的套账类型不一致!", "warn");
	            return;
	        }
	        
	        //征集单信息与收款金额一致
	        var aae019 = parseFloat(rows[0].aae019);
	        if (yad003 == aae019) {
	            var param = {};
	            param.gridList = Ta.util.obj2string(rows);
	            Base.submit("form1", "receivablestqAction!toSave.do", param);
	            return;
	        } else{	//不等 则弹框 在子页面上进行处理
	            param["dto['aae019']"] = aae019;
	            param["dto['aaz288']"] = rows[0].aaz288;
	        }
        }
        
        param["dto['yad003']"] = yad003;
        param["dto['aaz010']"] = Base.getValue("aaz010");
        param["dto['aad005']"] = Base.getValue("aad005");
		param["dto['aad017']"] = Base.getValue("aad017");
		param["dto['aad009']"] = Base.getValue("aad009");
		param["dto['yaf010']"] = Base.getValue("yaf010");
		param["dto['yae819']"] = Base.getValue("yae819");
		param["dto['yae597']"] = Base.getValue("yae597");
		param["dto['aae010']"] = Base.getValue("aae010");
		param["dto['aae009']"] = Base.getValue("aae009");
		param["dto['aae008']"] = Base.getValue("aae008");
		param["dto['yad158']"] = Base.getValue("yad158");
		param["dto['yad158_m']"] = Base.getValue("yad158_m");
        
        Base.openWindow("userwin", "基金收款登账", myPath() + "/process/publicBusiness/manageFinancial/receivablestq/receivablestqEditAction.do", param, "95%", "90%", null,
        function() {
            Base.submit("aaz010", "receivablestqAction!toCheckAAZ010.do");
        },
        true);

    }

    //统计待处理金额总计
    function selectChage(rowsdata, n) {
        //单据信息
        var rows = Base.getGridSelectedRows("danjuGrid");
        if (rows.length != 0) {
            var yad158 = rows[0].yad158; //征集帐套类型
            var isyad158 = true;
            //迭代比较征集帐套类型
            for (var i = 0; i < rows.length; i++) {
                if (yad158 != rows[i].yad158) {
                    isyad158 = false; //征集帐套类型不一致 
                }
            }
            if (!isyad158) {
                Base.alert("征集帐套类型不一致！", "warn");
                Base.setValue("yad158", "");
                Base.setValue("yaf010", "");
                Base.setValue("yae597", "");
                Base.setValue("aae010", "");
                Base.setValue("aae009", "");
                Base.setDisabled("saveBtn");
                return;
            } else {
                Base.setValue("yad158", yad158);
                Base.setEnable("addBtn,yaf010,aad005,aad017,yad003,aad009");
            }
        }
        //合计金额
        if ("0" != n) {
            var aae019 = Number(0);
            for (var i = 0; i < rows.length; i++) {
                aae019 = aae019 + parseFloat(rowsdata[i]);
            }
            Base.setValue("heji", aae019.toFixed(2) * 100 / 100);
        } else {
            Base.setValue("heji", "0");
        }
    }
    
    //金额渲染函数 红色
    function fnFormatter1(row, cell, value, columnDef, dataContext) {
        return "<span style='color:red;'>" + dataContext.aae019 + "</span>";
    }
    
    //多参数检索下拉框数据
    function callBankRPC() {
        var yad158 = Base.getValue('yad158');
        if (yad158 == '' || yad158 == null) {
            suggestQuery(3, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbTqString.do", {
                "dto['inputString']": Base.getValue('yaf010'),
                "dto['aae140']": "1000",
                "dto['aaa082']": "1"
            });
        } else {
            suggestQuery(3, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
                "dto['inputString']": Base.getValue('yaf010'),
                "dto['aae140']": Base.getValue('yad158'),
                "dto['aaa082']": "1"
            });
        }
    }
    function showBankRPC(){
    	Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow05.do",{"dto['aae140']" : Base.getValue('yad158')},1000,450,null,null,true);
    }
    function dbClick(e, row) {
        var aaz288 = row.aaz288;
        var sfxxgrmx = '1'; //显示个人征集明细
        Base.openWindow('userwin', "单据详细信息", myPath() + "/process/publicBusiness/publicQuery/unitPersonQuery/unitInfoComQueryAction!dbClick.do", {
            "dto['aaz288']": aaz288,
            "dto['sfxxgrmx']": sfxxgrmx
        },
        "95%", "90%", null, null, true);
    }
</script>
<%@ include file="/ta/incfooter.jsp"%>