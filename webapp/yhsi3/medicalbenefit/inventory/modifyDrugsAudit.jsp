<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中心药品目录修改</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-add2"  hotKey="s" onClick="toSave()" />
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin()" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		 <ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:panel key="审核信息" cols="4" id="fltjb">
				<ta:selectInput id="action" key="审核标志" required="true" collection="ACTION" value="1" span="2" />
				<ta:selectInput id="action_last" key="上次办理结果" required="true" collection="ACTION" span="2" readOnly="true" />
				<ta:textarea id="aae013Audit" span="2" key="审核意见" height="70px" />
				<ta:textarea id="aae013_last" span="2" key="上次审核意见" height="70px" readOnly="true" />
				<ta:buttonLayout span="2">
					<ta:button id="suggestBtn" icon="icon-save" onClick="veritySuggestChoose();" key="意见选项" />
				</ta:buttonLayout>
				<ta:buttonLayout span="2">
					<ta:button id="hisSuggestBtn" icon="icon-save" onClick="verityHistorySuggestView();" key="历次审批信息" />
				</ta:buttonLayout>
			</ta:panel>
			<ta:text id="aaz267" key="待遇申请事件ID"  readOnly="true" display="false" labelWidth="150" />
			<ta:text id="aaz002" key="业务日志ID"  readOnly="true" display="false" labelWidth="150" />
	
		<ta:panel id="fltBase"  key="基本信息"  cols="3"  >
		        <ta:text id="aaz231" key="社保三大目录Id"  display="false" maxLength="20"  labelWidth="150"  readOnly="true"   />
		        <ta:text id="ake001" key="社保三大目录编码"   maxLength="20"  labelWidth="150"  readOnly="true"  onChange="checkAke001(this)" />
				 <ta:text id="ake002" key="社保三大目录名称" span="2"   maxLength="200"   labelWidth="150"  readOnly="true"  />
				 <ta:text id="aaz234" key="社保三大目录事件ID" span="2" display="false"  maxLength="200"   labelWidth="150"  readOnly="true"  />
				 <ta:selectInput id="ake003"  key="三大目录类别"  collection="AKE003"  value="1"  labelWidth="150"   readOnly="true" />
				 <ta:text id="aka020" key="拼音助记码" cssInput="color:red"   labelWidth="150"  readOnly="true" />
				 <ta:text id="aka021" key="五笔助记码" cssInput="color:red"   labelWidth="150"  readOnly="true"  />
				 <ta:text id="aka061"  key="通用中文名称"  maxLength="200"    labelWidth="150"  readOnly="true"  />
				 <ta:text id="aka062" key="英文化学名" maxLength="50" labelWidth="150"  />
				 
			<ta:selectInput id="aka022" key="医疗使用标志" collection="AKA022" labelWidth="150" required="true" display="false"/>
			<ta:selectInput id="ala011" key="工伤使用标志" collection="ALA011" labelWidth="150" required="true"  display="false"/>
			<ta:selectInput id="aja006" key="限门诊使用标志" collection="AJA006" labelWidth="150" required="true" display="false"/>
			<ta:selectInput id="ama011" key="生育使用标志" collection="AMA011" labelWidth="150" required="true" display="false"/>
			
			<ta:selectInput id="aka063" key="医疗发票项目类别" collection="AKA063" labelWidth="150"  reverseFilter="true" required="true"/>
			<ta:selectInput id="aka065" key="收费项目等级"  collection="AKA031"  labelWidth="150" required="true" />
			<ta:selectInput id="ake103" key="价格定比例" labelWidth="150" collection="AKA032"  required="true" />
			<ta:selectInput id="aka070" key="剂型" labelWidth="150" collection="AKA070"  required="true"/>
			
			<ta:text id="akb020" key="服务机构编号" labelWidth="150"  readOnly="true"/>
			<ta:text id="akb021" key="服务机构名称"  span="2"  labelWidth="150" readOnly="true"/>
			
			<ta:selectInput id="ake004" key="生产地类别" collection="AKE004" labelWidth="150" />
			<ta:selectInput id="aka064" key="处方药标志" collection="AKA064" labelWidth="150" />
			<ta:text id="ake101" key="省目录编码" maxLength="50" labelWidth="150"  />
			<ta:text id="ake102" key="自定义编码" maxLength="50" labelWidth="150" />
			<ta:date id="aae030" key="开始日期" labelWidth="150" required="true" showSelectPanel="true"/>
		   </ta:panel>
		   <ta:box  id="bxCSXX"  cols="2" >
		   	  <ta:panel id="pnlZfbl"  key="社保三大目录自付比例参数"  height="150"  scalable="false"  expanded="false" span="1"> 
					<ta:datagrid id="dgdZfbl" fit="true" forceFitColumns="true"  haveSn="true" >
							<ta:datagridItem id="aac066" key="参保身份" collection="AAC066"  showDetailed="true"   align="center"   hiddenColumn="true"/>
							<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" showDetailed="true"   align="center"    />
							<ta:datagridItem id="aka070" key="剂型" collection="AKA070" showDetailed="true"  align="center"    hiddenColumn="true"/>
							<ta:datagridItem id="aka057" key="先自付比例"   showDetailed="true"   align="center"  dataAlign="right" />
							<ta:datagridItem id="aae030" key="开始日期" dataType="date"  showDetailed="true"   align="center"   hiddenColumn="true"/>
						</ta:datagrid>
				</ta:panel>
				<ta:panel id="pnlXjdy" key="社保药品项目限价定义参数" height="150" scalable="false"  expanded="false" span="1">
					 <ta:datagrid id="dgdXjdy"  fit="true" forceFitColumns="true"  haveSn="true" >
							<ta:datagridItem id="akb095" key="明细限价医院等级" collection="AKB096"  showDetailed="true"  align="center"   /> 
							<ta:datagridItem id="aka070" key="剂型" collection="AKA070"   showDetailed="true"  align="center"   hiddenColumn="true"/>
							<ta:datagridItem id="aka068" key="定价上限金额"  dataType="number"  showDetailed="true"  align="center" dataAlign="right"  />
							<ta:datagridItem id="aae030" key="开始日期" dataType="date" showDetailed="true"   align="center"  hiddenColumn="true"/>
						</ta:datagrid>
				</ta:panel>
		    </ta:box>		
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.filterSelectInput("action", '1,2', true);
	});
	//保存
	function toSave() {
			Base.confirm("确定要提交吗?", function(btn, callback) {
				if (btn) {
					Base.submit('form1', 'modifyDrugsAuditAction!toSave.do');
				}
			});
	}
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>