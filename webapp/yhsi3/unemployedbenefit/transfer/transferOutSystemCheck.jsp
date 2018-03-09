<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>TransferInto</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:buttonLayout align="center" span="3">
				<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" disabled="true"/>
	    		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false"/>
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
				<%@ include file="/yhsi3/benefit/common/personBaseInfo.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
				<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130"/>
				<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
				<ta:text id="aae044" key="单位名称"  readOnly="true" labelWidth="130" span="2"/>
				<ta:text id="yje004" key="失业证号" readOnly="true" labelWidth="130" />
				<ta:text id="ajc090" key="失业时间" readOnly="true" labelWidth="130" />
				<ta:text id="ajc094" key="失业登记日期" readOnly="true" labelWidth="130" />
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" readOnly="true" labelWidth="130" />
				<ta:text id="aae210" key="待遇开始年月" readOnly="true" labelWidth="130" />
				<ta:text id="ajc056" key="待遇终止年月" readOnly="true" labelWidth="130" />
				<ta:number id="ajc001" key="视同缴费月数" readOnly="true" labelWidth="130" />
				<ta:number id="ajc071" key="实际缴费月数" readOnly="true" labelWidth="130" />
				<ta:number id="ajc072" key="累计缴费月数" readOnly="true" labelWidth="130" display="false"/>
				<ta:number id="ajc097" key="应享受待遇月数" readOnly="true" labelWidth="130" display="false"/>
				<ta:number id="ajc098" key="已享受遇月数" readOnly="true" labelWidth="130" display="false"/>
				<ta:number id="ajc099" key="剩余享受月数" readOnly="true" labelWidth="130" />
				<ta:text id="aaz157" key="参保明细ID" display="false" />
				<ta:text id="aaz159" key="参保关系ID" display="false" />
				<ta:text id="aaz257" key="定期待遇人员ID" display="false" />
				<ta:text id="fhjc" key="当前复核级次" display="false" />
				<ta:text id="yac001_next" key="个人最大发放期号的下期" display="false" />
			</ta:panel>		
			<ta:tabs id="tabs" height="130">
			    <ta:tab id="tab1" key="待遇信息">
						<ta:datagrid id="ac61List" fit="true">
							<ta:datagridItem id="aaa036" key="待遇项目" showDetailed="true" dataAlign="left" align="left" width="275px" collection="AAA036"/>
							<ta:datagridItem id="aae041" key="待遇开始年月" showDetailed="true"  dataAlign="center" align="center" width="275px" />
							<ta:datagridItem id="aae042" key="待遇结束年月" showDetailed="true"  dataAlign="center" align="center" width="275px"  />
							<ta:datagridItem id="aae019" key="<font color='red'>待遇金额</font>" showDetailed="true"  dataAlign="right" align="right" width="275px" formatter="convertState" dataType="number" />
						</ta:datagrid>
                </ta:tab>
			</ta:tabs>
			<ta:panel id="zyxx" key="转移后社会保险机构信息"    cols="3">
	            <ta:selectInput id="yab139_zr" key="参保机构" required="true" readOnly="true" labelWidth="130" collection="YAB003" />
				<ta:selectInput id="aae160" key="转出原因" required="true" readOnly="true" labelWidth="130" collection="AAE160" />
				<ta:date id="aae041" key="转出日期" required="true" showSelectPanel="true" readOnly="true" labelWidth="130" />
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	//RPC
	function convertState(row, cell, value, columnDef, dataContext){
	    var val = value + '';
		 var x = val.split('.'),x1 = x[0],x2 = x.length > 1 ? '.' + x[1] : '.00',rgx = /(\d+)(\d{3})/;
		 while (rgx.test(x1)) {
		    x1 = x1.replace(rgx, '$1' + ',' + '$2');
		 }
		 value = x1 + x2;
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>"+value+"</div>";
	}	
	
	//保存经办信息
	function submitData(){
		Base.submit("form1","transferOutSystemCheck1Action!toSave.do",null,null,null,null);
	}	
	
	$(document).ready(function() {
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>