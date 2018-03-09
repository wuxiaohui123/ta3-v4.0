<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人员特殊工种申报</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:box id="procInc">
			<%@include file="/yhsi3/comm/veritySuggestView1.jsp"%> 
		</ta:box>
    
		<ta:tabs id="tbs_1" fit="true">
			<ta:tab id="tab_sg" key="手工申报方式">
				<ta:toolbar id="tlb">
					<ta:button id="queryBtn" key="查询[Q]"  icon="xui-icon-query" hotKey="Q" onClick="toQuery();" asToolBarItem="true" />
					<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave();" asToolBarItem="true" />
					<ta:button id="delBtn" key="删除[D]" icon="xui-icon-spotDelete" hotKey="D" onClick="toDel();" asToolBarItem="true" />
					<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true" />
				</ta:toolbar>
				<ta:form id="form_1" fit="true">
				<ta:panel id="fld_cxtj" key="查询条件" cols="3" expanded="false" scalable="false">
					<ta:text id="aab001" key="单位编号" maxLength="20" onChange="sfwQueryUtil(2,'getAab001',Base.getValue('aab001'));" bpopTipMsg="可输入单位管理码、公司名称、单位ID" />
					<ta:text id="aac001" key="个人编号" maxLength="20" onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac001'))" bpopTipMsg="可输入公民身份证号码、姓名、个人ID" />
				</ta:panel>
				<ta:panel key="申报起止时间" cols="3" id="fltdate" expanded="false" scalable="false">
				    <ta:date id="aae041" key="开始年月" showSelectPanel="true" issue="true" onChange="checkDate()"/>
				    <ta:date id="aae042" key="结束年月" showSelectPanel="true" issue="true" onChange="checkDate()"/>
			        <ta:button id="setBtn" key="批量设置" onClick="setAae042();" />
			    </ta:panel>
				<ta:tabs id="tbs_2" fit="true" onSelect="fnSetBtn" >
					<ta:tab id="tab_bc" key="本次申报信息" >
						<ta:datagrid id="dg_bc" selectType="checkbox" fit="true" >
							<ta:datagridItem id="aac001" key="个人ID" width="140" align="center"></ta:datagridItem>
							<ta:datagridItem id="aac003" key="姓名" width="100" align="center"></ta:datagridItem>
							<ta:datagridItem id="aac002" key="证件号码" width="160" align="center"></ta:datagridItem>
							<ta:datagridItem id="aab001" key="单位ID" width="120" align="center"></ta:datagridItem>
							<ta:datagridItem id="aae044" key="单位名称" width="160" align="center"></ta:datagridItem>
							<ta:datagridItem id="aae041" key="开始年月" width="100" dataAlign="center" align="center" >
								<ta:datagridEditor type="issue" onChange="fnChange"/>
							</ta:datagridItem>
							<ta:datagridItem id="aae042" key="结束年月" width="100" dataAlign="center" align="center" >
								<ta:datagridEditor type="issue" onChange="fnChange"/>
							</ta:datagridItem>
							<ta:datagridItem id="aac019" key="特殊工种代码" width="120" align="center" >
								<ta:datagridEditor type="selectInput" collection="AAC019"/>
							</ta:datagridItem>
							<ta:datagridItem id="aae013" key="备注" align="center" width="90" showDetailed="true" >
								<ta:datagridEditor type="text" />
							</ta:datagridItem>
							<ta:dataGridToolPaging url="" showButton="false" showCount="false" showDetails="false" resultType="java.util.HashMap" 
							submitIds="form_1" sqlStatementName="specialExperience.selectPersonInfo"></ta:dataGridToolPaging>
						</ta:datagrid>
					</ta:tab>	
					<ta:tab id="tb_ls" key="历史申报信息" >
						<ta:datagrid id="dg_ls" selectType="checkbox" fit="true"  >
						    <ta:datagridItem id="aac001" key="个人ID" width="130" align="center"></ta:datagridItem>
							<ta:datagridItem id="aac003" key="姓名" width="100" align="center"></ta:datagridItem>
							<ta:datagridItem id="aac002" key="证件号码" width="160" align="center"></ta:datagridItem>
							<ta:datagridItem id="aab001" key="单位ID" width="120" align="center"></ta:datagridItem>
							<ta:datagridItem id="aae044" key="单位名称" width="160" align="center"></ta:datagridItem>
							<ta:datagridItem id="aae041" key="开始年月" width="100" dataAlign="center" align="center"></ta:datagridItem>
							<ta:datagridItem id="aae042" key="结束年月" width="100" dataAlign="center" align="center"></ta:datagridItem>
							<ta:datagridItem id="aac019" key="特殊工种代码" width="140" align="center" collection="AAC019" ></ta:datagridItem>
							<ta:datagridItem id="aae013" key="备注" align="center" showDetailed="true"></ta:datagridItem>
							<ta:datagridItem id="aaz185" key="人员工作经历ID" align="center" hiddenColumn="true" ></ta:datagridItem>
							<ta:datagridItem id="yaz075" key="工作经历事件ID" align="center" hiddenColumn="true" ></ta:datagridItem>
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>	
				</ta:form>
			</ta:tab>
	
			<ta:tab id="tab_wj" key="文件申报方式">
				<ta:toolbar id="tlb1">
					<ta:submit id="inputBtn" key="导入[I]" submitIds="form2" url="specialExperienceDeclareAction!check.do" icon="icon-input" isSyncSubmit="true"  asToolBarItem="true"/>	
					<ta:button id="saveBtn_sg" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave_sg();" asToolBarItem="true" />
					<ta:button id="resetBtn_sg" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" onClick="fnReset();" asToolBarItem="true" />
				</ta:toolbar>
				<ta:form id="form2"  methord="post"  fit="true" enctype="multipart/form-data">
				
				<ta:panel id="fltname" key="数据文件" cols="3" expanded="false" scalable="false">
			     <input id="theFile" type="file" name="theFile" size="60" ></input>
			     <div style="width:15%;padding-left:150px">
					            <a   onmouseover="this.style.color = 'RED';"  
						             onmouseout="this.style.color = 'rgb(161,161,161)';"  
						             id="dto(xzmb)_label" 
					                 href="specialExperienceDeclareAction!download.do" 
						             style="color:rgb(161,161,161);width:200px;" >
						        <strong>
						            <pre> >>下载模板<< </pre>
						        </strong>
					            </a>
					        </div>
           		</ta:panel>
					<ta:tabs id="tbs_3" fit="true">
						<ta:tab id="tab_success" key="数据成功信息" selected="true">
							<ta:datagrid id="dg_success" fit="true" forceFitColumns="true"  selectType="checkbox" haveSn="true" >
								<ta:datagridItem id="aac001" key="个人编号" width="100" align="center"></ta:datagridItem>
								<ta:datagridItem id="aac003" key="姓名" width="100" align="center"></ta:datagridItem>
								<ta:datagridItem id="aac002" key="证件号码" width="150" align="center"></ta:datagridItem>
								<ta:datagridItem id="aab001" key="单位ID" width="120" align="center"></ta:datagridItem>
								<ta:datagridItem id="aae044" key="单位名称" width="150" align="center"></ta:datagridItem>
								<ta:datagridItem id="aae041" key="开始年月" width="100" dataAlign="center" align="center"></ta:datagridItem>
								<ta:datagridItem id="aae042" key="结束年月" width="100" dataAlign="center" align="center"></ta:datagridItem>
								<ta:datagridItem id="aac019" key="特殊工种代码" width="140" align="center" collection="AAC019"></ta:datagridItem>
								<ta:datagridItem id="aae013" key="备注" align="center" width="100" showDetailed="true" ></ta:datagridItem>
							</ta:datagrid>
						</ta:tab>
						<ta:tab id="tb_fail" key="数据失败信息" >
						<ta:datagrid id="dg_fail" fit="true" forceFitColumns="true"  haveSn="true" >
						        <ta:datagridItem id="aac001" key="个人编号" width="100" dataAlign="left" align="center"></ta:datagridItem>
								<ta:datagridItem id="aac003" key="姓名" width="100" dataAlign="left" align="center"></ta:datagridItem>
								<ta:datagridItem id="aac002" key="证件号码" width="150" dataAlign="left" align="center"></ta:datagridItem>
								<ta:datagridItem id="aab001" key="单位ID" width="120" dataAlign="left" align="center"></ta:datagridItem>
								<ta:datagridItem id="aae044" key="单位名称" width="150" dataAlign="left" align="center"></ta:datagridItem>
								<ta:datagridItem id="aae041" key="开始年月" width="100" dataAlign="center" align="center"></ta:datagridItem>
								<ta:datagridItem id="aae042" key="结束年月" width="100" dataAlign="center" align="center"></ta:datagridItem>
								<ta:datagridItem id="aac019" key="特殊工种代码" width="140" dataAlign="left" align="center"></ta:datagridItem>
								<ta:datagridItem id="aae013" key="备注" dataAlign="center" align="left" showDetailed="true" ></ta:datagridItem>
								<ta:datagridItem id="error" key="错误原因" width="200" dataAlign="left" align="center" showDetailed="true" collection="yae238" ></ta:datagridItem>
						   </ta:datagrid>
						</ta:tab>
					</ta:tabs>	
					</ta:form>
			</ta:tab>
		</ta:tabs>

</body>
</html>
<script type="text/javascript">
	var tab2_id = null;
	$(document).ready(function() {
		$("body").taLayout();
		
		Base.setDisabled("saveBtn");
		Base.setDisabled("delBtn");
		Base.setDisabled("saveBtn_sg");
		initializeSuggestFramework(1, 'ac01', 'aac001', 500, 200, 4, fnGetAac001, 0, false);
		initializeSuggestFramework(2, 'ab01', 'aab001', 900, 200, 7, fnGetAab999, 0, false);
		Base.focus("aab001");
	});
	
	
	function fnSetBtn(id){
	    if(id != null&& id.length > 0){
		  tab2_id = id;
	    }
		if(tab2_id == 'tab_bc'){
			Base.setDisabled("delBtn");
			Base.setEnable("saveBtn");
		}else if(tab2_id == 'tb_ls'){
			Base.setDisabled("saveBtn");
			Base.setEnable("delBtn");
		}
	}

	//单位管理码回调函数
	function fnGetAab999(){
		if (g_Suggest!=""){ 
			Base.setValue('aab001',g_Suggest[1]);
		}
	}
	//个人编号回调函数
	function fnGetAac001(){
		if (g_Suggest!=""){ 
			Base.setValue('aac001',g_Suggest[2]);
		}
	}
	//查询
	function toQuery(){
		fnSetBtn();
		var aab001 =Base.getValue("aab001");
		var aac001 =Base.getValue("aac001");
		if((aab001==''||aab001==null)&&(aac001==''||aac001==null)){
			Base.alert("单位编号和人员编号不能同时为空！");
			return;
		}
		Base.clearGridData('dg_bc','dg_ls');
		Base.submit("fld_cxtj","specialExperienceDeclareAction!query.do");
	}
	
	//手工申报方式设置结束期号
	function setAae042(){
	   var aae041=Base.getValue('aae041');
	   var aae042=Base.getValue('aae042');
	   if(aae041==''){
	     alert('开始期号不能为空！');
	     return;
	   }
	   if(aae041==''){
	     alert('结束期号不能为空！');
	     return;
	   }
	   var selectData=Base.getGridSelectedRows("dg_bc");
	   if(selectData==""){
	       Base.alert('请勾选数据!!');
	       return;
	   }
	   var j = selectData.length;
	   for (var i = 1; i <= j; i++) {
	       Base.setGridRowData("dg_bc", selectData[i-1]._row_+1, {"aae041":aae041,"aae042":aae042});
	   }
	   Base.setEnable("saveBtn");
	 }
		
	
	//日期校验
	function checkDate(){
	   var aae041 = Base.getValue("aae041");
	   var aae042 = Base.getValue("aae042");
	   if(aae041 == '' && aae042 == ''){
	     Base.alert('开始结束期号不能为空！');
	     return;
	   }
	   if(aae041 != '' && aae042 != ''){
	      if(aae041 > aae042){//判断开始时间和结束时间
	          alert('开始年月不能大于结束年月！');
	          Base.setValue('aae042','');
	       return;
	      } 
	   }
	}
	
	//保存
	function toSave(){
		var row_bc =Base.getGridSelectedRows("dg_bc");//获取列表数据
		var length =row_bc.length;//选中的条数
		var param={};
		/*至少选择一条数据*/
		if(length==0){
			alert("请至少勾选一条数据");
			return;
		}
		param.d2List = Ta.util.obj2string(row_bc);
	    Base.submit("form_1","specialExperienceDeclareAction!save.do",param);
	}
	//日期校验
	function fnChange(data,value){
	  var aae041 = data.item.aae041;
	  var aae042 = data.item.aae042;
	  if(aae041 == '' || aae042 == ''){
	     return;
	   }else if(aae041 > aae042){//判断开始时间和结束时间
	     alert('开始年月不能大于结束年月！');
	     Base.setDisabled('saveBtn');
	     return;
	   }
    }
	//删除
	function toDel(){
		var row_ls =Base.getGridSelectedRows("dg_ls");
		var length =row_ls.length;
		var param={};
		/*至少选择一条数据*/
		if(length==0){
			alert("请至少勾选一条数据");
			return;
		}
		param.d4List = Ta.util.obj2string(row_ls);
	    Base.submit("form_1","specialExperienceDeclareAction!delete.do",param);
	}
	//************************************************************************//
	//文件申报方式导入
	function Input(){
		Base.submit("form2","specialExperienceDeclareAction!check.do");
	}
	//手工申报方式模板下载
	function fnMoban(){
	   Base.submit("form2","specialExperienceDeclareAction!download.do"); 
	}
	//批量保存
	function toSave_sg(){
		var rows = Base.getGridSelectedRows("dg_success");
		var param={};
		if(""==rows){
			Base.alert("请勾选数据！");
			return ;
		}
		param.d3List = Ta.util.obj2string(rows);
		Base.submit("form2","specialExperienceDeclareAction!save_sg.do",param,false,false,null);
	}
	
	//重置
	function fnReset(){
		Base.clearGridData("dg_success");
		Base.clearGridData("dg_fail");
		Base.activeTab("tab_success");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>