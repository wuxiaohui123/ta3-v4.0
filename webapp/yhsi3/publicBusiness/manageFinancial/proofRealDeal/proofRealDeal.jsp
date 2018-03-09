<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>拨款凭证实处理</title>
<%@ include file="/ta/inc.jsp"%>
</head>
   <body>
      <ta:pageloading/>
      <ta:form id="form1" fit="true">
	         <ta:toolbar id="tlb">
	           <ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery();"  asToolBarItem="true"/>
	           <ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave();"  asToolBarItem="true"/>
			   <ta:button id="cancelBtn" key="作废[F]" icon="xui-icon-spotDelete" hotKey="F" onClick="fnCancel();"  asToolBarItem="true"/>
			   <ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage"  asToolBarItem="true"/>
		    </ta:toolbar>
			<ta:panel id="pnlJS" key="查询条件" cols="3" expanded="false" scalable="false">
			    <ta:text id="yad154" key="票据编号"/>
			</ta:panel>
			<ta:panel key="处理信息" cols="3" id="fltdate" expanded="false" scalable="false">
				<ta:number id="aad127" key="附件张数" max="999" min="0" alignLeft="true" />
				<ta:date id="aad017" key="缴费日期" showSelectPanel="true"/>
				<ta:button id="setBtn" key="批量设置" onClick="setAad127();" />
			</ta:panel>
			<ta:tabs id="pnlInfo" fit="true">
			    <ta:tab id="tab1"  key="待处理单据">
				    <ta:datagrid id="danjuGrid"  fit="true"  snWidth="30" haveSn="true" selectType="checkbox" forceFitColumns="true">
					    <ta:datagridItem id="yad155" key="保险费票据登记ID" align="center" dataAlign="left" hiddenColumn="false"/>
						<ta:datagridItem id="yad154" key="保险费票据编号" align="center" dataAlign="left" maxChart="7"/>
						<ta:datagridItem id="aad127" key="附件张数" align="center" dataAlign="left" maxChart="4">
						    <ta:datagridEditor max="999" min="0" required="true" type="number"/>
						</ta:datagridItem>
						<ta:datagridItem id="aad017" key="缴费日期" align="center" dataAlign="center" maxChart="8">
						    <ta:datagridEditor required="true" type="date" showSelectPanel="true"/>
						</ta:datagridItem>
						<ta:datagridItem id="yad003" key="实处理金额" align="center" dataAlign="right" maxChart="5"/>
						<ta:datagridItem id="yad162" key="票据类型" align="center" dataAlign="left" collection="YAD162" maxChart="8"/>
						<ta:datagridItem id="aad016" key="收款方式" align="center" dataAlign="left" collection="AAD016" maxChart="8"/>
					</ta:datagrid> 
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
        Base.setDisabled("saveBtn,cancelBtn");
        Base.hideObj("tab2");
        Base.focus("yad154");
	});
	//查询
	function fnQuery(){
        Base.clearGridData("danjuGrid");
	    Base.submit("pnlJS","proofRealDealAction!toQuery.do");
	}
	//保存
	function fnSave(){
	    var rows = Base.getGridSelectedRows("danjuGrid");
	    if(row.length==0){
	        alert("请勾选需要作废保存的单据信息!");
	        return;
	    }else{
	        var param = {};
	        param.rows = Ta.util.obj2string(rows);
	        Base.submit("form1","proofRealDealAction!toSave.do",param);
	    }
	}
	//作废
	function fnCancel(){
	    var rows = Base.getGridSelectedRows("danjuGrid");
	    if(row.length==0){
	        alert("请勾选需要作废的单据信息!");
	        return;
	    }else{
	        var param = {};
	        param.rows = Ta.util.obj2string(rows);
	        Base.submit("form1","proofRealDealAction!toCancel.do",param);
	    }
	}
	//设置附件张数 缴费时间
	function setAad127(){
	    var aad127=Base.getValue("aad127");
	    var aad017=Base.getValue("aad017");
	    var selectData=Base.getGridSelectedRows("danjuGrid");
	    if(selectData==""){
	        alert("请勾选数据!");
	        return;
	    }
	    var j = selectData.length;
	    for (var i = 1; i <= j; i++) {
	        Base.setGridRowData("danjuGrid", selectData[i-1]._row_+1, {"aad127":aad127,"aad017":aad017});
	    }
	    Base.alert("批量赋值成功!","success");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>