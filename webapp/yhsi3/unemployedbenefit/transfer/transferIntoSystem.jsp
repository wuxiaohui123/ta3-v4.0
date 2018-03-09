<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TransferInto</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" disabled="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印失业证[P]" onClick="print()" hotKey="P" asToolBarItem="true" disabled="true" />
			<ta:button id="printBtn2" icon="xui-icon-spotPrint" key="打印失业保险金申领表" onClick="printRaq()" asToolBarItem="true" disabled="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:text id="sysdate" key="系统时间" display="false" />
	<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
		<ta:panel id="procInc" key="审核信息">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
		</ta:panel>
		<ta:panel id="fld_emp" cols="3" key="基本信息">
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDyAll.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
			<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130" />
			<ta:text id="aab001" key="失业代管单位代码" labelWidth="130" onChange="sfwQueryUtil(4,'getAb01A1',Base.getValue('aab001'))" required="true" />
			<ta:text id="aae044" key="单位名称" readOnly="true" labelWidth="130" span="2" />
			<ta:number key="联系电话" id="aae005" labelWidth="130" onChange="updatePhone()" />
			<ta:number key="联系电话" id="aae005_old" labelWidth="130" display="false" />
			<ta:text id="aaz157" key="参保明细ID" display="false" />
			<ta:text id="aaz159" key="参保关系ID" display="false" />
		</ta:panel>
		<ta:panel id="daiyxx" key="待遇信息" cssStyle="display:none">
			<ta:datagrid id="daiyxxList" height="100px">
				<ta:datagridItem showDetailed="true" id="aaa036" key="待遇项目" dataAlign="center" align="center" width="310px" collection="AAA036" />
				<ta:datagridItem showDetailed="true" id="aae041" key="待遇开始年月" dataAlign="center" align="center" width="310px" />
				<ta:datagridItem showDetailed="true" id="aae042" key="待遇结束年月" dataAlign="center" align="center" width="310px" />
				<ta:datagridItem showDetailed="true" id="aae129" key="<font color='red'>待遇金额</font>" dataAlign="right" align="right" width="310px" />
			</ta:datagrid>
		</ta:panel>
		<ta:box id="ffxx">
			<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
		</ta:box>

		<ta:selectInput id="aaz009_old" key="代发机构名称" display="false" />
		<ta:selectInput id="yaf012_old" key="开户银行类别" display="false" collection="AAF002" onSelect="getAAE008" />
		<ta:selectInput id="yaf013_old" key="开户银行编号" display="false" />
		<ta:text id="yaf001_old" key="开户银行名称" display="false" />
		<ta:text id="aaz009_o" key="代发机构ID" display="false" />
		<ta:text id="yaf013_o" key="开户银行编号_o" display="false" />

		<ta:panel id="zyxx" key="转移前信息" bodyStyle="margin:0px" cols="3">
			<ta:selectInput id="sfbz" key="是否区直转入" required="true" labelWidth="130" collection="SFBZ" value="1" onSelect="CheckYie014" display="false" />
			<ta:text id="yie014" key="区直转出证明号" labelWidth="130" required="true" value="0" display="false" />
			<ta:date id="ajc090" key="失业时间" required="true" labelWidth="130" showSelectPanel="true" />
			<ta:selectInput id="ajc093" key="失业原因" required="true" labelWidth="130" collection="AJC093" />
			<ta:date id="aae210" key="待遇享受开始年月" issue="true" showSelectPanel="true" labelWidth="130" />
			<ta:number id="ajc071" key="参保缴费月数" max="500" required="true" labelWidth="130" display="false" value="0" />
			<ta:number id="ajc099" key="剩余享受月数" max="50" required="true" labelWidth="130" display="false" value="0" />
			<ta:text id="aac071" key="所在单位名称" labelWidth="130" required="true" />
			<ta:text id="aac072" key="社保机构名称" labelWidth="130" required="true" />
			<ta:text id="aac073" key="社保机构帐号" labelWidth="130" />
			<ta:number id="aac074" key="社保机构邮政编码" labelWidth="130" max="999999" min="100000" />
			<ta:text id="aac075" key="社保机构开户行行号" labelWidth="130" />
			<ta:selectInput key="培训意向" collection="YJC002" id="yjc002" labelWidth="130" />
		</ta:panel>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		fn_FfxxlrInitialization();
		initializeSuggestFramework(1, null, "aac001", 500, 200, 5, fn_queryInfo, 1, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)		
		initializeSuggestFramework(4, "ab01", "aab001", 400, 200, 2, fn_getAe10, 1, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
	});

	//RPC
	function convertState(row, cell, value, columnDef, dataContext) {
		var val = value + '';
		var x = val.split('.'), x1 = x[0], x2 = x.length > 1 ? '.' + x[1] : '.00', rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
		value = x1 + x2;
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>" + value + "</div>";
	}
	//回调函数	
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("aac001,aac002,aac003,aae140", "transferIntoSystemAction!queryBaseInfo.do", null, null, null, function() {
				var grid = Base.getObj("ad12List");
				var rows = [];
				rows.push(0);
				//设置指定行被选中
				grid.setSelectedRows(rows);
			});
			var aac002 = Base.getValue("aac002");
			var aac003 = Base.getValue("aac003");
			Base.setValue("aae136", aac002);
			Base.setValue("aae133", aac003);
		}
	}

	function fn_getAe10() {
		//RPC列表取值
		if (g_Suggest != "") {
			Base.setValue('aab001', g_Suggest[0]);
			Base.setValue('aae044', g_Suggest[1]);
		}
	}

	function fn_ab01Info() {
		if (g_Suggest != "") {
			fn_setUnitBaseInfoData();
		}
	}

	//保存经办信息
	function submitData() {
		var prm = {};
		var sfbz = Base.getValue("sfbz");
		if (sfbz != "1") {
			var ad21list = Base.getGridData("ad12List");
			if (ad21list.length <= 0) {
				alert("没有该人员的登帐数据！");
				return false;
			}
			var selectRows = Base.getGridSelectedRows("ad12List");
			if (selectRows.length == 0) {
				alert("请选择登帐数据！");
				return false;
			}
			prm.d2List = Ta.util.obj2string(selectRows);
		}
		Base.submit("form1", "transferIntoSystemAction!toSave.do", prm, null, null, null);
	}

	//覆盖公用js方法，以便填充退休申报单位名称对应数据,如果不需要录入退休申报单位则将此方法直接删除既可。
	function fn_ab01Infotx() {
		Base.setValue("aab071", g_Suggest[1]);
		if (g_Suggest[0] == '' || g_Suggest[0] == null){
			Base.setValue("aab999_1", g_Suggest[1]);
		}
		else{
			Base.setValue("aab999_1", g_Suggest[0]);
		}
		Base.setValue("aae044_1", g_Suggest[2]);
	}

	function CheckYie014() {
		var sfbz = Base.getValue("sfbz");
		if (sfbz == '1') {
			Base.setValue("yie014", "");
			Base.showObj("yie014");
			Base.hideObj("zrjjxx");
		} else {
			Base.setValue("yie014", "");
			Base.hideObj("yie014");
			Base.showObj("zrjjxx");
		}
	}
	
	//套打失业证
	function print(){
	    var aac001 = Base.getValue("aac001");
		if(aac001==''||aac001==null){
			Base.alert("没有获取到个人编号，请联系管理员！");
			return;
		}	
		$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=shiyezheng.raq&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString=aac001=" + aac001);				
	}
	  //打印失业待遇
	function printRaq(){
	    
	    var aaz002 = Base.getValue("aaz002");
	    var aae140 = Base.getValue("aae140");
	    if(aaz002==''||aaz002==null){
				Base.alert("没有获取到业务日志ID，请联系管理员！");
				return;
			}
			
		if(aae140==''||aae140==null){
			Base.alert("没有获取到险种信息，请联系管理员！");
			return;
		}
	    
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SYbxjslb.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aaz002=" + aaz002+";aae140="+aae140);
	}
	  
    function updatePhone(){
		if(confirm("是否修改电话号码？")){
		   Base.submit("form1","<%=path%>/process/unemployedbenefit/approve/UneTreatmentCalculation/uneTreatmentCalculationAction!updatePhone.do",null,null,false);
   	    }else{
   	       return false;
   	    }
		
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>