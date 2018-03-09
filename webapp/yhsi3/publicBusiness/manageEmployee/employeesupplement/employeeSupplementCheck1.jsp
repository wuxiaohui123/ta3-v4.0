<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>employeeSupplementCheck1</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading />
    <ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="submitData();"  asToolBarItem="true" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="alt+C" onClick="closeWin();"/>
	</ta:toolbar>
<ta:form id="form1" fit="true">
	<ta:panel key="审核信息" height="85" expanded="false" scalable="false">
		<ta:box id="procInc">
			
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		<ta:text id="fhjc" display="false" key="复核级次"/>
	</ta:panel>
	<ta:panel fit="true" hasBorder="false">
		<ta:tabs id="tabsSI" fit="true">
			<ta:tab id="infoTb" key="单位基本信息" cssStyle="overflow:auto">
				<ta:panel key="基本信息" cols="3" id="fltUnit_old" expanded="false" scalable="false">
	              <ta:text id="aab001" key="单位编号" labelWidth="120"   maxLength="20" />
                  <ta:text id="aae044" key="名称"  readOnly="true" span="2" labelWidth="120"/>
                  <ta:text id="aab999" key="单位管理码" labelWidth="120" readOnly="true" maxLength="20" />
                  <ta:selectInput id="aab019" key="单位类型" labelWidth="120" collection="AAB019"  readOnly="true"/>
                  <ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" collection="YAB019"  readOnly="true"/>
               </ta:panel>
			</ta:tab>
			<ta:tab id="infoTbCB" key="单位参保信息" cssStyle="overflow:auto">
				<ta:datagrid id="cb_grid" fit="true">
    				<ta:datagridItem id="aab001_cb" key="单位ID" width="100"/>
		    		<ta:datagridItem id="aae140_cb" key="险种类型" collection="AAE140" width="180" align="center" dataAlign="left" />
					<ta:datagridItem id="aab050_cb" key="参保日期"  dataType="date" width="100" align="center" dataAlign="center"/>
					<ta:datagridItem id="aab051_cb" key="参保状态" collection="AAB051" width="100" align="center" dataAlign="left"/>
					<ta:datagridItem id="yae097_cb" key="最大做账期号" width="100" align="center" dataAlign="right"/>
					<ta:datagridItem id="yaz289_cb" key="征缴规则ID" collection="YAZ289" width="160" align="center" dataAlign="right" showDetailed="true"/>
					<ta:datagridItem id="aaz136_cb" key="基数核定规则ID" collection="AAZ136" width="160" align="center" dataAlign="right"/>
					<ta:datagridItem id="yab139_cb" key="参保所属机构"  collection="YAB003" width="260" align="center" dataAlign="left"/>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="infoTbBCCB" key="单位补充参保信息（员工新增险种）" cssStyle="overflow:auto">
				<ta:datagrid id="dgAc22" haveSn="true" height="270" columnFilter="true" fit="true">
					<ta:datagridItem id="aac003" key="姓名" align="center" width="90" showDetailed="true"/>
					<ta:datagridItem id="aac002" key="证件号码" align="center" width="160" showDetailed="true"/>
					<ta:datagridItem id="aae140" key="险种类型" align="center" collection="AAE140" width="180" showDetailed="true"/>
					<ta:datagridItem id="aac001" key="人员ID" align="center" width="160" showDetailed="true"/>
					<ta:datagridItem id="aac066" key="参保身份" align="center" width="160" collection="aac066" showDetailed="true"/>
					<ta:datagridItem id="aab033" key="征收方式" align="center" collection="AAB033" width="160" showDetailed="true"/>
					<ta:datagridItem id="ykc005" key="人员类型" align="center" collection="YKC005" width="160" showDetailed="true"/>
					<ta:datagridItem id="ykc006" key="人员类别" align="center" collection="YKC006" width="160" showDetailed="true"/>
					<ta:datagridItem id="aae041" key="开始年月" align="center" width="160" showDetailed="true"/>
					<ta:datagridItem id="aae042" key="终止年月" align="center"  width="160" showDetailed="true"/>
					<ta:datagridItem id="yac084" key="退休标记" align="center" collection="YAC084" width="160" showDetailed="true"/>
					<ta:datagridItem id="ajc050" key="本次参加工作日期" align="center" dataAlign="center" width="160" showDetailed="true"/>
					<ta:datagridItem id="yaz289" key="征缴规则类型ID" align="center" collection="YAZ289" width="220" showDetailed="true"/>
					<ta:datagridItem id="aaz136" key="基数核定规则参数ID" align="center" collection="AAZ136" width="160" showDetailed="true"/>
				</ta:datagrid>
			</ta:tab>
				
		
			
			<ta:tab id="sjlcTb" key="事件流程记录" cssStyle="overflow:auto">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:panel>	
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//保存经办信息
	function submitData(){
		Base.submit("form1","employeeSupplementCheck1Action!toSave.do");
		Base.setDisabled('saveBtn');
	}
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
	
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float","left");
		$("body").css("overflow","hidden");
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>