<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:form id="form" fit="true">
			<ta:panel id="detail" hasBorder="false" fit="true" expanded="false" scalable="false">
				<ta:datagrid id="detailGrid" haveSn="true" dblClickEdit="true" fit="true" >
					<ta:datagridItem key="医疗登记ID" id="aaz194" hiddenColumn="false" />
					<ta:datagridItem key="费用类别" id="ylf103" collection="YLF103"
						width="180" align="center" dataAlign="left" />
					<ta:datagridItem key="申报金额" id="ylf104" align="center" width="155" totals="sum" />
					<ta:datagridItem key="自费金额" id="ylf106" align="center" width="155" totals="sum" />
<%					
//					<ta:datagridItem id="ylf105" key="<font color='red'>扣减金额</font>" totals="sum" align="center" dataAlign="left" width="200">
//			    		<ta:datagridEditor type="number" max="999999" precition="2" min="0" onChange="validateNumber" />
//			    	</ta:datagridItem>
%>			    	
                    <ta:datagridItem key="扣减金额" id="ylf105" align="center" width="155" totals="sum" />
			    	<ta:datagridItem key="支付金额" id="aae187" align="center" width="155" totals="sum" />
			    	<ta:datagridItem key="补助标志" id="ylf107" align="center" width="155" collection="SFBZ"/>
				</ta:datagrid>
			    <ta:panelButtonBar align="center">
			    	<ta:button id="saveBtnDetail" icon="xui-icon-spotSave" key="保存" onClick="submitDetail()" />
					<ta:button id="resetBtnDetail" icon="xui-icon-spotReset" key="重置" onClick="clearData()" display="false"/>
					<ta:button id="colseBtnDetail" icon="xui-icon-spotClose" key="关闭" onClick="parent.Base.closeWindow('fileInfo');"/>
			    </ta:panelButtonBar>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	function fnClose(){
		parent.Base.closeWindow("fileInfo");
	}
	
	function validateNumber(data,value){
		if(data.item.ylf107 == "1"){
			Base.alert("补助金额不能扣减！","warn");
			Base.setGridCellData("detailGrid", data.row+1, data.cell, "");
			return false;
		}
		
		var balance = data.item.ylf104 - data.item.ylf106 - value;
		if(balance < 0){
			Base.alert("余额小于零！","warn");
			Base.setGridCellData("detailGrid", data.row+1, data.cell, "");
			return false;
		}
		data.item.aae187 = balance;
		Base.setGridRowData("detailGrid", data.row+1, data.item);
		//Base.setGridCellData("detailGrid", data.row, data.cell+1, balance);
	}
	
	function clearData(){
		Base.clearGridDirty("detailGrid");
	}
	
	function submitDetail(){
		var data = Base.getGridData("detailGrid");
		var minus = 0;
		for(var i = 0; i < data.length; i++){
			minus = minus + data[i].ylf105;
		}
		if(minus == 0){
			Base.alert("扣减金额为0，不能保存！","warn");
			return false;
		}
		
		Base.submit("form", "medicalCalculateAction!toSaveDetail.do",{"DetailList":Ta.util.obj2string(data)},null,null,function(){
			//parent.Base.closeWindow("fileInfo");
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>