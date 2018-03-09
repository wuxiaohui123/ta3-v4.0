<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>补录个人账户初审</title>
	<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		  <ta:toolbar id="ButtonLayout1">
			<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave"  hotKey="S" onClick="toSave()" />
			<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true" />
		  </ta:toolbar>	
		<ta:form id="form1" fit="true">
			<ta:panel id="fld_lrxxxx" cols="3" key="录入详细信息">
				<ta:text id="aac001"  key="个人ID"  onChange="sfwQueryUtil(1,'getAac001',Base.getValue('aac001'))"  required="true" labelWidth="150" bpopTipMsg="输入个人ID、身份证号、姓名，可自动完成查询"/>
				<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="150" />
				<ta:selectInput id="yab139" key="参保分中心" collection="YAB003" readOnly="true" labelWidth="150"/>
				<ta:selectInput collection="AAE140" id="aae140" key="险种类型" labelWidth="150" required="true" reverseFilter="310" filter="310" value="310" readOnly="true" display="false"/>
				<ta:number id="aae058" key="本次补录金额"  labelWidth="150" required="true" cssStyle="color:blue" min="0" precision="2"/>
				<ta:text id="aae240" key="余额" readOnly="true" labelWidth="150" cssStyle="color:blue"/>
				<ta:text id="aae001" key="年度" readOnly="true" labelWidth="150" />
				<ta:text id="yke132" key="本年医疗基本收入" readOnly="true" labelWidth="150" />
				<ta:text id="yke137" key="基本医疗利息收入" readOnly="true" labelWidth="150" />
				<ta:text id="yke134" key="本年基本医疗支出" readOnly="true" labelWidth="150" />
				<ta:text id="yke133" key="本年公务员医疗收入" readOnly="true" labelWidth="150" />
				<ta:text id="yke146" key="公务员利息利息" readOnly="true" labelWidth="150" />
				<ta:text id="yke135" key="本年公务员支出" readOnly="true" labelWidth="150" />
				<ta:selectInput collection="AAE100" id="aae100" key="当前有效标志" readOnly="true" labelWidth="150" />
				
			</ta:panel>
			<ta:panel id="fld_lrbz" cols="3" key="录入备注">
				<ta:textarea id="aae013" key="备注"   span="3"  labelWidth="150" bpopTipMsg="输入字符长度小于200"/>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
		$("body").taLayout();
		Base.focus('aac001');
		initializeSuggestFramework(1,"","aac001",500,300,4,query,0,false); //以后添加了方法用
	});
	//重置
	function toReset() {
		Base.confirm("确定要清空数据吗?", function(yes) {
			if (yes) {
				Base.resetForm('form1');
				Base.setEnable("btnSave,btnReset,btnAdd,btnDelete");
			}
		});
	}
	//保存页面信息
	function toSave(){
		if (Base.validateForm("form1")) {
		    if(0 == Base.getValue("aae058")){
		       Base.alert("本次补录金额必须大于0，否则不能保存");
		       return false;
		    }
		    if("0" == Base.getValue("aae100")){
		       Base.alert("个人账户有效标志为无效，否则补录个人账户");
		       return false;
		    }
			Base.submit("form1","accountAgainRegAction!toSave.do");
			}
		else{
			Base.alert("您还有带红星的未输项!","warn");
		}
	}
	//查询数据库
	function query(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.submit("aac001","accountAgainRegAction!queryBaseInfo.do");
	}
	
</script>

<%@ include file="/ta/incfooter.jsp"%>
