<%@ page language="java" pageEncoding="UTF-8"%>
<ta:box id="verityHistorySuggestView" cssStyle="display:none;height:220px;width:80%;">
	<ta:datagrid id="verityHistorySuggestGrid" haveSn="true" forceFitColumns="true">
		<ta:datagridItem id="yaa017" key="业务办理状态" width="90px" collection="YAA017" align="center" />
		<ta:datagridItem id="aae013" key="审核意见" width="280px" align="center" showDetailed="true" />
		<ta:datagridItem id="aae011" key="经办人" collection="YAE092" align="center" />
		<ta:datagridItem id="aae036" key="经办时间" align="center" width="180px" />
	</ta:datagrid>
</ta:box>
<ta:box id="veritySuggestChoose" cssStyle="display:none;height:220px;width:80%;">
	<ta:datagrid id="veritySuggestChooseGrid" haveSn="true" selectType="checkbox"  forceFitColumns="true">
		<ta:datagridItem id="yzz004" key="ID" width="1" align="center" />
		<ta:datagridItem id="yzz005" key="审核意见" width="10" align="center" showDetailed="true"/>
	</ta:datagrid>
	<ta:buttonLayout align="center">
		<ta:button id="doOk" key="确定" onClick="fnVerity(1)" />
		<ta:button id="doCance" key="重置" onClick="fnVerity(2)" />
	</ta:buttonLayout>
</ta:box>
<script type="text/javascript">
function fnVerity(type){
	if(type == "1"){
		var rowData = Base.getGridSelectedRows("veritySuggestChooseGrid"); //获得表格选中行的JSON数组
		var suggest = "";
		for (var i = 0; i < rowData.length; i ++ ) {
			if(i == rowData.length-1){
				suggest = suggest + rowData[i].yzz005;
			}
			else{
				suggest = suggest + rowData[i].yzz005 + ",";
			}
		}
		if(suggest != ""){
			var aae013 = Base.getValue("aae013");
			var result = ""
			if(aae013 == ""){
				result = suggest;
			}
			else{
				result = aae013 + "," + suggest;
			}
			
			Base.setValue("aae013",result);
			Base.closeWindow("veritySuggestChoose");
		}
	}
	else{
		Base.clearGridDirty("veritySuggestChooseGrid");
	}
}

//公共审核方法,必须打开ShenHeView这个窗口
function veritySuggestChoose(){
	var aaz002 = Base.getValue("aaz002");
	var aaa121 = Base.getValue("aaa121");
	Base.submit("",myPath()+"/process/synthesis/veritySuggestViewAction!veritySuggestChoose.do", {
				"dto['aaz002']": aaz002,
				"dto['aaa121']": aaa121
			});
	$("#veritySuggestChoose").show().window({
		title : "审核意见",
		top: 100,
		modal : false,
		collapsible : true,//可折叠的
		minimizable : false,//可最小化
		maximizable : false,//可最大化
		resizable	: false,//尺寸可变的、可缩放
		draggable	: true //可拖动的
	});
}

function verityHistorySuggestView(){
	var aaz002 = Base.getValue("aaz002");
	var aaa121 = Base.getValue("aaa121");
	Base.submit("",myPath()+"/process/synthesis/veritySuggestViewAction!verityHistorySuggestView.do", {
				"dto['aaz002']": aaz002,
				"dto['aaa121']": aaa121
			});
	$("#verityHistorySuggestView").show().window({
		title : "审核历史",
		top: 100,
		modal : false,
		collapsible : true,
		minimizable : false,
		maximizable : false,
		resizable	: false,
		draggable	: true
	});
}
</script>