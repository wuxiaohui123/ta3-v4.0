<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>转院申请</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body  class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnQuery" key="查询[Q]" icon="xui-icon-query"  hotKey="q"   onClick="toQuery()" />
		<ta:toolbarItem id="btnDownload"  key="导出"     icon="xui-icon-spotEdit"    onClick="toDownload()" />
		<ta:button  id="btnReset"  key="重置[R]" icon="xui-icon-spotReset"   hotKey="r"  asToolBarItem="true"  type="resetPage" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="pnlCxtj"  key="查询条件" cols="3">
		     <ta:box cols="2">
			      <ta:text id="aac001"  key="个人ID"  labelWidth="120" onChange="getAc01Info()" columnWidth="0.9"/>
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				     <ta:button id="personSmallBtn" key="?" onClick="showPersonWindow()" />
				  </ta:buttonLayout>
			 </ta:box>
		     <ta:text id="aac003"  key="姓名" labelWidth="120" />
		     <ta:selectInput id="zylx"  key="转院类型" labelWidth="120"  collection="ZYLX" />
		     <ta:box cols="2">
		          <ta:text id="akb020" key="医疗机构编码" labelWidth="120" onChange="getKb01Info()" columnWidth="0.9" />
				  <ta:buttonLayout columnWidth="0.1" cssStyle="margin-left:-15px">
				    <ta:button id="hosSmallBtn" key="?" onClick="showHosWindow()" />
				  </ta:buttonLayout>
			 </ta:box>
			 <ta:text id="akb021" key="原医疗机构名称" readOnly="true" labelWidth="120"  span="2"/>
			 <ta:date id="aae001" key="年度"          showSelectPanel="true"  labelWidth="120"  dateYear="true"  required="true"/>
			 <ta:date id="aae030" key="申请日期(从)"  showSelectPanel="true"  labelWidth="120"/>
			 <ta:date id="aae031" key="申请日期(至)"  showSelectPanel="true"  labelWidth="120"/>
		</ta:panel>
		<ta:panel id="pnlZyInfo" key="转院申请信息" fit="true">
				<ta:datagrid id="dgKc20"  fit="true"  haveSn="true" snWidth="40" >
				     <ta:datagridItem id="aac001" key="个人ID"  align="center"  dataAlign="left" maxChart="7"  sortable="true"/>
				     <ta:datagridItem id="aac003" key="姓名"   showDetailed="true" align="center" maxChart="3" sortable="true"/>
			         <ta:datagridItem id="aac004" key="性别" collection="AAC004"   showDetailed="true"  align="center" maxChart="2" sortable="true"/>
			         <ta:datagridItem id="aac002" key="身份证号码"  showDetailed="true"  align="center"  maxChart="10" sortable="true"/>
				     <ta:datagridItem id="ake014" key="转院日期"    showDetailed="true"  align="center" maxChart="6" sortable="true"/>
				     <ta:datagridItem id="akb021" key="原医疗机构名称"  showDetailed="true"   align="center"  maxChart="15" sortable="true"/>
				     <ta:datagridItem id="akc172" key="转往医疗机构名称" showDetailed="true"  align="center"  maxChart="15" sortable="true"/>
				     <ta:datagridItem id="aka101" key="转往医院等级" collection="AKB097"   showDetailed="true"  align="center" maxChart="6" sortable="true"/>
				     <ta:datagridItem id="ake015" key="转院原因" showDetailed="true"  align="center" maxChart="5" sortable="true"/>
				     <ta:datagridItem id="aae190" key="诊断"   showDetailed="true"  align="center" maxChart="20" sortable="true"/>
				     <ta:datagridItem id="aaa034" key="统筹区"  showDetailed="true"  align="center"  collection="AAB034"  maxChart="6" sortable="true"/>
				     <ta:datagridItem id="yke270" key="转院类型"  showDetailed="true"  align="center"  collection="ZYLX"  maxChart="6" sortable="true"/>
				</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	 // 人员ID change事件
	function callbackFunPerson(){
		toQuery();
    }
	//rpc回调
	function callbackFunHos() {
		toQuery();
	};
	//查询
	function toQuery() 
	{
		var aae001 = Base.getValue("aae001");
		if("" == aae001 || null == aae001){
			return Base.alert("请输入年度!","warn",function(){
				Base.focus("aae001");
			});
		}else{
			Base.clearGridData("dgKc20");
			Base.submit("pnlCxtj","referralAppQueryAction!toQuery.do");
		}
	}
	// 导出
	function toDownload()
	{
		Base.expGridExcel("dgKc20");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>