<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>registerEmployeeCheck1</title>
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
			<ta:tab id="Tabgrcb" key="个人参保信息">
				<ta:panel id="fltPerson" key="个人基本信息" cols="3" expanded="false" scalable="false">		  
				    <%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
				    <ta:text id="aac007" key="参加工作时间" display="false"/>
		        </ta:panel>
				<ta:panel id="fltUnit" key="单位基本信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aab001" key="单位编号" labelWidth="120"  maxLength="20" />
					<ta:text id="aae044" key="单位名称" readOnly="true" span="2" labelWidth="120"/>
					<ta:text id="aab999" key="单位管理码" readOnly="true"  labelWidth="120" />
					<ta:selectInput id="aab019" key="单位类型" labelWidth="120" readOnly="true"  collection="AAB019" maxVisibleRows="10" />
					<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" readOnly="true" collection="YAB019" />
				</ta:panel>
				
				<ta:panel id="fltRegister" key="险种选择" expanded="false" scalable="false">
					<ta:checkboxgroup id="cbgp" cssStyle="margin-left:20px;" cols="7">
						<ta:text id="a110" display="false"/>
						<ta:text id="a120" display="false"/>
						<ta:text id="a210" display="false"/>
						<ta:text id="a310" display="false"/>
						<ta:text id="a410" display="false"/>
						<ta:text id="a510" display="false"/>
						<ta:checkbox key="养老保险" id="aae140_110" />
						<ta:checkbox key="机关养老保险" id="aae140_120" />
						<ta:checkbox key="失业保险" id="aae140_210" />
						<ta:checkbox key="医疗保险" id="aae140_310" />
						<ta:checkbox key="生育保险" id="aae140_510" />
						<ta:checkbox key="工伤保险" id="aae140_410" />
					</ta:checkboxgroup>
				</ta:panel>
				
				<ta:panel cols="3" id="fltCB" expanded="false" scalable="false">
					<ta:number id="aac040" key="工资" labelWidth="120"  precision="2" max="99999999" asAamount="true" amountPre="￥"/>
					<ta:selectInput id="aac066" key="参保身份" collection="aac066" labelWidth="120"  selectFirstValue="true"/>
					<ta:selectInput id="aab033" key="征收方式"  collection="aab033" labelWidth="120" selectFirstValue="true"/>
					<ta:selectInput id="aac013" key="用工形式" collection="aac013" labelWidth="120" selectFirstValue="true"/>
					<ta:date id="aac049" key="首次参保年月" showSelectPanel="true"  labelWidth="120"/>
					<ta:date id="ajc050" key="本次参加工作日期" display="false" showSelectPanel="true" labelWidth="120"/>
				</ta:panel>
				
				<ta:tabs id="tbs_xzxx" fit="true">
					<ta:tab id="tb_cbxx" key="单位参保信息" cssStyle="overflow:auto">
		    		  <ta:datagrid id="cb_grid" fit="true">
	    				<ta:datagridItem id="aab001_cb" key="单位ID" width="100"/>
			    		<ta:datagridItem id="aae140_cb" key="险种类型" collection="AAE140" width="180"/>
						<ta:datagridItem id="aab050_cb" key="参保日期"  dataType="date" width="100"/>
						<ta:datagridItem id="aab051_cb" key="参保状态" collection="AAB051" width="100"/>
						<ta:datagridItem id="yae097_cb" key="最大做账期号" width="100"/>
						<ta:datagridItem id="yaz289_cb" key="征缴规则ID" collection="YAZ289" width="160"/>
						<ta:datagridItem id="aaz136_cb" key="基数核定规则ID" collection="AAZ136" width="160"/>
						<ta:datagridItem id="yab139_cb" key="参保所属机构"  collection="YAB003" width="260"/>
					   </ta:datagrid>
					</ta:tab>
									
					<ta:tab id="tb_aae140_110" key="养老参保" cssStyle="overflow:auto">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_110" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_110" key="征收方式" display="false" collection="aab033" labelWidth="120"/>
						<ta:selectInput id="aac013_110" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_110" key="征缴规则" labelWidth="120" collection="yaz289"/>
						<ta:selectInput id="aaz136_110" key="基数核定规则" labelWidth="120" collection="aaz136"/>
						<ta:date id="aac030_110" key="个人参保日期" showSelectPanel="true" labelWidth="120"/>
	    			 </ta:box>
					</ta:tab>
					<ta:tab id="tb_aae140_120" key="机关养老参保" cssStyle="overflow:auto">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_120" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_120" key="征收方式" collection="aab033" labelWidth="120"  display="false"/>
						<ta:selectInput id="aac013_120" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_120" key="征缴规则" labelWidth="120" collection="yaz289"/>
						<ta:selectInput id="aaz136_120" key="基数核定规则" labelWidth="120" collection="aaz136"/>
						<ta:date id="aac030_120" key="个人参保日期" showSelectPanel="true" labelWidth="120" />
	    			 </ta:box>
					</ta:tab>
					
					
					<ta:tab id="tb_aae140_210" key="失业参保">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_210" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_210" key="征收方式" display="false" collection="aab033" labelWidth="120"/>
						<ta:selectInput id="aac013_210" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_210" key="征缴规则" labelWidth="120" collection="yaz289"/>
						<ta:selectInput id="aaz136_210" key="基数核定规则" labelWidth="120" collection="aaz136"/>
						<ta:date id="aac030_210" key="个人参保日期" showSelectPanel="true" labelWidth="120"/>
	    			 </ta:box>
					</ta:tab>
					<ta:tab id="tb_aae140_310" key="医疗参保">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_310" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_310" key="征收方式" collection="aab033" labelWidth="120"  display="false"/>
						<ta:selectInput id="aac013_310" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_310" key="征缴规则" labelWidth="120" collection="yaz289"/>
						<ta:selectInput id="aaz136_310" key="基数核定规则" labelWidth="120" collection="aaz136"/>
						<ta:date id="aac030_310" key="个人参保日期" showSelectPanel="true" labelWidth="120" />
	    			 </ta:box>
					</ta:tab>
					
					<ta:tab id="tb_aae140_410" key="养老参保">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_410" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_410" key="征收方式" display="false" collection="aab033" labelWidth="120"/>
						<ta:selectInput id="aac013_410" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_410" key="征缴规则" labelWidth="120" collection="yaz289"/>
						<ta:selectInput id="aaz136_410" key="基数核定规则" labelWidth="120" collection="aaz136"/>
						<ta:date id="aac030_410" key="个人参保日期" showSelectPanel="true" labelWidth="120"/>
	    			 </ta:box>
					</ta:tab>
					<ta:tab id="tb_aae140_510" key="机关养老参保">
		    		 <ta:box cols="3">
	    				<ta:text id="aab050_510" key="单位参保日期" readOnly="true" display="false" labelWidth="120"/>
			    		<ta:selectInput id="aab033_510" key="征收方式" collection="aab033" labelWidth="120"  display="false"/>
						<ta:selectInput id="aac013_510" key="用工形式" display="false" collection="aac013" labelWidth="120"/>
						<ta:selectInput id="yaz289_510" key="征缴规则" labelWidth="120" collection="yaz289"/>
						<ta:selectInput id="aaz136_510" key="基数核定规则" labelWidth="120" collection="aaz136"/>
						<ta:date id="aac030_510" key="个人参保日期" showSelectPanel="true" labelWidth="120" />
	    			 </ta:box>
					</ta:tab>
				</ta:tabs>
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
		Base.submit("form1","employeeinsuredCheck1Action!toSave.do");
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
		Base.hideObj("tb_aae140_110");
		Base.hideObj("tb_aae140_120");
		Base.hideObj("tb_aae140_210");
		Base.hideObj("tb_aae140_310");
		Base.hideObj("tb_aae140_410");
		Base.hideObj("tb_aae140_510");
		
		Base.hideObj("aae140_110");
		Base.hideObj("aae140_120");
		Base.hideObj("aae140_210");
		Base.hideObj("aae140_310");
		Base.hideObj("aae140_410");
		Base.hideObj("aae140_510");
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>