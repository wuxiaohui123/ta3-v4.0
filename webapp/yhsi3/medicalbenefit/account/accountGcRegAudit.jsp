<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>人员账户继承复核</title>
	<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="yes-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="ButtonLayout1">
			<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="S" onClick="toSave()" />
			<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true"/>
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
		
			 <ta:panel id="pnl_personInfo" cols="3" key="被继承人基本信息">
			        <ta:text id="aac001"  key="个人ID"  readOnly="true" required="true" labelWidth="120"/>
			    	<ta:text id="aac003" key="姓名"         readOnly="true"  labelWidth="150" />
					<ta:text id="aac002" key="身份证号"   readOnly="true"  labelWidth="120" />
					<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
					<ta:date id="aac006" key="出生日期" showSelectPanel="true" readOnly="true" labelWidth="150" />
					<ta:selectInput id="yac084" key="离退休标志" readOnly="true" collection="YAC084" labelWidth="120"  />
					<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
					<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
					<ta:text id="aab001" key="单位编号"  readOnly="true"  labelWidth="150" />
					<ta:text id="aab003" key="单位名称"  readOnly="true" labelWidth="120" />
					<ta:text id="yke112" key="年龄"  readOnly="true" span="1" labelWidth="120" />
					<ta:selectInput id="ykc005" key="人员类型" readOnly="true"  collection="YKC005" labelWidth="150" />
					<ta:selectInput id="ykc006" key="人员类别" readOnly="true" collection="YKC006" labelWidth="120" />
					<ta:selectInput id="aac008" key="参保状态" collection="AAC008" readOnly="true" required="true"  cssStyle="color:red;" labelWidth="120"/>
					<ta:number id="aae042" key="退保年月"  readOnly="true" required="true" cssStyle="color:red;" labelWidth="150" />
					<ta:number id="aae240" key="账户余额"  readOnly="true" required="true" cssStyle="color:red;" labelWidth="120"/>
			 </ta:panel>
			 <ta:panel id="jcr_personInfo" cols="3" key="继承人基本信息">
			        <ta:text id="aac001_1"  key="个人ID"  readOnly="true" required="true" labelWidth="120"/>
			    	<ta:text id="aac003_1" key="姓名"         readOnly="true"  labelWidth="150" />
					<ta:text id="aac002_1" key="身份证号"   readOnly="true"  labelWidth="120" />
					<ta:selectInput id="aac004_1" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
					<ta:date id="aac006_1" key="出生日期" showSelectPanel="true" readOnly="true" labelWidth="150" />
					<ta:selectInput id="yac084_1" key="离退休标志" readOnly="true" collection="YAC084" labelWidth="120"  />
					<ta:selectInput id="aae140_1" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
					<ta:selectInput id="aac066_1" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
					<ta:text id="aab001_1" key="单位编号"  readOnly="true"  labelWidth="150" />
					<ta:text id="aab003_1" key="单位名称"  readOnly="true" labelWidth="120" />
					<ta:text id="yke112_1" key="年龄"  readOnly="true" span="1" labelWidth="120" />
					<ta:selectInput id="ykc005_1" key="人员类型" readOnly="true"  collection="YKC005" labelWidth="150" />
					<ta:selectInput id="ykc006_1" key="人员类别" readOnly="true" collection="YKC006" labelWidth="120" />
					<ta:selectInput id="aaa027_1" key="统筹区" readOnly="true" collection="AAA027" labelWidth="120" />
			 </ta:panel>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	$("body").taLayout();
});
    
  //保存页面信息
  function toSave()
  { 
    if (Base.validateForm("form1")) {
			Base.confirm("确定要提交吗?",
					function(btn, callback) {
						if (btn) {
							Base.submit('form1','accountGcRegAuditAction!toSave.do');
						}
					});
		}	
   }

  // 打印
  function toPrint()
  {
	var aac001 = Base.getValue('aac001');
	//var reportName = "accountGive.raq";
	var reportName = "MedicareZHQT.raq";
	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+reportName+"&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001);
	
  }
</script>
<%@ include file="/ta/incfooter.jsp"%>
