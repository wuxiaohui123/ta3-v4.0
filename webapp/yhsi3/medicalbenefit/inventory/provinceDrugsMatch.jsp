<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>省平台目录对码</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
	    <ta:toolbarItem id="btnQuery"  key="查询[Q]" icon="xui-icon-query"  hotKey="Q" onClick="toQuery()" />
	    <ta:toolbarItem id="btnSave"  key="保存[S]" icon="xui-icon-spotSave"  hotKey="S" onClick="toSave()" />
	    <ta:toolbarItem id="btnRemove"  key="屏蔽[M]" icon="xui-icon-delete"  hotKey="M" onClick="toRemove()" />
	    <ta:toolbarItem id="btnReplay"  key="显示[P]" icon="icon-input"  hotKey="P" onClick="toReplay()" />
	    <ta:toolbarItem id="btnDelete"  key="撤销[D]" icon="xui-icon-spotDelete"  hotKey="S" onClick="toDelete()" />
		<ta:button  id="btnReset"  key="重置[R]" icon="xui-icon-spotReset"   hotKey="R"  asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:fieldset id="flds" key="省平台目录对码信息" cols="6">
			<ta:text id="yka004" key="省平台三目编码" labelWidth="120" span="2"  bpopTipMsg="输入省三目编号、省三目名称可自动查询"/>
			<ta:text id="yka005" key="省平台三目名称" labelWidth="120" span="2" readOnly="true"/>
			
			<ta:text id="aka057" key="先自付比例" display="false" labelWidth="120" readOnly="true" />
			<ta:selectInput id="ake004" key="进口标志" display="false" labelWidth="120" collection="AKE004"  readOnly="true" />
			
			<ta:text id="ake001" key="社保三目编码" labelWidth="120" span="2" readOnly="true"/>
			<ta:text id="ake002" key="社保三目名称" labelWidth="120" span="2" readOnly="true"/>
			<ta:text id="yjxj1" key="一级以下限价" display="false" labelWidth="120" span="2" readOnly="true" />
			<ta:text id="yjxj" key="一级限价" display="false" labelWidth="120" span="2" readOnly="true" />
			<ta:text id="ejxj" key="二级限价" display="false" labelWidth="120" span="2" readOnly="true" />
			<ta:text id="sjxj" key="三级限价" display="false" labelWidth="120" span="2" readOnly="true" />
			
			<ta:selectInput id="ake003" key="社保三目类别" span="2" labelWidth="120" collection="AKE003" />
			<ta:selectInput id="aka063" key="社保医疗发票类别" span="2" labelWidth="120" collection="AKA063" />
			<ta:selectInput id="aka031" key="社保三目等级" span="2" labelWidth="120" collection="AKA031" />
			
			<ta:text id="ake002Cx" key="社保三目名称" labelWidth="120" span="2" bpopTipMsg="输入梧州三目编号、梧州三目名称可模糊查询"/>
			
		    <ta:text id="flg" key="标志" display="false"  value="tab1" />
			<ta:text id="row" key="行号" labelWidth="120" readOnly="true" display="false"/>
		</ta:fieldset>
		<ta:tabs id="tbs" fit="true" onSelect="fnSelect">
			<ta:tab id="tb1" key="未对码中心目录">
				<ta:datagrid id="dgKa20QPT" forceFitColumns="true" haveSn="true" snWidth="50" fit="true" selectType="checkbox" onRowClick="fnrowClick" headerColumnsRows="1"  >
					<ta:datagridItem id="aaz231" key="社保三目ID"  align="center" hiddenColumn="true"/>
					<ta:datagridItem id="ake001" key="社保三目编号"  align="center" width="90"/>
					<ta:datagridItem id="ake002" key="社保三目名称"  align="center" width="150" showDetailed="true"/>
					<ta:datagridItem id="ake003" key="社保三目类别"  align="center" collection="AKE003" width="80"/>
					<ta:datagridItem id="aka063" key="医疗发票类别"  align="center" collection="AKA063" width="90"/>
					<ta:datagridItem id="aka031" key="社保三目等级"  align="center" collection="AKA031" width="80"/>
					<ta:datagridItem id="aka070a" key="剂型"  align="center" collection="AKA070" width="50"/>
					
					<ta:datagridItem id="yka004" key="省平台三目编码"  align="center" width="100"/>
					<ta:datagridItem id="yka005" key="省平台三目名称" align="center" width="150" showDetailed="true"/>
					<ta:datagridItem id="ake003_q" key="三目类别" align="center" collection="AKE003" width="50"/>
					<ta:datagridItem id="aka065" key="收费等级"  align="center" width="50"/>
					<ta:datagridItem id="aka063_q" key="收费类别"  align="center" width="90"/>
					<ta:datagridItem id="aka070" key="剂型"  align="center" width="50"  />
					<ta:datagridItem id="aae030" key="开始日期"  align="center" hiddenColumn="false"  dataType="date"/>
					<ta:datagridItem id="sjxj" key="三级限价"  align="center" hiddenColumn="false"  width="90"/>
					<ta:datagridItem id="ejxj" key="二级限价"  align="center" hiddenColumn="false"  width="90"/>
					<ta:datagridItem id="yjxj" key="一级限价"  align="center"  hiddenColumn="false" width="90"/>
					<ta:datagridItem id="yjxj1" key="一级以下限价"  align="center" hiddenColumn="false"  width="90"/>
					<ta:datagridItem id="aka032" key="价格定比例"  align="center" hiddenColumn="false"  width="90"/>
					<ta:datagridItem id="ake004" key="进口标志"  align="center"  hiddenColumn="false"  width="90"/>
					<ta:dataGridToolPaging url="provinceDrugsMatchAction!toQuery.do" selectExpButtons="1,2,3" submitIds="flds" pageSize="100" ></ta:dataGridToolPaging>
						
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tb2" key="已对码中心目录">
				<ta:datagrid id="dgKa20QPT_2" forceFitColumns="true" haveSn="true" snWidth="50" fit="true" 
				columnFilter="true" selectType="checkbox">
					<ta:datagridItem id="aaz231" key="社保三目ID"  align="center" width="100"/>
					<ta:datagridItem id="ake001" key="社保三目编号"  align="center" width="100"/>
					<ta:datagridItem id="ake002" key="社保三目名称"  align="center" width="130"/>
					<ta:datagridItem id="ake003" key="社保三目类别"  align="center" collection="AKE003" width="100"/>
					<ta:datagridItem id="aka063" key="医疗发票类别"  align="center" collection="AKA063" width="100"/>
					<ta:datagridItem id="aka031" key="社保三目等级"  align="center" collection="AKA031" width="100"/>
					<ta:datagridItem id="yka004" key="省平台三目编码"  align="center" width="100"/>
					<ta:datagridItem id="yka005" key="省平台三目名称"  align="center" width="130"/>
					<ta:dataGridToolPaging url="provinceDrugsMatchAction!toQuery.do" selectExpButtons="1,2,3" submitIds="flds" pageSize="100" ></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			
			<!-- 未对码省三目信息  -->
			<ta:tab id="tb3" key="未对码省三目信息" >
				<ta:datagrid id="dgKa20QPT_un" forceFitColumns="true" haveSn="true" snWidth="50" fit="true" selectType="checkbox"  headerColumnsRows="1" columnFilter="true">
					<ta:datagridItem id="yka004" key="省平台三目编码"  align="center" width="80"/>
					<ta:datagridItem id="yka005" key="省平台三目名称" align="center" width="150" showDetailed="true"/>
					<ta:datagridItem id="ake003_q" key="三目类别" align="center" collection="AKE003" width="60"/>
					<ta:datagridItem id="aka065" key="收费等级"  align="center" width="50"/>
					<ta:datagridItem id="aka063_q" key="收费类别"  align="center"  collection="AKA063"  width="90"/>
					<ta:datagridItem id="aka070" key="剂型"  align="center" />				
					<ta:dataGridToolPaging url="provinceDrugsMatchAction!toQuery.do" selectExpButtons="1,2,3" submitIds="flds" pageSize="100" ></ta:dataGridToolPaging>					
				</ta:datagrid>
			</ta:tab>
			
			<!-- 完整省三目信息 -->
			<ta:tab id="tb4" key="省三目信息" >
				<ta:datagrid id="dgKa20QPT_w" forceFitColumns="true" haveSn="true" snWidth="50" fit="true" selectType="checkbox"  headerColumnsRows="1" columnFilter="true">
					<ta:datagridItem id="yka004" key="省平台三目编码"  align="center" width="90"/>
					<ta:datagridItem id="yka005" key="省平台三目名称" align="center" width="150" showDetailed="true"/>
					<ta:datagridItem id="ake003_q" key="三目类别" align="center" collection="AKE003" width="60"/>
					<ta:datagridItem id="aka065" key="收费等级"  align="center" width="50"/>
					<ta:datagridItem id="aka063_q" key="收费类别"  align="center"  collection="AKA063"  width="90"/>
					<ta:datagridItem id="aka070" key="剂型"  align="center" />
					<ta:dataGridToolPaging url="provinceDrugsMatchAction!toQuery.do" selectExpButtons="1,2,3" submitIds="flds" pageSize="100" ></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tb5" key="屏蔽的中心目录">
				<ta:datagrid id="dgKa20_ydyl_k1" forceFitColumns="true" haveSn="true" snWidth="50" fit="true" selectType="checkbox" onRowClick="fnrowClick" headerColumnsRows="1" columnFilter="true" >
					<ta:datagridItem id="aaz231" key="社保三目ID"  align="center" hiddenColumn="true"/>
					<ta:datagridItem id="ake001" key="社保三目编号"  align="center" width="90"/>
					<ta:datagridItem id="ake002" key="社保三目名称"  align="center" width="150" showDetailed="true"/>
					<ta:datagridItem id="ake003" key="社保三目类别"  align="center" collection="AKE003" width="80"/>
					<ta:datagridItem id="aka063" key="医疗发票类别"  align="center" collection="AKA063" width="90"/>
					<ta:datagridItem id="aka031" key="社保三目等级"  align="center" collection="AKA031" width="80"/>
					<ta:datagridItem id="aka070a" key="剂型"  align="center" collection="AKA070" width="50"/>
					
					<ta:datagridItem id="yka004" key="省平台三目编码"  align="center" width="100"/>
					<ta:datagridItem id="yka005" key="省平台三目名称" align="center" width="150" showDetailed="true"/>
					<ta:datagridItem id="ake003_q" key="三目类别" align="center" collection="AKE003" width="60"/>
					<ta:datagridItem id="aka065" key="收费等级"  align="center" width="60"/>
					<ta:datagridItem id="aka063_q" key="收费类别"  align="center" width="90"/>
					<ta:datagridItem id="aka070" key="剂型"  align="center"  width="50" />
					<ta:datagridItem id="aae030" key="开始日期"  align="center" hiddenColumn="false"  dataType="date"/>
					<ta:dataGridToolPaging url="provinceDrugsMatchAction!toQuery.do" selectExpButtons="1,2,3" submitIds="flds" pageSize="100" ></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2, null, "yka004", 700, 250, 6, ake001_callback, 0, false);
	});
	
	function fnChangeYka004(){
		suggestQuery(2,"provinceDrugsMatchAction!getKa20_qpt.do",{"dto['jstj']":Base.getValue('yka004')});
	}
	
	function ake001_callback() {
		var row = Base.getValue('row');
		
		var rownum = Base.getValue('row')-1;
		if (g_Suggest[0] == null) {
			return false;
		} else {
		
			Base.setValue("yka004",g_Suggest[0]);
			Base.setValue("yka005",g_Suggest[1]);
			
			//给对应的行赋值
			if(row == '' || row == null){
				return;
			}
			if(Base.getValue("flg") == "tab1"){
				Base.setGridCellData('dgKa20QPT',row,8,g_Suggest[0]);//省社保编码
				Base.setGridCellData('dgKa20QPT',row,9,g_Suggest[1]);//
				Base.setGridCellData('dgKa20QPT',row,10,g_Suggest[2]);//
				Base.setGridCellData('dgKa20QPT',row,11,g_Suggest[3]);//
				Base.setGridCellData('dgKa20QPT',row,12,g_Suggest[4]);//
				Base.setGridCellData('dgKa20QPT',row,13,g_Suggest[5]);//
				
				Base.gotoGridRow('dgKa20QPT', rownum-1, function(){});//跳转到修改行的下一行 
				
			}else if(Base.getValue("flg") == "tab5"){
				Base.setGridCellData('dgKa20_ydyl_k1',row,8,g_Suggest[0]);//省社保编码
				Base.setGridCellData('dgKa20_ydyl_k1',row,9,g_Suggest[1]);//
				Base.setGridCellData('dgKa20_ydyl_k1',row,10,g_Suggest[2]);//
				Base.setGridCellData('dgKa20_ydyl_k1',row,11,g_Suggest[3]);//
				Base.setGridCellData('dgKa20_ydyl_k1',row,12,g_Suggest[4]);//
				Base.setGridCellData('dgKa20_ydyl_k1',row,13,g_Suggest[5]);//
				
				//Base.gotoGridRow('dgKa20_ydyl_k1', rownum, function(){});//跳转到修改行的下一行 
			}
		}
	}

	//查询
	function toQuery(){
		Base.submit('form1', 'provinceDrugsMatchAction!toQuery.do');
	}
	
	//单击列表数据
	function fnrowClick(e,rowdata){
		var row = rowdata.row + 1;
		Base.setValue('row',row);//行号
		
		Base.setValue('yka004',rowdata.ake002);
		Base.setValue('aaz231',rowdata.aaz231);
		Base.setValue('ake001',rowdata.ake001);
		Base.setValue('ake002',rowdata.ake002);
		//Base.setValue('ake003',rowdata.ake003);
		//Base.setValue('aka063',rowdata.aka063);
		//Base.setValue('aka031',rowdata.aka031);
		//Base.setValue('aae013',rowdata.aae013);
		
		//Base.setValue('yka004',rowdata.yka004);
		Base.setValue('yka005',rowdata.yka005);
		
		Base.setValue('sjxj',rowdata.sjxj);
		Base.setValue('ejxj',rowdata.ejxj);
		Base.setValue('yjxj',rowdata.yjxj);
		Base.setValue('yjxj1',rowdata.yjxj1);
		Base.setValue('ake004',rowdata.ake004);
		Base.setValue('aka032',rowdata.aka032);
		
	}

	function toSave(){
		var ka20QptList = Base.getGridSelectedRows("dgKa20QPT");
		if(ka20QptList.length == 0 || ka20QptList.length == null){
		    Base.alert('请选择需要对码的数据','warn');
			return;
		}
		var param = {};
		param.ka20QptList = Ta.util.obj2string(ka20QptList);
		Base.setDisabled('btnSave');
		Base.confirm("确定要提交吗?", function(btn, callback) {
			Base.setEnable('btnSave');
			if (btn) {
				Base.submit('',
				 			'provinceDrugsMatchAction!toSave.do',
							param,
							'',
							'',
							function(){
								
							toQuery();
							});
			}
		});
		
	}
	// 屏蔽
	function toRemove(){
		var ka20QptList = Base.getGridSelectedRows("dgKa20QPT");
		if(ka20QptList.length == 0 || ka20QptList.length == null){
		    Base.alert('请选择需要屏蔽的数据','warn');
			return;
		}
		var param = {};
		param.flg = Base.getValue("flg");
		param.ka20QptList = Ta.util.obj2string(ka20QptList);
		Base.setDisabled('btnRemove');
		Base.confirm("确定要屏蔽吗?", function(btn, callback) {
			Base.setEnable('btnRemove');
			if (btn) {
				Base.submit('',
				 			'provinceDrugsMatchAction!toRemove.do',
							param,
							'',
							'',
							function(){
								//Base.resetForm('form1');
								toQuery();
							});
			}
		});
	}
	// 恢复显示
	function toReplay(){
		var Ka20_ydyl_k1 = Base.getGridSelectedRows("dgKa20_ydyl_k1");
		if(Ka20_ydyl_k1.length == 0 || Ka20_ydyl_k1.length == null){
		    Base.alert('请选择需要屏蔽的数据','warn');
			return;
		}
		var param = {};
		param.Ka20_ydyl_k1 = Ta.util.obj2string(Ka20_ydyl_k1);
		Base.setDisabled('btnReplay');
		Base.confirm("确定要恢复吗?", function(btn, callback) {
			Base.setEnable('btnReplay');
			if (btn) {
				Base.submit('flg',
				 			'provinceDrugsMatchAction!toReplay.do',
							param,
							'',
							'',
							function(){
								//Base.resetForm('form1');
								toQuery();
							});
			}
		});
	}
	//撤销
	function toDelete(){
		var ka20QptList = Base.getGridSelectedRows("dgKa20QPT_2");
		if(ka20QptList.length == 0 || ka20QptList.length == null){
		    Base.alert('请选择已对码的数据','warn');
			return;
		}
		var param = {};
		param.ka20QptList = Ta.util.obj2string(ka20QptList);
		Base.setDisabled('btnDelete');
		Base.confirm("确定要提交吗?", function(btn, callback) {
			Base.setEnable('btnDelete');
			if (btn) {
				Base.submit('',
				 			'provinceDrugsMatchAction!toDelete.do',
							param,
							'',
							'',
							function(){
								//Base.resetForm('form1');
								toQuery();
							});
			}
		});
	}
	function fnSelect(id){
	   if(id=="tb1"){ Base.setValue("flg","tab1");Base.setEnable("ake003,aka063,aka031");}
	   if(id=="tb2"){ Base.setValue("flg","tab2");Base.setReadOnly("ake003,aka063,aka031");}
	   if(id=="tb3"){ Base.setValue("flg","tab3");Base.setReadOnly("ake003,aka063,aka031");}
	   if(id=="tb4"){ Base.setValue("flg","tab4");Base.setReadOnly("ake003,aka063,aka031");}
	   if(id=="tb5"){ Base.setValue("flg","tab5");Base.setReadOnly("ake003,aka063,aka031");}
	   
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>