<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>基金收款登帐(特权)</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar" >
		<ta:pageloading />
		<ta:form id="form1" fit="true">
			<ta:toolbar id="tlb1">
				<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
				<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="fnClose();" asToolBarItem="true" />
			</ta:toolbar>
			<ta:panel id="pnlJEinfo" key="金额信息" cols="4">
				<ta:text id="aae019" key="应处理金额" readOnly="true" labelWidth="125" />
				<ta:text id="aaz010" key="单位编号" display="false" />
				<ta:text id="yad003" key="收款金额" readOnly="true" labelWidth="125" />
				<ta:text id="yad001" key="可使用待转金" readOnly="true" cssStyle="color:red;" cssInput="color:red;" labelWidth="125" />
				<ta:text id="dzjsy" key="剩余可使用待转金" readOnly="true" cssStyle="color:blue;" cssInput="color:blue;" labelWidth="125" />
			</ta:panel>
			<!-- pnl_grid -->
			<ta:panel id="pnlFina" key="基金收款信息" cols="3" cssStyle="display:none">
				<ta:text id="yaf010" key="社保机构银行帐号ID" labelWidth="140" />
				<ta:text id="yae597" key="开户银行名称"  labelWidth="140" />
				<ta:text id="aae010" key="社保机构银行账号" labelWidth="140" />
				<ta:text id="aae009" key="社保机构银行户名" labelWidth="140" />
				<ta:selectInput id="aad005" key="收款结算类型" labelWidth="140" collection="AAD005"  />
				<ta:date id="aad017" key="收款时间" labelWidth="140" />
				<ta:text id="aad009" key="缴费凭证编号" labelWidth="140" />
				<ta:selectInput id="yae819" key="是否立即实收分配" labelWidth="140" collection="YAE819" />
				<ta:text id="aae008" key="银行编号" />
				<ta:text id="yad158" key="征集套账类型-dataGrid" />
				<ta:text id="yad158_m" key="征集套账类型-rpc" />
			</ta:panel>
			<ta:panel id="panel" key="收款登帐信息" layout="border" fit="true">
				<ta:box id="box1" cols="2" fit="true" height="100%">
					<ta:box height="100%" columnWidth="0.7" cssStyle="margin-right:1px;">
						<ta:panel id="pnl3" key="单据信息" fit="true">
							<ta:datagrid id="dgInfo" fit="true" forceFitColumns="true">
								<ta:datagridItem id="aaz288" key="征集通知ID" align="center" dataAlign="left" maxChart="6" hiddenColumn="true"/>
								<ta:datagridItem id="yae518" key="当事人核定ID" align="center" dataAlign="left" maxChart="6" />
								<ta:datagridItem id="aaz010" key="当事人ID" align="center" dataAlign="left" maxChart="5" />
								<ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" dataAlign="left" maxChart="9" />
								<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="AAE140" maxChart="9" showDetailed="true" />
								<ta:datagridItem id="yad001" key="应处理金额" dataAlign="right" align="center" maxChart="5" totals="sum" tatalsTextShow="false" />
							</ta:datagrid>
						</ta:panel>
					</ta:box>
					<ta:box height="100%" columnWidth="0.3" cssStyle="margin-left:1px;">
						<ta:panel id="pnl4" key="待转金信息" fit="true">
							<ta:datagrid id="dgDZJinfo" fit="true" forceFitColumns="true" selectType="checkbox" onSelectChange="fnSelectChange">
								<ta:datagridItem id="aae140" key="险种类型" align="center" dataAlign="left" collection="AAE140" maxChart="8" showDetailed="true"/>
								<ta:datagridItem id="yae080" key="待转金余额" dataAlign="right" align="center" maxChart="5" totals="sum" tatalsTextShow="false" />
								<ta:datagridItem id="bcsy" key="本次使用待转金" dataAlign="right" align="center" maxChart="7" totals="max" formatter="fnFormatter" tatalsTextShow="false">
									<ta:datagridEditor precition="2" min="0" type="number" onChange="fnChange"/>
								</ta:datagridItem>
							</ta:datagrid>
						</ta:panel>
					</ta:box>
				</ta:box>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $("body").taLayout();
        Ta.autoPercentHeight();
        Base.setDisabled("saveBtn");
    });
    
    function fnSelectChange() {
    	var rowsdata = Base.getGridSelectedRows("dgDZJinfo");
    	if(rowsdata.length == 0 ){
    		return false;
    	}
	    //可使用待转金总额
	    var yad001 = Base.getValue("yad001");
	    //本次增加待转金总额
	    var zjze = Number(0);
	    for (var i = 0; i < rowsdata.length; i++) {
	        var bcsy = rowsdata[i].bcsy;
	        zjze = zjze + parseFloat(bcsy);
	    }
	    if (Math.abs(zjze) < Math.abs(yad001)) {
	        Base.alert("可使用待转金【"+yad001+"】未完全分配到对应险种【"+zjze+"】！","warn");
	        Base.setDisabled("saveBtn");
	        return;
	    } else if (Math.abs(zjze) > Math.abs(yad001)) {
	        Base.alert("可使用待转金【"+yad001+"】分配到对应险种金额【"+zjze+"】过多！","warn");
	        Base.setDisabled("saveBtn");
	        return;
	    } else {
	        Base.setEnable("saveBtn");
	    }
    }
    
    //增加待转金 本次使用待转金变更事件
    function fnChange(data, value) {
        if (value == '') {
            return;
        }
      	var yad001 = Base.getValue("yad001");
      	if(yad001 < 0 && parseFloat(data.item.yae080) < parseFloat(data.item.bcsy)){
      		Base.alert("本次使用待转金不能大于待转金余额！","warn");
            Base.setGridCellData("dgDZJinfo", data.row + 1, data.cell, 0);
      	}
      	else{
      		fnSelectChange();
      	}
    }
    
    //本次使用待转金渲染函数
    function fnFormatter(row, cell, value, columnDef, dataContext) {
    	if(dataContext.bcsy == undefined){
    		return "";
    	}else if (dataContext.bcsy > 0) {
            return "<span style='color:red;'>" + dataContext.bcsy + "</span>";
        } else if (dataContext.bcsy <= 0) {
            return "<span style='color:blue;'>" + dataContext.bcsy + "</span>";
        }
    }
    
    //保存
    function submitData() {
    	//选中的单据信息
        var dgDZJinfo = Base.getGridSelectedRows("dgDZJinfo");
        if (dgDZJinfo.length == 0) {
            Base.alert("请勾选需要保存的待转金信息！","warn");
            return;
        }
        var dgInfo = Base.getGridData("dgInfo");
        var param = {};
        param.daizhuanList = Ta.util.obj2string(dgDZJinfo);
        param.danjuList = Ta.util.obj2string(dgInfo);
        Base.submit("form1", "receivablestqEditAction!toSaveEdit.do", param);
    }
    
    // 关闭
    function fnClose() {
        parent.Base.closeWindow("userwin");
    }
</script>
<%@ include file="/ta/incfooter.jsp"%>