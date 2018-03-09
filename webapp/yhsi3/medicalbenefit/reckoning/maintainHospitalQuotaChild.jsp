<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>住院定额指标管理弹出界面</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="saveKc39()" />
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form2" fit="true">
		<ta:text id="bclx" key="保存类型(1:新增,2:修改)"  labelWidth="120" display="false"/>
		<ta:box  id="bxData" cols="3" cssStyle="margin-top:10px;">
			<ta:text id="akb020" key="医疗机构编码" required="true"  labelWidth="120" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:selectInput id="yka316" key="人员类别" collection="YKA316" labelWidth="120" required="true"  filter="15,16,18,24"  reverseFilter="true"/>
			<ta:selectInput id="aka122" key="病种名称" collection="AKA12S" labelWidth="120" required="true"  filter="2" />
			<ta:number id="yka500" key="指标金额" min="0"  max="999999999999.99"  precision="2" labelWidth="120" required="true"/>
			<ta:date id="aae002" key="年月"  showSelectPanel="true" labelWidth="120" issue="true" required="true"/>
			<ta:text id="aae013" key="备注说明" span="2" labelWidth="120"/>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	//医疗机构回调函数
	function fnKb01MagifierBack(rowdata)
	{
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	
	//保存新增或修改数据
	function saveKc39()
	{
		if (Base.validateForm("form2")) 
		{
			Base.submit("form2", "maintainHospitalQuotaAction!saveKc39.do", null, null, false, function(data){
			   var bclx = Base.getValue("bclx");
			   if("1"==bclx)
			   {
			    Base.confirm("保存成功,是否继续新增？", function(yes){
			      if(yes)
			      {
			          //清空数据
			          Base.clearData("bxData");
			          //焦点置于医疗机构编码
			          Base.focus("akb020");
			      }
			      else
			      {
			    	  closeWin();
			      }
			    }, null);
			   }
			   else
			   {
			      Base.alert("保存成功","success",function(){
			         closeWin();
			      });
			   }
	    		
	   		}, function(data){
	   			Base.alert(data.fieldData.msg,"warn");
	   		});
	   	}
	   	else
	   	{
	   	  Base.alert("带红星的为必输入项!","warn");
	   	}
	}
	
	//关闭窗口
	function closeWin()
	{
	    parent.Base.closeWindow('userwin');
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>