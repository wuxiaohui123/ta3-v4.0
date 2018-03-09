<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>基金收款登帐</title>
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
			<ta:panel id="pnlJS" key="查询条件" cols="3" expanded="false" scalable="false">
				<ta:box cols="2">
					<ta:text id="aaz010" key="当事人ID" maxLength="20" labelWidth="120" columnWidth="0.9" required="true" onChange="callDsrRPC()"  bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询"/>
					<ta:buttonLayout align="left" columnWidth="0.1">
						<ta:button id="showDsrBtn" key="?" onClick="showDsrRPC()"/>
					</ta:buttonLayout>
				</ta:box>
				<ta:text id="yaa030" key="当事人名称" labelWidth="140" readOnly="true" span="2" />
				<ta:box cols="2">
					<ta:text id="aaz288" key="征集单ID" labelWidth="120" columnWidth="0.9" required="true" onChange="callZjdRPC()"/>
					<ta:buttonLayout align="left" columnWidth="0.1">
						<ta:button id="showZjdBtn" key="?" onClick="showZjdRPC()"/>
					</ta:buttonLayout>
				</ta:box>
			    <ta:number id="yad001" key="收款金额" min="0" precision="2" labelWidth="140"/>
			    <ta:selectInput id="yad158_nw" key="帐套类型" collection="YAD158" labelWidth="140" filter="1000,1001,1002,1311" reverseFilter="true"/>
			    <ta:text id="flag" key="" labelWidth="140" readOnly="true" display="false" />
			</ta:panel>
			<ta:tabs id="tabs" fit="true">
				<ta:tab id="tab1" key="基金收款登帐">
					<ta:panel id="pnl1" fit="true">
						<ta:panel id="pnlFina" key="基金收款信息（请先选择业务单据信息，再录入基金收款信息）" cols="3"  height="85">
						<ta:box cols="2">
							<ta:text id="yaf010" key="社保机构银行帐号ID" required="true" maxLength="40" labelWidth="140" columnWidth="0.9" onChange="callBankRPC()"/>
							<ta:buttonLayout align="left" columnWidth="0.1">
								<ta:button id="showBankBtn" key="?" onClick="showBankRPC()"/>
							</ta:buttonLayout>
						</ta:box>
						<ta:text id="yae597" key="开户银行名称" labelWidth="140" readOnly="true" />
						<ta:text id="aae010" key="社保机构银行账号" labelWidth="140" />
						<ta:text id="aae009" key="社保机构银行户名" labelWidth="140" />
						<ta:selectInput id="aad005" key="收款结算类型" labelWidth="140" collection="AAD005" required="true" isAutoExtend="true" filter="10,11" reverseFilter="true"/>
						<ta:date id="aad017" key="收款时间" showSelectPanel="true" labelWidth="140" required="true" validNowTime="left" />
						<ta:number id="yad003" key="收款金额" alignLeft="true" required="true" precision="2" labelWidth="140" max="999999999999.99"/>
						<ta:text id="aad009" key="缴费凭证编号" labelWidth="140" maxLength="20"/>
						<ta:selectInput id="yae819" key="是否立即实收分配" labelWidth="140" collection="YAE819" required="true" readOnly="true"/>
						<ta:text id="aae008" key="银行编号" display="false" />
						<ta:text id="aaf002" key="金融机构行业代码" display="false" />
						<ta:text id="aaz002" key="业务日志ID" display="false" />
						<ta:text id="heji" key="合计" display="false"/>
						<ta:text id="yad158" key="征集套账类型-dataGrid" display="false" />
						<ta:text id="yad158_m" key="征集套账类型-rpc" display="false" />
						</ta:panel>
					<ta:panel id="pnl1" key="业务单据信息（单次操作只能操作相同帐套数据）" fit="true" scalable="false" expanded="false" hasBorder="true">
						<ta:datagrid id="danjuGrid" fit="true" forceFitColumns="true" onRowDBClick="dbClick" snWidth="30" haveSn="true" selectType="checkbox" onSelectChange="selectChage">
							<ta:datagridItem id="aaz288" key="征集通知ID" align="center" maxChart="7"/>
							<ta:datagridItem id="aaz010" key="当事人ID" align="center" maxChart="5"/>
							<ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" maxChart="7"/>
							<ta:datagridItem id="aae019" key="应处理金额" dataAlign="right" align="center" maxChart="5" totals="sum" formatter="fnFormatter" tatalsTextShow="false"/>
							<ta:datagridItem id="aae041" key="开始期号" dataAlign="right" align="center" />
							<ta:datagridItem id="aae042" key="结束期号" dataAlign="right" align="center" />
							<ta:datagridItem id="yad158" key="帐套类型" align="center" collection="yad158" maxChart="5"/>
							<ta:datagridItem id="aae013" key="备注" align="center" maxChart="7" showDetailed="true" />
							<ta:datagridItem id="aae281" key="征集通知单据号" hiddenColumn="true" />
						</ta:datagrid>
						</ta:panel>
					</ta:panel>
					
				</ta:tab>
				<ta:tab id="tab2" key="事件流程记录">
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $("body").taLayout();
        //收款金额数字标红 加粗
        $("#yad003").css({
            "color": "red",
            "font-weight": "bold"
        });
        Base.setDisabled("saveBtn,saveBtn2");
        Base.hideObj("pnl_hd");
        Base.setReadOnly("aae009,aae010,aad005,aad017,yad003,aad009,aad127,yae819");
        initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 4, fnSelect1, 0, false);
        initializeSuggestFramework(2, 'ad21', 'aaz288', 230, 200, 1, fnSelect2, 0, false);
        initializeSuggestFramework(3, 'af07', 'yaf010', 700, 100, 4, fnSelect3, 0, false);
    });
  	//当事人ID RPC
    function callDsrRPC(){
    	sfwQueryUtil_newRPC(1,'getDSRXXString',{"dto['inputString']":Base.getValue('aaz010')});
    }
    function showDsrRPC(){
    	Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow06.do",null,1000,450,null,fn_setDsrData,true);
    }
    function fn_setDsrData(){
    	Base.submit("pnlJS", "ReceivablesAction!toCheckAAZ010.do");
    }
    //征集单RPC
    function callZjdRPC(){
    	sfwQueryUtil(2,'getAAZ288String',Base.getValue('aaz288'));
    }
    function showZjdRPC(){
    	Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow07.do",null,1000,450,null,fn_setZjdData,true);
    }
    function fn_setZjdData(){
    	Base.submit("pnlJS", "ReceivablesAction!toCheckAAZ010.do");
    }
    
    function fnSelect1() {
        Base.setValue("aaz010", g_Suggest[1]);
        Base.setValue("yaa030", g_Suggest[2]);
        Base.clearGridData("danjuGrid");
        Base.clearData("pnlFina");
        Base.clearGridData("infoGrid");
        Base.clearGridData("ae02Grid");
        Base.setValue("aae016", "");
        Base.setValue("aae416", "");
        Base.setValue("aae419", "");
        Base.submit("pnlJS", "receivablesAction!toCheckAAZ010.do");
    }
    
    //查询
    function fnSelect2() {
        Base.clearGridData("danjuGrid");
        Base.clearData("pnlFina");
        Base.clearGridData("ae02Grid");
        Base.setValue("aae016", "");
        Base.setValue("aae416", "");
        Base.setValue("aae419", "");
        Base.submit("pnlJS", "receivablesAction!toCheckAAZ010.do");
    }
    
    //机关养老 社保机构账号信息
    function fnSelect3() {
        Base.setValue("yaf010", g_Suggest[5]);
        Base.setValue("yae597", g_Suggest[0]);
        Base.setValue("aae009", g_Suggest[1]);
        Base.setValue("aae010", g_Suggest[2]);
        Base.setValue("yad158_m", g_Suggest[4]);
        Base.setValue("aae008", g_Suggest[6]);
        Base.setValue("aaf002", g_Suggest[7]);
        Base.focus("aad005");
    }
    
    //查询
    function fnQuery() {
        Base.clearGridData("danjuGrid");
        Base.clearGridData("infoGrid");
        Base.clearData("pnlFina");
        Base.clearGridData("ae02Grid");
        Base.setValue("aae016", "");
        Base.setValue("aae416", "");
        Base.setValue("aae419", "");
        Base.submit("pnlJS", "receivablesAction!toCheckAAZ010.do");
    }
    
    //保存
    function submitData() {
        var yaf010 = Base.getValue("yaf010");
        if (yaf010 == null || yaf010 == '') {
            alert('社保机构银行帐号ID不能为空!');
            Base.focus("yaf010");
            return;
        }
        var aad005 = Base.getValue("aad005");
        if (aad005 == null || aad005 == '') {
            alert('收款结算类型不能为空!');
            Base.focus("aad005");
            return;
        }
        var aad017 = Base.getValue("aad017");
        if (aad017 == null || aad017 == '') {
            alert('收款时间不能为空!');
            Base.focus("aad017");
            return;
        }
        var yad003 = Base.getValue("yad003");
        if (yad003 == null || yad003 == '') {
            alert('收款金额不能为空!');
            return;
        }
        var yae819 = Base.getValue("yae819");
        if (yae819 == null || yae819 == '') {
            alert('是否立即实收分配不能为空!');
            return;
        }
        var rows = Base.getGridSelectedRows("danjuGrid"); //获取表格选中行
        var infoGrid = Base.getGridData("infoGrid");
        if (rows.length == 0) {
            alert("请勾选要处理的单据！");
        } else {
            fnSaveOrReset('1', 'danjuGrid', 'aaz288', '0');
            //判断处理单据是否为同一当事人
            var aaz010 = rows[0].aaz010; //当事人ID
            var yad158 = rows[0].yad158; //征集帐套类型
            var isTrue = true;
            var isyad158 = true;
            for (var i = 0; i < rows.length; i++) {
                if (aaz010 != rows[i].aaz010) {
                    isTrue = false;
                }
                if (yad158 != rows[i].yad158) {
                    isyad158 = false;
                }
            }
            if (!isTrue) {
                Base.alert("处理单据不属于同一当事人！", "warn");
                return;
            } else if (!isyad158) {
                Base.alert("征集帐套类型不一致！", "warn");
                return;
            } else if (Base.getValue("yad158") != Base.getValue("yad158_m")) {
                Base.alert("银行信息套账类型和征集单据的套账类型不一致", "warn");
                Base.setValue("yad158", "");
                Base.setValue("yaf010", "");
                Base.setValue("yae597", "");
                Base.setValue("aae010", "");
                Base.setValue("aae009", "");
                Base.focus("yaf010");
                return;
            } else if (infoGrid.length == 0) {
                var param = {};
                param.gridList = Ta.util.obj2string(rows);
                Base.submit("pnlFina", "receivablesAction!toSave.do", param);
            } else if (infoGrid.length != 0) {
                var param = {};
                param.infoGrid = Ta.util.obj2string(infoGrid);
                param.gridList = Ta.util.obj2string(rows);
                var aae019 = Number(0);
                for (var i = 0; i < rows.length; i++) {
                    aae019 = parseFloat(rows[i].aae019) + aae019;
                }
                aae019 = aae019.toFixed(2) * 100 / 100;
                var yad003 = Number(0);
                for (var i = 0; i < infoGrid.length; i++) {
                    yad003 = parseFloat(infoGrid[i].yad003) + yad003;
                }
                yad003 = yad003.toFixed(2) * 100 / 100;
                if (aae019 != yad003) {
                    alert("应处理总金额(" + aae019 + ")与收款总金额不一致(" + yad003 + ")!");
                    return;
                } else {
                    Base.submit("", "receivablesAction!toSaveInfo.do", param);
                }
            }
        }
    }
    
    //统计待处理金额总计
    function selectChage(rowsdata, n) {
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
                Base.setReadOnly("yaf010,aad005,yad003,aad017,aad009,aad127");
                return;
            } else {
                Base.setValue("yad158", yad158);
                Base.setEnable("saveBtn,yaf010,aad005,aad017,aad009,aad127,saveBtn2");
            }
        } else {
            Base.setDisabled("saveBtn");
            Base.setReadOnly("yaf010,aad005,aad017,yad003,aad009,aad127,yae819");
        }

        if ("0" != n) {
            var aae019 = Number(0);
            for (var i in rowsdata) {
                aae019 = aae019 + Number(rowsdata[i].aae019);
            }
            aae019 = Math.round(aae019 * 100) / 100;
            Base.setValue("heji", aae019);
            Base.setValue("yad003", aae019);
        } else {
            Base.setValue("heji", "0");
            Base.setValue("yad003", "0");
        }
    }
    
    function fnFormatter(row, cell, value, columnDef, dataContext) {
        return "<span style='color:red;'>" + dataContext.aae019 + "</span>";
    }
    
    //多参数检索下拉框数据
    function callBankRPC() {
        suggestQuery(3, myPath() + "/process/synthesis/suggestFrameworkAction!getBankInjbString.do", {
            "dto['inputString']": Base.getValue('yaf010'),
            "dto['aae140']": Base.getValue('yad158'),
            "dto['aaa082']": "1"
        });
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

    /*bz='1'确认勾选,bz='0'取消 
      ids 为所操作grid的id(只支持单个)
      cel 为grid某列的id,只要不为空即可，最好为aab001，aac001 一类
      flag 需要设置一个text隐藏域来设置选择标志 初始值为0*/
    function fnSaveOrReset(bz, ids, cel, flag) {
        var selectedRows = Base.getGridSelectedRows(ids);
        var temp = '[';
        var rows = Base.getObj(ids); //获取列表数据
        var celtemp;
        if (bz == 1) {
            for (var i = 0; i < selectedRows.length; i++) {
                celtemp = "selectedRows[" + i + "]." + cel;
                temp = temp + "{" + cel + ":" + eval(celtemp) + "},";
            }
            temp = temp.substring(0, temp.length - 1) + "]";
            Base.setValue("flag", "1");
            $("#" + ids).find("input[type='checkbox']").attr('disabled', 'disabled');
            $("#" + ids).attr('display', 'none');
        } else {
            Base.setValue("flag", "0");
            ows.setSelectedRows([]); //将选中复选框全部清空
        }
    }
</script>
<%@ include file="/ta/incfooter.jsp"%>