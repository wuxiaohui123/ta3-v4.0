<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>retireEmpCheck</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
    <ta:pageloading />
	<ta:toolbar id="toolbarUnit">
		<ta:button id="btnSave" key="保存[S]" hotKey="S" icon="xui-icon-spotSave" onClick="fnSave();" asToolBarItem="true"/>
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="closeWin();" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto;">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		<ta:text id="fhjc" display="false" key="复核级次"/>
	    <ta:panel key="个人基本信息" cols="3" id="fltPerson" >		  
		    <%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
        </ta:panel>
        <ta:panel key="单位基本信息" cols="3" id="fltUnit" >
	        <%@ include file="/yhsi3/commonJSP/dwjbxx.jsp"%>
        </ta:panel>
		<ta:panel key="其他信息" id="fltOther" cols="3" >
			<ta:selectInput id="aic161" key="离退休类别" labelWidth="120" required="true" collection="AIC161" readOnly="false" />
			<ta:date id="aic162" key="离退休日期" showSelectPanel="true" required="true" labelWidth="120" />
			<ta:number id="aac040" key="医疗退休工资" precision="2" bpopTipMsg="医保退休划账户工资" max="99999999" min="0" alignLeft="true" labelWidth="120" />
			<ta:text id="aae013_old" key="备注" labelWidth="120" maxLength="100" span="3"/>
		</ta:panel>
		<ta:tabs id="tab_all" fit="true">
			<ta:tab id="tab_1" key="个人参保信息">
				<ta:datagrid id="ac20Grid" fit="true" forceFitColumns="true" haveSn="true">
					<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="sjlcTb" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		$("body").css("overflow","hidden");
	});
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
	
	//保存审核信息
	function fnSave(){
		Base.submit('form1','retireEmpCheckAction!toSave.do');
		Base.setDisabled('btnSave');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>