<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>慢性病明细审核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" fit="true">
		<ta:box id="panel1" key="基本资料" cols="4"  >
		    <ta:text id="aaz217_new" key="医疗待遇结算事件ID" display="false"/>
		    <ta:text id="aaz217_old" key="医疗待遇结算事件ID" display="false"/>
			<ta:text id="aac001"  key="个人ID"   labelWidth="120" display="false"/>
		</ta:box>
		<ta:panel id="panel1" key="费用明细信息" fit="true"  heightDiff="150">
			<ta:datagrid id="kc22List" fit="true" haveSn="true" forceFitColumns="true" selectType="checkbox"  onRowClick="fnRowClick">
				<ta:datagridItem id="aaz217" key="人员医疗就诊事件ID"  hiddenColumn="true" />
				<ta:datagridItem id="aaz216" key="人员医疗就诊事件ID"  hiddenColumn="true" />
				<ta:datagridItem id="aaz231" key="社保三大目录ID"  hiddenColumn="true" />
				<ta:datagridItem id="aaz213" key="人员医疗费用明细ID"  hiddenColumn="true" />
				<ta:datagridItem id="yka538" key="审核类型" align="center" dataAlign="center"  showDetailed="true"  maxChart="7" formatter="fnFormatter"  collectionData="[{'id':'00','name':'拒付'},{'id':'01','name':'审核支付'},{'id':'02','name':'未审核'}]" sortable="true"/>
				<ta:datagridItem id="ake007" key="费用日期" align="center" dataAlign="center"  maxChart="9"  sortable="true"  formatter="fnFormatter" />
				<ta:datagridItem id="ake001" key="项目编码" align="center" showDetailed="true" dataAlign="left"  maxChart="5"  sortable="true" formatter="fnFormatter" />
			    <ta:datagridItem id="ake002" key="项目名称" align="center" showDetailed="true" dataAlign="left"  maxChart="10"  sortable="true" formatter="fnFormatter" />
				<ta:datagridItem id="ake006" key="医院项目名称" align="center" dataAlign="left"  showDetailed="true"  maxChart="9"  formatter="fnFormatter" />
				<ta:datagridItem id="aka031" key="医保大类" align="center" dataAlign="left" maxChart="4" collection="AKA031" sortable="true" formatter="fnFormatter" />
				<ta:datagridItem id="akc225" key="单价" align="center" dataAlign="right" maxChart="4"    />
				<ta:datagridItem id="akc226" key="数量" align="center" dataAlign="right"  maxChart="4"   />
				<ta:datagridItem id="aka069" key="自付比例" align="center" dataAlign="right"  maxChart="4"  >
				  <ta:datagridEditor type="selectInput" data="[{'id':'0','name':'0'},{'id':'0.05','name':'0.05'},{'id':'0.1','name':'0.1'},{'id':'0.15','name':'0.15'}
				  ,{'id':'0.2','name':'0.2'},{'id':'0.35','name':'0.35'},{'id':'1','name':'1'}]" editorData="[{'id':'0','name':'0'},{'id':'0.05','name':'0.05'},{'id':'0.1','name':'0.1'},{'id':'0.15','name':'0.15'}
				  ,{'id':'0.2','name':'0.2'},{'id':'0.35','name':'0.35'},{'id':'1','name':'1'}]" onChange="fngetzfje" />
				</ta:datagridItem>  
				<ta:datagridItem id="aae019" key="总费用" align="center" dataAlign="right" maxChart="6"  totals="sum" tatalsTextShow="false"  />
				<ta:datagridItem id="akc228" key="全自费" align="center" dataAlign="right" maxChart="6"   totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="akc268" key="超限价" align="center" dataAlign="right"  maxChart="6"  totals="sum" tatalsTextShow="false"  />
				<ta:datagridItem id="yka318" key="先行自付" align="center" dataAlign="right"  maxChart="6"   totals="sum" tatalsTextShow="false"  />
				<ta:datagridItem id="yka319" key="符合范围" align="center" dataAlign="right"  maxChart="6"   totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="aka070" key="剂型" align="center" dataAlign="left"  maxChart="4"   collection="AKA070" />
				<ta:datagridItem id="aka074" key="规格" align="center" dataAlign="left"  maxChart="4"    />
			</ta:datagrid>
		</ta:panel>
		<ta:buttonLayout id="btnLyt"  align="center"  >
			<ta:button id="saveJfBtn"   key="审核拒付"   icon="xui-icon-spotSave"    onClick="toSaveJf()" />
			<ta:button id="saveZfBtn"   key="审核支付"   icon="xui-icon-spotSave"    onClick="toSaveZf()" />
			<ta:button id="saveBtn"     key="提交数据"   icon="xui-icon-spotSave"    onClick="toSaveCommit()" />
			<ta:button id="closeBtn"    key="关闭"      icon="xui-icon-spotClose"  onClick="closeWin()" />
		</ta:buttonLayout>
	</ta:form> 
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	//修改自付比例
	function fngetzfje(data,value) {
	  var aae019 = parseFloat(data.item.aae019);
	  var akc268 = parseFloat(data.item.akc268);
	  var akc228 = parseFloat(data.item.akc228);
	  var aka069 = value;
	  //alert(Ta.util.obj2string(data));
	  var yka318 = ((aae019-akc268) * aka069).toFixed(2);
	  var yka319 =  (aae019 - akc268 - yka318).toFixed(2);
	  var akc228 = aae019 - yka318 - yka319-akc268;
	  data.item.yka318 = yka318;
	  data.item.yka319 = yka319;
	  data.item.akc228 = akc228;
	  Base.refreshGrid("kc22List");
	  //Base.getGridModifiedRows("kc22List");
	}
	
	// 列渲染方法
	function fnFormatter(row, cell, value, columnDef, dataContext){
		var yka538 = dataContext.yka538;
		if("02" != yka538){
			if("" == value || null == value)
				value = "";
			else
			   value = "<span style='color:blue;'>"+value+"</span>";
		}
		return value;
     }
	 
	//关闭窗口
	function closeWin(){
		parent.Base.closeWindow('win_mxsh');
	}
	
 	// 明细审核拒付
	function toSaveJf() 
 	{
		var kc22List = Base.getGridSelectedRows('kc22List');
		if(kc22List.length == 0){
			Base.alert('请选择数据', 'warn');
			return false;
		}	
		var param={};	
		param["gridList"] = Ta.util.obj2string(kc22List);
		param["gridList_modify"] = Ta.util.obj2string(Base.getGridModifiedRows("kc22List"));
		Base.submit('form1', 'calculationTSMZZXAction!toSaveMx.do', param, null,false,null,null);
	}
 	
	// 明细审核支付
	function toSaveZf() {
		var kc22List = Base.getGridSelectedRows('kc22List');
		if(kc22List.length == 0){
			Base.alert("请先选择数据!", "warn");
			return false;
		}	
		var kc22Aray = [];
	    var kc22Map = {};
	    $.each(kc22List,function(index,rowdata){
	    	kc22Map = {};
	   		kc22Map.aaz213 = rowdata.aaz213;
	   		kc22Map.aaz217 = rowdata.aaz217;
	   		kc22Map.aaz216 = rowdata.aaz216;
	   		kc22Aray.push(kc22Map);
	    });
		var param={};	
		param["gridList"] = Ta.util.obj2string(kc22Aray);
		param["gridList_modify"] = Ta.util.obj2string(Base.getGridModifiedRows("kc22List"));
		Base.submit('form1', 'calculationTSMZZXAction!toSave1Mx.do', param, null,false,null,null);
	}
	
	// 提交
	function toSaveCommit() {
		var kc22List = Base.getGridData('kc22List');
		if(kc22List.length == 0){
			Base.alert("没有数据!", "warn");
			return false;
		}	
		var kc22Aray = [];
	    var kc22Map = {};
	    $.each(kc22List,function(index,rowdata){
	    	kc22Map = {};
	    	if(rowdata.yka538 == "01" || rowdata.yka538 == "02")
	    	{
	    		kc22Map.aaz213 = rowdata.aaz213;
	    		kc22Map.aaz217 = rowdata.aaz217;
	    		kc22Map.aaz216 = rowdata.aaz216;
	    		kc22Aray.push(kc22Map);
	    	}
	    		
	    });
		var param={};	
		param["gridList"] = Ta.util.obj2string(kc22Aray);
		param["gridList_modify"] = Ta.util.obj2string(Base.getGridModifiedRows("kc22List"));
		Base.submit('form1', 'calculationTSMZZXAction!toSave1Mx.do', param, null,false,null,null);
	}
	
	// 单击选中行数据
	function fnRowClick(e,rowdata)
	{
		var aaz213 = rowdata.aaz213;// 当前选中的数据
		var aaz213Array = []; // 将要被将选中的数据
		var aaz213Map = {}; // 临时变量
		//Base.cancelCheckedRowsByArray("kc22List");
		var flg = true; // 表示当前所选中行,是否被选中.注:如果已经选中,则撤销;反之,则选中
		var gridData = Base.getGridSelectedRows("kc22List"); // 所有选中的数据
		$.each(gridData,function(indext,rowdata1){
			aaz213Map = {};
			if (aaz213 == rowdata1.aaz213){
				flg = false;
			}else{
				aaz213Map.aaz213 = rowdata1.aaz213;
				aaz213Array.push(aaz213Map);
			}
		});
		// 如果当前行,之前未被选中,则此次单击事件表示为选中
		if (flg){
			aaz213Map = {};
			aaz213Map.aaz213 = aaz213;
			aaz213Array.push(aaz213Map);
		}
		Base.setSelectRowsByData("kc22List", aaz213Array);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
