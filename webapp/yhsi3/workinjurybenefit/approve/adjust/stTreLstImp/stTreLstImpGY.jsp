<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>dytzDR</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body style="margin: 0px; padding: 1px;" class="no-scrollbar"
		onload="Base.setDisabled('excel');Base.setDisabled('sel_excel');">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="queryBtn" icon="xui-icon-query" key="查询[Q]" onClick="query()" hotKey="ctrl+Q" asToolBarItem="true" display="false" />
			<ta:submit id="btnImp" url="stTreLstImpGYAction!upfile.do" key="导入[I]" icon="xui-icon-spotAdd" hotKey="ctrl+I" asToolBarItem="true" submitIds="form1" isSyncSubmit="true" />
			<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true"/>
	        <ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true"/>
		</ta:toolbar>

		<ta:form id="form1" action="" cssStyle="display:block" methord="post"
			enctype="multipart/form-data">
		<ta:panel id="qCon" key="文号查询" cols="3" >  
			<%@ include file="/yhsi3/comm/tzwhInfo.jsp"%>
		</ta:panel>
		<ta:panel id="imp" key="导入" >  
				<ta:box cols="3">
					<div style="width: 15%; padding-left: 100px">
						<input type="file" name="theFile" id="theFile" style="width:600px"/>
					</div>
					<div style="width: 15%; padding-left: 500px">
						<a onmouseover="this.style.color = 'RED';"
							onmouseout="this.style.color = 'rgb(161,161,161)';"
							id="dto(xzmb)_label" href="stTreLstImpGYAction!downFile.do"
							style="color: rgb(161, 161, 161); width: 200px;"> <strong>
								<pre>   >>下载模板<<</pre> </strong> </a>
					</div>
				</ta:box>
         </ta:panel>
			<ta:panel id="tzxx" key="调整信息">
				<ta:tabs id="tabs" height="400">
					<ta:tab id="tab1" key="导入成功">
						<ta:datagrid id="tzxxGrid1" haveSn="true" height="280"
							forceFitColumns="true">
							<ta:datagridItem field="aaz095" key="待遇调整方案ID" width="200" align="center" ></ta:datagridItem>
							<ta:datagridItem id="aae212" key="调整年月" width="140" align="center" ></ta:datagridItem>
							<ta:datagridItem id="yic008" key="供养关系" width="200" collection="AAE144" align="center" ></ta:datagridItem>
							<ta:datagridItem id="aaa036" key="调整待遇类别" width="140" align="center"
								collection="AAA036"></ta:datagridItem>
							<ta:datagridItem id="yie009" key="增资标准额" width="140" dataAlign="right" align="center" ></ta:datagridItem>
							<ta:datagridItem id="yie010" key="最低保障额" width="140" dataAlign="right" align="center" ></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab2" key="导入失败">
						<ta:datagrid id="tzxxGrid2" haveSn="true" height="280"
							forceFitColumns="true">
							<ta:datagridItem field="aaz095" key="待遇调整方案ID" width="200" align="center" ></ta:datagridItem>
							<ta:datagridItem id="aae212" key="调整年月" width="140" align="center" ></ta:datagridItem>
							<ta:datagridItem id="yic008" key="供养关系" width="200" collection="AAE144" align="center" ></ta:datagridItem>
							<ta:datagridItem id="aaa036" key="调整待遇类别" width="140" align="center" collection="AAA036"></ta:datagridItem>
							<ta:datagridItem id="yie009" key="增资标准额" width="140" dataAlign="right" align="center" ></ta:datagridItem>
							<ta:datagridItem id="yie010" key="最低保障额" width="140" dataAlign="right" align="center" ></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout(); 
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
	});	
	
	//查询信息
    function query(){
	    Base.submit("form1","stTreLstImpGYAction!queryInfo.do");
	    Base._setEnable("saveBtn", true);
    }
	
	function fn_aaa134(){
		Base.clearGridData("tzxxGrid1");
	    Base.getValue("aaa134");
	    Base.submit("form1","stTreLstImpGYAction!queryaaa134.do");
	}
	//保存信息
function submitData(){
	var modifiedData = Base.getGridData("tzxxGrid1");
    var prm ={};
    prm.tzxxList= Ta.util.obj2string(modifiedData);
	Base.submit("from1,tzxxGrid1","stTreLstImpGYAction!toSave.do",prm,null,null,function(data){
		Base.setDisabled("btnSave");
		Base.setDisabled("btnReset");
		});
}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>