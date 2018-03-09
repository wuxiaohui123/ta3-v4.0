<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
<head>
<title>changeInsuranceInfo</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading/>
	<ta:toolbar id="toolbar1">
		<ta:button id="btnSave" key="保存[S]" hotKey="S" icon="xui-icon-spotSave" onClick="submitData();" asToolBarItem="true"/>
		<ta:button id="resetBtn" key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true" cssStyle="overflow:auto;">
	    <ta:panel id="fltPerson" key="个人基本信息" cols="3" >		  
		    <%@ include file="/yhsi3/commonJSP/ryjbxx_c.jsp"%>
		    <ta:text id="aac007" key="参加工作时间" display="false"/>
		    <ta:text id="akc022" key="建账类型" display="false"/>
        </ta:panel>
        <ta:panel id="fltUnit" key="单位基本信息" cols="3" >
	        <ta:box cols="2">
				<ta:text id="old_aab001" key="单位编号" labelWidth="120" required="true" maxLength="20" columnWidth="0.9" onChange="callDwRPC()" bpopTipMsg="可输入单位管理码、公司名称、单位ID"/>
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()"/>
				</ta:buttonLayout>
			</ta:box>
			<ta:selectInput id="si_aab001" key="单位编号" display="false" labelWidth="120" required="true" onSelect="fnSelectUnit" showKey="true"/>
		    <ta:text id="old_aae044" key="名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:text id="old_aab999" key="单位管理码" labelWidth="120" readOnly="true" maxLength="20" />
			<ta:selectInput id="old_aab019" key="单位类型" labelWidth="120" collection="AAB019"  readOnly="true"/>
			<ta:selectInput id="old_yab019" key="单位管理类型" labelWidth="120" collection="YAB019"  readOnly="true"/>
        </ta:panel>
        <ta:panel id="fldSelectChange" key="变更类型选择" cols="3" >
            <ta:selectInput id="changeType" key="变更类型" labelWidth="120" onSelect="fnBglx" filterStartChar="10,11,13,14,23,24,25" required="true" collection="AAC050"/>
       		<ta:date id="lastDay" key="当月最后一天时间" display="false"/>
       		<ta:date id="lastDay1" key="下月最后一天时间" display="false"/>
        </ta:panel>
        
        <ta:tabs id="tabs_insurance" onSelect="fnSelect" height="550">
        	<ta:tab id="tb_changeType" key="变更类型">
        		<ta:panel key="变更信息" id="flt_change"  cols="3" >
					<ta:selectInput id="change_aae160" key="变更原因" span="2" labelWidth="120" required="true" islevel="true" isMustLeaf="true" onSelect="checkDeath"/>
					<ta:date id="change_aae035" key="变更日期" showSelectPanel="true" required="true" labelWidth="120" onChange="fnChangeTime('change');"/>
					<ta:text id="change_aae013" key="备注" maxLength="100" span="3" labelWidth="120"/>
				</ta:panel>
				<ta:tabs id="tb_insInfo_change" fit="true">
					<ta:tab id="tb_selectchange" key="选择变更险种">
						<ta:button id="btn_create" key="增加" icon="xui-icon-spotAdd" onClick="fnCreateChange();"/>
						<ta:datagrid id="changeGrid" rowColorfn="fnColor" fit="true" haveSn="true" selectType="checkbox" forceFitColumns="true" onRowSelect="fnCheck">
							<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" width="90"/>
							<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" dataAlign="left" width="120"/>
							<ta:datagridItem id="aac001" key="个人编号" align="center" dataAlign="left" width="90"/>
							<ta:datagridItem id="aac003" key="姓名" showDetailed="true" align="center" dataAlign="left" width="140"/>
							<ta:datagridItem id="aae140" key="险种" showDetailed="true" align="center" dataAlign="left" collection="aae140" width="180"/>
							<ta:datagridItem id="aac008" key="人员参保状态" align="center" collection="AAC008" width="100"/>
							<ta:datagridItem id="aac030" key="参保日期" align="center" dataAlign="center" width="80"/>
							<ta:datagridItem id="aae041" key="开始时间" align="center" dataAlign="center"  width="90" />
							<ta:datagridItem id="aae042" key="终止时间" align="center" dataAlign="center"  width="90" />
							<ta:datagridItem id="ykc005" key="特殊人员类型" showDetailed="true" align="center" width="150" collection="YKC005"/>
							<ta:datagridItem id="ykc006" key="特殊人员类别" showDetailed="true" align="center" width="150" collection="YKC006"/>
							<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" width="100"/>
							<ta:datagridItem id="yab139" key="参保所属机构" align="center" dataAlign="left" collection="yab003" width="100"/>
						</ta:datagrid>
					</ta:tab>
				</ta:tabs>
        	</ta:tab>
        	
        	<ta:tab id="tb_resume" key="恢复缴费">
        		<ta:panel id="flt_newUnit" key="新参保单位信息" cols="3" >
	        		<ta:box cols="2">
						<ta:text id="new_aab001" key="单位编号" labelWidth="120" required="true" maxLength="20" columnWidth="0.9" onChange="callDwRPC1()" bpopTipMsg="可输入单位管理码、公司名称、单位ID"/>
						<ta:buttonLayout align="left" columnWidth="0.1">
							<ta:button id="showDwRPCBtn1" key="?" onClick="showDwRPC()"/>
						</ta:buttonLayout>
					</ta:box>
				    <ta:text id="new_aae044" key="名称" readOnly="true" span="2" labelWidth="120"/>
					<ta:text id="new_aab999" key="单位管理码" labelWidth="120" readOnly="true" maxLength="20" />
					<ta:selectInput id="new_aab019" key="单位类型" labelWidth="120" collection="AAB019"  readOnly="true"/>
					<ta:selectInput id="new_yab019" key="单位管理类型" labelWidth="120" collection="YAB019"  readOnly="true"/>
        		</ta:panel>
        		<ta:panel key="恢复缴费信息" id="flt_resume" cols="3" >
					<ta:number id="aac040" key="工资" labelWidth="120" precision="2" max="99999999" asAamount="true" amountPre="￥" required="true"/>
					<ta:selectInput id="aac066" key="参保身份" collection="AAC066" labelWidth="120" selectFirstValue="true" required="true"/>
					<ta:selectInput id="aab033" key="征收方式" collection="AAB033" filter="6" labelWidth="120" selectFirstValue="true" required="false" display="false"/>
					<ta:selectInput id="aac013" key="用工形式" collection="AAC013" labelWidth="120" selectFirstValue="true" required="true"/>
					<ta:date id="ajc050" key="本次参工日期" labelWidth="120" showSelectPanel="true" required="true" onChange="fnTimeCheck('ajc050');"/>
					<ta:date id="aac049" key="首次参保年月" labelWidth="120" showSelectPanel="true" required="false" display="false" onChange="fnTimeCheck('aac049');"/>
					<ta:date id="aae035" key="恢复日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnChangeTime('3');"/>
					<ta:selectInput id="aae160" key="恢复原因" labelWidth="120" required="true" islevel="true" isMustLeaf="true"/>
					<ta:text id="aae013" key="备注" maxLength="120" span="2" labelWidth="120"/>
				</ta:panel>
				<%@ include file="/yhsi3/commonJSP/xzlx_gr.jsp"%>
				<ta:buttonLayout>
					<ta:button id="btn_resume" key="增加" icon="xui-icon-spotAdd" onClick="fnResumeChange();"/>	
				</ta:buttonLayout>
				<ta:tabs id="tab_all" fit="true">
					<ta:tab id="tab_insAll" key="中断缴费险种">
						<ta:datagrid id="ac20Grid" forceFitColumns="true" fit="true" haveSn="true">
							<ta:datagridItem id="aae140" key="险种" align="center" showDetailed="true" collection="AAE140" width="180"/>
							<ta:datagridItem id="aac008" key="参保状态" align="center" collection="AAC008" width="100"/>
							<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" width="100"/>
							<ta:datagridItem id="aae042" key="终止年月" align="center" dataAlign="center" width="100"/>
							<ta:datagridItem id="ykc005" key="特殊人员类型" showDetailed="true" align="center" width="150" collection="YKC005"/>
							<ta:datagridItem id="ykc006" key="特殊人员类别" showDetailed="true" align="center" width="150" collection="YKC006"/>
							<ta:datagridItem id="aac049" key="首次参保年月" align="center" dataAlign="center" width="140"/>
							<ta:datagridItem id="aac030" key="个人参保日期" align="center" dataAlign="center" width="140"/>
							<ta:datagridItem id="yab139" key="参保所属机构" align="center" showDetailed="true" collection="AAB301" width="200"/>
							<ta:datagridItem id="aaz159" key="人员参保关系ID" hiddenColumn="false"/>
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_insRight" key="勾选续保险种">
						<ta:datagrid id="ac20GridRight" forceFitColumns="true" fit="true" rowColorfn="fnColor" haveSn="true" selectType="checkbox" onSelectChange="fnSelectChange">
							<ta:datagridItem id="aae140" key="险种" align="center" showDetailed="true" collection="AAE140" width="180"/>
							<ta:datagridItem id="aac008" key="参保状态" align="center" collection="AAC008" width="100"/>
							<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center" width="100"/>
							<ta:datagridItem id="aae042" key="终止年月" align="center" dataAlign="center" width="100"/>
							<ta:datagridItem id="ykc005" key="特殊人员类型" showDetailed="true" align="center" width="150" collection="YKC005"/>
							<ta:datagridItem id="ykc006" key="特殊人员类别" showDetailed="true" align="center" width="150" collection="YKC006"/>
							<ta:datagridItem id="aac049" key="首次参保年月" align="center" dataAlign="center" width="140"/>
							<ta:datagridItem id="aac030" key="个人参保日期" align="center" dataAlign="center" width="140"/>
							<ta:datagridItem id="yab139" key="参保所属机构" align="center" showDetailed="true" collection="AAB301" width="200"/>
							<ta:datagridItem id="aaz159" key="人员参保关系ID" hiddenColumn="false"/>
						</ta:datagrid>
					</ta:tab>
					<ta:tab id="tab_110" key="企业养老保险">
				    	<ta:box cols="3">
				    	    <ta:selectInput id="ykc005_110" key="特殊人员类型" labelWidth="120" required="true"  onSelect="setykc006"/>
				    	    <ta:selectInput id="ykc006_110" key="特殊人员类别" labelWidth="120" required="true"  />
							<ta:selectInput id="yaz289_110" key="征缴规则" labelWidth="120" required="true"/>
							<ta:selectInput id="aaz136_110" key="基数核定规则" labelWidth="120" required="true" isAutoExtend="true"/>
							<ta:date id="aac030_110" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnTimeCheck('aac030_110');"/>
			    		</ta:box>
					</ta:tab>
					<ta:tab id="tab_120" key="机关养老保险">
				    	<ta:box cols="3">
				    	    <ta:selectInput id="ykc005_120" key="特殊人员类型" labelWidth="120" required="true"  onSelect="setykc006"/>
				    	    <ta:selectInput id="ykc006_120" key="特殊人员类别" labelWidth="120" required="true"  />
							<ta:selectInput id="yaz289_120" key="征缴规则" labelWidth="120" required="true"/>
							<ta:selectInput id="aaz136_120" key="基数核定规则" labelWidth="120" required="true" isAutoExtend="true"/>
							<ta:date id="aac030_120" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnTimeCheck('aac030_120');"/>
			    		</ta:box>
					</ta:tab>					
					<ta:tab id="tab_210" key="失业保险">
				    	<ta:box cols="3">
				    	    <ta:selectInput id="ykc005_210" key="特殊人员类型" labelWidth="120" required="true"  onSelect="setykc006"/>
				    	    <ta:selectInput id="ykc006_210" key="特殊人员类别" labelWidth="120" required="true"  />
							<ta:selectInput id="yaz289_210" key="征缴规则" labelWidth="120" required="true"/>
							<ta:selectInput id="aaz136_210" key="基数核定规则" labelWidth="120" required="true"/>
							<ta:date id="aac030_210" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnTimeCheck('aac030_210');"/>
			    		</ta:box>
					</ta:tab>
					<ta:tab id="tab_310" key="基本医疗">
				    	<ta:box cols="3">
				    	    <ta:selectInput id="ykc005_310" key="特殊人员类型" labelWidth="120" required="true"  onSelect="setykc006"/>
				    	    <ta:selectInput id="ykc006_310" key="特殊人员类别" labelWidth="120" required="true"  />
							<ta:selectInput id="yaz289_310" key="征缴规则" labelWidth="120" required="true"/>
							<ta:selectInput id="aaz136_310" key="基数核定规则" labelWidth="120" required="true"/>
							<ta:date id="aac030_310" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnTimeCheck('aac030_310');"/>
			    		</ta:box>
					</ta:tab>
					<ta:tab id="tab_320" key="公务员补助">
				    	<ta:box cols="3">
				    	    <ta:selectInput id="ykc005_320" key="特殊人员类型" labelWidth="120" required="true"  onSelect="setykc006"/>
				    	    <ta:selectInput id="ykc006_320" key="特殊人员类别" labelWidth="120" required="true"  />
							<ta:selectInput id="yaz289_320" key="征缴规则" labelWidth="120" required="true"/>
							<ta:selectInput id="aaz136_320" key="基数核定规则" labelWidth="120" required="true"/>
							<ta:date id="aac030_320" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnTimeCheck('aac030_320');"/>
			    		</ta:box>
					</ta:tab>
					<ta:tab id="tab_330" key="大额医疗">
				    	<ta:box cols="3">
				    	    <ta:selectInput id="ykc005_330" key="特殊人员类型" labelWidth="120" required="true"  onSelect="setykc006"/>
				    	    <ta:selectInput id="ykc006_330" key="特殊人员类别" labelWidth="120" required="true"  />
							<ta:selectInput id="yaz289_330" key="征缴规则" labelWidth="120" required="true"/>
							<ta:selectInput id="aaz136_330" key="基数核定规则" labelWidth="120" required="true"/>
							<ta:date id="aac030_330" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnTimeCheck('aac030_330');"/>
			    		</ta:box>
					</ta:tab>
					<ta:tab id="tab_340" key="离休二乙">
				    	<ta:box cols="3">
				    	    <ta:selectInput id="ykc005_340" key="特殊人员类型" labelWidth="120" required="true"  onSelect="setykc006"/>
				    	    <ta:selectInput id="ykc006_340" key="特殊人员类别" labelWidth="120" required="true"  />
							<ta:selectInput id="yaz289_340" key="征缴规则" labelWidth="120" required="true"/>
							<ta:selectInput id="aaz136_340" key="基数核定规则" labelWidth="120" required="true"/>
							<ta:date id="aac030_340" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnTimeCheck('aac030_340');"/>
			    		</ta:box>
					</ta:tab>
					
					<ta:tab id="tab_370" key="企业补充医疗">
				    	<ta:box cols="3">
				    	    <ta:selectInput id="ykc005_370" key="特殊人员类型" labelWidth="120" required="true"  onSelect="setykc006"/>
				    	    <ta:selectInput id="ykc006_370" key="特殊人员类别" labelWidth="120" required="true"  />
							<ta:selectInput id="yaz289_370" key="征缴规则" labelWidth="120" required="true"/>
							<ta:selectInput id="aaz136_370" key="基数核定规则" labelWidth="120" required="true"/>
							<ta:date id="aac030_370" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnTimeCheck('aac030_370');"/>
			    		</ta:box>
					</ta:tab>
					<ta:tab id="tab_410" key="工伤保险">
				    	<ta:box cols="3">
				    	    <ta:selectInput id="ykc005_410" key="特殊人员类型" labelWidth="120" required="true"  onSelect="setykc006"/>
				    	    <ta:selectInput id="ykc006_410" key="特殊人员类别" labelWidth="120" required="true"  />
							<ta:selectInput id="yaz289_410" key="征缴规则" labelWidth="120" required="true"/>
							<ta:selectInput id="aaz136_410" key="基数核定规则" labelWidth="120" required="true"/>
							<ta:date id="aac030_410" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnTimeCheck('aac030_410');"/>
			    		</ta:box>
					</ta:tab>
					<ta:tab id="tab_510" key="生育保险">
				    	<ta:box cols="3">
				    	    <ta:selectInput id="ykc005_510" key="特殊人员类型" labelWidth="120" required="true"  onSelect="setykc006"/>
				    	    <ta:selectInput id="ykc006_510" key="特殊人员类别" labelWidth="120" required="true"  />
							<ta:selectInput id="yaz289_510" key="征缴规则" labelWidth="120" required="true"/>
							<ta:selectInput id="aaz136_510" key="基数核定规则" labelWidth="120" required="true"/>
							<ta:date id="aac030_510" key="个人参保日期" showSelectPanel="true" labelWidth="120" required="true" onChange="fnTimeCheck('aac030_510');"/>
			    		</ta:box>
					</ta:tab>
				</ta:tabs>
        	</ta:tab>
        	
        	<ta:tab id="tb_changeInfo" key="参保变更总览">
        		<ta:button id="btn_change" key="删除" icon="xui-icon-spotDelete" onClick="fnAllChange();"/>
			    <ta:datagrid id="changeInfoGrid" forceFitColumns="true" enableColumnMove="false" groupingBy="bglx" selectType="checkbox" snWidth="30" fit="true">
					<ta:datagridItem id="bglx" key="变更类型" align="center" width="80" collectionData="[{'id':'1','name':'暂停缴费','py':'ztjf'},{'id':'2','name':'恢复缴费','py':'hfjf'},{'id':'3','name':'终止缴费','py':'zzjf'},{'id':'4','name':'险种新增','py':'xzxz'},{'id':'5','name':'统筹内转出','py':'tcnzc'},{'id':'6','name':'统筹内转入','py':'tcnzr'}]"/>
					<ta:datagridItem id="aab001" key="单位编号" align="center" width="80"/>
					<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" width="160"/>
					<ta:datagridItem id="aac001" key="个人编号" align="center" width="80"/>
					<ta:datagridItem id="aac003" key="姓名" showDetailed="true" align="center" width="80"/>
					<ta:datagridItem id="aae140" key="险种类型" showDetailed="true" align="center" width="150" collection="AAE140"/>
					<ta:datagridItem id="ykc005" key="特殊人员类型" showDetailed="true" align="center" width="150" collection="YKC005"/>
					<ta:datagridItem id="ykc006" key="特殊人员类别" showDetailed="true" align="center" width="150" collection="YKC006"/>
					<ta:datagridItem id="aae035" key="变更日期" align="center" dataAlign="center" width="90"/>
					<ta:datagridItem id="aae160" key="变更原因" showDetailed="true" align="center" width="220" collection="AAE160"/>
					<ta:datagridItem id="aae013" key="备注" showDetailed="true" align="center" width="90"/>
					<ta:datagridItem id="aab033" key="征收方式" align="center" hiddenColumn="true"/>
					<ta:datagridItem id="aac013" key="用工形式" align="center" hiddenColumn="true"/>
					<ta:datagridItem id="aac066" key="参保身份" align="center" hiddenColumn="true"/>
					<ta:datagridItem id="ajc050" key="本次参工日期" align="center" dataAlign="center" hiddenColumn="true"/>
					<ta:datagridItem id="aac049" key="首次参保年月" align="center" hiddenColumn="true"/>
					<ta:datagridItem id="aae041" key="开始年月" align="center" hiddenColumn="true"/>
					<ta:datagridItem id="aaz136" key="基数核定规则参数ID" align="center" collection="AAZ136"/>
					<ta:datagridItem id="yaz289" key="征缴规则类型ID" align="center" collection="YAZ289"/>
					<ta:datagridItem id="aac030" key="个人参保日期" align="center" dataAlign="center" hiddenColumn="true"/>
					<ta:datagridItem id="aac040" key="工资" align="center" hiddenColumn="true"/>
					<ta:datagridItem id="aaz159" key="人员参保关系ID" align="center" hiddenColumn="true"/>
				</ta:datagrid>
        	</ta:tab>
        	
        	<ta:tab id="tb_empInsurance" key="人员已参保信息">
				<ta:datagrid id="empIns" haveSn="true" forceFitColumns="true" snWidth="30" fit="true">
					<ta:datagridItem id="aab001" key="单位编号" align="center" width="90"/>
					<ta:datagridItem id="aae044" key="单位名称" align="center" width="180" showDetailed="true"/>
					<ta:datagridItem id="aae140" key="险种类型" showDetailed="true" align="center" width="180" collection="AAE140"/>
					<ta:datagridItem id="aac030" key="参保日期" align="center" dataAlign="center" width="100"/>
					<ta:datagridItem id="aae041" key="开始年月" align="center" width="70"/>
					<ta:datagridItem id="aae042" key="终止年月" align="center" width="70"/>
					<ta:datagridItem id="aac008" key="人员参保状态" align="center" collection="AAC008" width="100"/>
					<ta:datagridItem id="yac084" key="险种离退休标志" align="center" collection="YAC084" width="100"/>
					<ta:datagridItem id="yac030" key="在编人员标识" align="center" collection="YAC030" width="100"/>
					<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="right" maxChart="6"/>
					<ta:datagridItem id="jfz" key="缴费至" align="center" dataAlign="right" maxChart="4"/>
					<ta:datagridItem id="jfy" key="缴费月" align="center" dataAlign="right" maxChart="3"/>
					<ta:datagridItem id="dyxs" key="待遇信息" align="center" dataAlign="center" maxChart="8"/>
					<ta:datagridItem id="yab139" key="参保所属机构" align="center" width="100" collection="AAB301" showDetailed="true"/>
				</ta:datagrid>
			</ta:tab>
        	<ta:tab id="tab_caseInfo" key="事件流程记录">
			    <%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
			<ta:tab id="tab_error" key="错误原因">
			    <%@ include file="/yhsi3/commonJSP/errorList.jsp"%>
			</ta:tab>	
        </ta:tabs>    
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
		Base.focus("aab001");
		initializeSuggestFramework(1, '', 'aac001', 990, 200, 10,fn_queryAc01, 0, false);
	    initializeSuggestFramework(2, '', 'old_aab001', 900, 200, 7,fn_queryAb01, 0, false);
	    initializeSuggestFramework(3, '', 'new_aab001', 900, 200, 7,fn_queryAb01b, 0, false);
	    //隐藏控件
		Base.hideObj('tbs_insurance,tabs_insurance,tb_changeType,tb_resume,tab_caseInfo,fltUnit,fldSelectChange,tab_110,tab_120,tab_210,tab_310,tab_320,tab_330,tab_340,tab_350,tab_370,tab_410,tab_510,aae035,aae160,flt_resume,btn_resume,xzlx,tab_all');
	});
	
	function fn_setRyInfo(){
		Base.submit("fltPerson","changeInsuranceInfoAction!getPersonBaseInfo.do");
	}
	
	function callDwRPC(){
		sfwQueryUtil_newRPC(2,'getAb01String',{"dto['inputString']":Base.getValue('old_aab001')});
	}
 	function showDwRPC(){
    	Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,fn_setDwData,true);
    }
    
    function fn_setDwData(){
    	Base.submit("fltPerson,fltUnit","changeInsuranceInfoAction!getUnitBaseInfo.do");
    	Base.setValue("aab001", parent.getValue("aab001"));
    }
	
    function callDwRPC1(){
    	sfwQueryUtil(3,'getAab001',Base.getValue('new_aab001'));
    }
	
	//个人回调函数 ：查询单位信息和个人信息 和参保信息
	function fn_queryAc01(){
		if(g_Suggest!=""){
			Base.setValue("aac001",g_Suggest[2]);
			Base.submit("fltPerson","changeInsuranceInfoAction!getPersonBaseInfo.do");
			Base.setReadOnly('aac001');
   		}
	}
	
	//单位回调函数:查询单位信息
	function fn_queryAb01(){
		if(g_Suggest!=""){ 
			Base.setValue("old_aab001",g_Suggest[1]);
			Base.submit("fltPerson,fltUnit","changeInsuranceInfoAction!getUnitBaseInfo.do");
   		}
	}
	//单位回调函数:获取将要续保的单位基本信息 以及 单位参保情况对应人员新参保相关控制
	function fn_queryAb01b(){//cancelAae140List
		if(g_Suggest!=""){ 
			Base.hideObj('aae140_110,aae140_120,aae140_210,aae140_310,aae140_320,aae140_330,aae140_340,aae140_350,aae140_370,aae140_410,aae140_510');
			Base.setValue("new_aab001",g_Suggest[1]);
			var rows = Base.getGridData('ac20Grid');
			var param = {};
			param.cancelAae140List = Ta.util.obj2string(rows);
			Base.submit('fltPerson,fltUnit,flt_newUnit','changeInsuranceInfoAction!getNewUnitInfo.do',param,null,false,fnCheckBoxes,null);
   		}
	}
	
	//根据人员类型获取人员类别
	function setykc006(value,key){
	    Base.setValue('ykc006_'+key.substring(0,3),'');
	    Base.setEnable('ykc006_'+key.substring(0,3));
		Base.submit(null,myPath()+"/process/publicBusiness/comm/publicBusinessAction!setYkc006.do",{"dto['ykc005_']":key});
		
	}
	
	//选择控制
	function fnCheckBoxes(){
		var aae140Array = ['110','120','210','310','320','330','340', '370','410','510'];	
		var ck = false;
	    for(var i=0;i<aae140Array.length;i++){
		    var a = $('#aae140_'+aae140Array[i]).parent('div');
		    if(a.css('display') != "none"){
		    	ck = true;
	    	}
	    }
	    if(!ck){
	    	Base.hideObj('xzlx,tbs_insurance');
	    }else{
	    	Base.showObj('xzlx,tbs_insurance');
	    }
	}
	
	//多个单位  选择一个单位
	function fnSelectUnit(value,key){
		Base.setValue('old_aab001',Base.getValue('si_aab001'));
		Base.submit("fltPerson,fltUnit","changeInsuranceInfoAction!getUnitBaseInfo.do");
		Base.setReadOnly('si_aab001,old_aab001');
		Base.hideObj('si_aab001');
		Base.showObj('old_aab001');
	}
	
	//选择变更类型后控制界面显示以及一些查询
	function fnBglx(value,key){
		Base.showObj('tabs_insurance');
		if(key=='22'){//中断缴费
		    //已参保的信息
		    var empIns = Base.getGridData("empIns");
		    var isFail = true;
		    if(empIns.length==0){
		        Base.alert("没有获取到人员已参保的信息！","warn");
		        Base.activeTab("tb_empInsurance");
		        return;
		    }
		    for(var i = 0;i<empIns.length;i++){
		        var yac084 = empIns[0].yac084;//险种离退休标志
		        if("是"==yac084){
		            isFail = false;
		            
		        }
		    }
		    if(isFail==false){
		         Base.confirm("此人是退休人员，只能办理【基本医疗保险】【大额保险】的中断缴费？", function(yes,callback){
			        if(yes){
			            Base.setTabTitle('tb_changeType',value);
						var changeRows = Base.getGridData('changeGrid');
						Base.submit('changeType,fltPerson,fltUnit','changeInsuranceInfoAction!getChangeType.do');
						Base.showObj('tb_changeType');
						Base.activeTab('tb_changeType');
						Base.hideObj('tb_resume');
			        }
			    });
		    }else{
		        Base.setTabTitle('tb_changeType',value);
				var changeRows = Base.getGridData('changeGrid');
				Base.submit('changeType,fltPerson,fltUnit','changeInsuranceInfoAction!getChangeType.do');
				Base.showObj('tb_changeType');
				Base.activeTab('tb_changeType');
				Base.hideObj('tb_resume');
		    }
		}else if(key=='21'){
		    Base.confirm("因出国、死亡等原因确认终止缴费？", function(yes,callback){
		        if(yes){
		            Base.setTabTitle('tb_changeType',value);
					var changeRows = Base.getGridData('changeGrid');
					Base.submit('changeType,fltPerson,fltUnit','changeInsuranceInfoAction!getChangeType.do');
					Base.showObj('tb_changeType');
					Base.activeTab('tb_changeType');
					Base.hideObj('tb_resume');
		        }
		    });
		}else{
			var resumeRows = Base.getGridData('ac20Grid');
			if(resumeRows==''){
				Base.alert('该人员没有能办理恢复缴费业务的险种,但可以选择单位进行新参保！','warn');
				Base.hideObj('aae035,aae160');
			}else{
				Base.showObj('tab_all');
			}
			Base.showObj('tb_resume');
			Base.hideObj('tb_changeType');
			Base.activeTab('tb_resume');
			Base.activeTab('tab_insAll');
		}
	}
	
	//列表勾选函数
	function fnCheck(data,e){
	    var aac050 = Base.getValue("changeType");
	    var aae160 = Base.getValue("change_aae160");
	    //终止参保 死亡
	    if(aac050=="21"&&aae160=="6401"){
	        if (e.target.checked == undefined?e.target.firstChild.checked: e.target.checked) {
				//如果选中
				var aab001=data.aab001;
				Base.getObj("changeGrid").setCheckedRows([{"aab001":aab001}]); 
			}else{
			    var aab001=data.aab001;
				Base.getObj("changeGrid").cancelCheckedRowByData([{"aab001":aab001}]); 
			}
	    }
	}
	
	//回调渲染
	function fnSelect(tabid){
		if(tabid == 'tb_changeType'){
			var rows = Base.getGridData('changeGrid');
			var param = {};
			param.changeList = Ta.util.obj2string(rows);
			Base.submit('changeType','changeInsuranceInfoAction!setColor.do',param);
		}
	}
	
	//获取变更项所有数据
	function getChangeAllData(gridId){
		var rows = Base.getGridData(gridId);
		var aae140Str;
		for(var i=0;i<rows.length;i++){
			var aae140 = rows[i].aae140;
			if(typeof(aae140Str) == 'undefined'){
				aae140Str = aae140;
			}else{
				aae140Str = aae140Str + ',' + aae140;
			}
		}
		return aae140Str;
	}
	
	//颜色控制
	function fnColor(data){
		var aae140Str = getChangeAllData('changeInfoGrid');
		if(typeof(aae140Str) != 'undefined'){
			if (aae140Str.indexOf(data.aae140) >= 0) 
			return 'lightgray';
		}
	}
	
	//判断依赖绑定相关信息
	function fnCkBind(gridId){
		//判断是否存在绑定依赖险种信息
		var ckBind = false;
		var selectRows = Base.getGridSelectedRows(gridId);//获取勾选行数据
		var allRows = Base.getGridData(gridId);//获取所有数据
		var aae140Str;
		//判断选中数据中是否包含绑定依赖父级险种，也就是基本医疗和大病救助险种
		for(var i=0;i<selectRows.length;i++){
			var aae140 = selectRows[i].aae140;
			if((aae140=='310') || (aae140=='330')){
				ckBind = true;
			}
			if(typeof(aae140Str)=='undefined'){
				aae140Str = aae140;
			}else{
				aae140Str = aae140Str + ',' + aae140;
			}
		}
		//如果选择基本医疗或者大病救助险种，要进行其他险种相应控制
		if(ckBind){
			//遍历当前grid中是否包含其他存在绑定依赖的险种信息，默认选中
			for(var i=0;i<allRows.length;i++){
				var aae140 = allRows[i].aae140;
				if((aae140=='310') || (aae140=='320') || (aae140=='330') || (aae140=='370')){
					aae140Str = aae140Str + ',' + aae140;
				}
			}
		}
		return aae140Str;
	}
	
	//暂停缴费、终止缴费选择控制
	function fnCreateChange(){
		var obj = Base.getObj("changeGrid");
		//判断是否有选中信息
		var changeRows = Base.getGridSelectedRows('changeGrid');
		if(changeRows == ''){
			Base.alert('请先选择将要进行变更的险种信息，谢谢！','warn');
			return false;
		}
		//时间检验 
		if(!fnChangeTime('change')){
			return false;
		}
		//绑定依赖险种勾选
		var aae140Str = fnCkBind('changeGrid');
		//满足以上条件，在变更总览中生成数据信息 
		createData('change',aae140Str);
	}
	
	//恢复缴费选择控制
	function fnResumeChange(){
		var resumeRows = Base.getGridSelectedRows('ac20GridRight');//续保信息
		var aae140Array = ['110','120','210','310','320','330','340', '370','410','510'];
		var ckAae140is = false;
		var hadAae140Rows = Base.getGridData('changeInfoGrid');
		var ckAae140Str;
		var ckAllAae140Str;
		for(i=0;i<hadAae140Rows.length;i++){
			ckAae140Str = ckAae140Str + hadAae140Rows[i].aae140 + ',';
		}
		for(var i=0;i<aae140Array.length;i++){
			var ckis = Base.getObj('aae140_'+aae140Array[i]).checked;
			if(ckis){
				if(typeof(ckAae140Str)!='undefined'){
					if(ckAae140Str.indexOf(aae140Array[i])>=0){
						if(typeof(ckAllAae140Str)=='undefined'){
							ckAllAae140Str = '['+getAae140Name(aae140Array[i])+']';
						}else{
							ckAllAae140Str = ckAllAae140Str + '[' + getAae140Name(aae140Array[i]) +']';
						}
					}
				}
				ckAae140is = true;
			}
		}
		if(typeof(ckAllAae140Str)!='undefined'){
			Base.alert("变更总览里面已经存在：【<span style='color:#ff0000;'>"+ckAllAae140Str+"</span>】的信息，请勿重复添加，谢谢！",'warn');
			return false;
		}
		if(resumeRows == '' && !ckAae140is){
			Base.alert('没有勾选新增或恢复缴费的险种，请确认！','warn');
			return false;
		}
		//时间检验 
		if(!fnChangeTime('3')){
			return false;
		}
		if(resumeRows != ''){
			//绑定依赖险种勾选
			var allResumeStrs = getChangeAllData('ac20GridRight');
			var allChangeStrs = getChangeAllData('changeInfoGrid') + '';
			var selectResumeStrs;
			for(var i=0;i<resumeRows.length;i++){
				var resumeAae140 = resumeRows[i].aae140;
				if(typeof(selectResumeStrs) == 'undefined'){
					selectResumeStrs = resumeAae140;
				}else{
					selectResumeStrs = selectResumeStrs + ',' + resumeAae140;
				}
			}
			if(selectResumeStrs.indexOf('310')>=0 || selectResumeStrs.indexOf('330')>=0){
				if(allResumeStrs.indexOf('310')>=0 || allResumeStrs.indexOf('330')>=0){
					selectResumeStrs = selectResumeStrs + ',' + '310,330';
				}
			}
			if(selectResumeStrs.indexOf('320')>=0 || selectResumeStrs.indexOf('370')>=0){
				if(selectResumeStrs.indexOf('310')<0 && selectResumeStrs.indexOf('330')<0){
					if(allResumeStrs.indexOf('310')>=0 || allResumeStrs.indexOf('330')>=0){
						if(allChangeStrs.indexOf('310')<0){
							Base.alert('请先勾选['+getAae140Name('310')+']才能恢复其下级险种，谢谢！','warn');
							return false;
						}
					}
				}
			}
			var aae140Array = new Array();
			if(selectResumeStrs.indexOf(',') >= 0){
				aae140Array = selectResumeStrs.split(',');
			}else{
				aae140Array[0] = selectResumeStrs;
			}
			var resumeJson = '[';
			for(var i=0;i<aae140Array.length;i++){
				resumeJson = resumeJson + '{aae140:' + aae140Array[i] + '},';
			}
			resumeJson = resumeJson + ']';
			Base.setSelectRowsByData('ac20GridRight',resumeJson);
		}
		//判断是否重复添加恢复缴费信息
		if(!ckReAdd(resumeRows,'ac20GridRight')){
			return false;
		}
		createData('resume',null);
	}
	
	//判断死亡条件
	function checkDeath(key,value){
		if(value == "6401"){
			Base.submit('aac001','changeInsuranceInfoAction!checkDeath.do');
		}
		else{
			Base._setReadOnly("change_aae035",false);
		}
	}
	
	//判断是否存在重复添加
	function ckReAdd(rows,gridId){
		var hadData = Base.getGridData('changeInfoGrid');
		var hadDataStr;
		var hadAae140Str;
		for(i=0;i<hadData.length;i++){
			hadDataStr = hadDataStr + hadData[i].aae140 + ',';
		}
		for(i=0;i<rows.length;i++){
			var aae140 = rows[i].aae140;
			if(typeof(hadDataStr)!='undefined'){
				if(hadDataStr.indexOf(aae140)>=0){
					if(typeof(hadAae140Str)=='undefined'){
						hadAae140Str = '['+getAae140Name(aae140)+']';
					}else{
						hadAae140Str = hadAae140Str + '[' + getAae140Name(aae140) +']';
					}
					Base.cancelCheckedRowsByArray(gridId,"[{aae140:"+aae140+"}]");
				}
			}
		}
		if(typeof(hadAae140Str)!='undefined'){
			Base.alert("变更总览里面已经存在：【<span style='color:#ff0000;'>"+hadAae140Str+"</span>】的信息，请勿重复添加，谢谢！",'warn');
			return false;
		}
		return true;
	}
	
	//生成变更总览信息
	function createData(id,aae140Strs){
		//加入暂停缴费、终止缴费相关信息
		if(id == 'change'){
			var bglx = Base.getValue('changeType');
			if(bglx == '21'){
				bglx = '3';
			}else{
				bglx = '1';
			}
			var changeRows = Base.getGridData('changeGrid');
			var changeStr = getChangeAllData('changeInfoGrid') + "";
			var allChangeRows = Base.getGridData('changeInfoGrid');
			if(changeRows!=''){
				var changeLen = changeRows.length;
				var change_aae035 = Base.getValue('change_aae035');
				if(change_aae035==''){
					Base.alert('变更时间不能为空,请确认!','warn');
					return false;
				}
				var change_aae160 = Base.getValue('change_aae160');
				if(change_aae160==''){
					Base.alert('变更原因不能为空,请确认!','warn');
					return false;
				}
				var change_aae013 = Base.getValue('change_aae013');//备注
				var aae140NameStr;
				for(i=0;i<changeLen;i++){
					var aae140 = changeRows[i].aae140;
					if(aae140Strs.indexOf(aae140) >= 0){
						if(changeStr.indexOf(aae140) < 0){
							var totalRows = {};
							totalRows.bglx = bglx;
							totalRows.aab001 = changeRows[i].aab001;//单位编号
							totalRows.aae044 = changeRows[i].aae044;//单位名称
							totalRows.aac001 = changeRows[i].aac001;//人员ID
							totalRows.aac003 = changeRows[i].aac003;//姓名
							totalRows.aae140 = aae140;//险种类型
							totalRows.ykc005 = changeRows[i].ykc005;//特殊人员类型
							totalRows.ykc006 = changeRows[i].ykc006;//特殊人员类别
							totalRows.aae035 = change_aae035;//时间
							totalRows.aae160 = change_aae160;//原因
							totalRows.aae013 = change_aae013;//备注
							Base.addGridRowDown("changeInfoGrid", totalRows);
						}else{
							//如果先选择子险种，后选择父险种，则把先选的子险种设置为和父险种同种变更类型
							if(aae140Strs.indexOf('310')>=0 || aae140Strs.indexOf('330')>=0){
								if(aae140 == '320' || aae140 == '370'){
									if(bglx == '3'){
										for(var j=0;j<allChangeRows.length;j++){
											var aae140Change = allChangeRows[j].aae140;
												if(aae140Change == '320' || aae140Change == '370'){
													allChangeRows[j].bglx = '3';
												}
										}
									}
								}
							}
							Base.cancelCheckedRowsByArray("changeGrid","[{aae140:"+aae140+"}]");
							var aae140Name = '[' + getAae140Name(aae140) + ']';
							if(typeof(aae140NameStr) == 'undefined'){
								aae140NameStr = aae140Name;
							}else{
								aae140NameStr = aae140NameStr + aae140Name;
							}
						}
					}
				}
				Base.refreshGrid("changeInfoGrid");
				if(typeof(aae140NameStr) != 'undefined'){
					Base.alert('请勿重复添加以下险种：'+aae140NameStr+'谢谢！','warn');
					Base.activeTab('tb_changeInfo');
					return;
				}
			}
		}
		
		//加入恢复缴费相关信息 
		if(id == 'resume'){
			var resumeRows = Base.getGridSelectedRows('ac20GridRight');//勾选的恢复缴费相关信息
			if(resumeRows!=''){
				var resumeLen = resumeRows.length;
				var resume_aab001 = Base.getValue('new_aab001');//单位编号
				if(resume_aab001==''){
					Base.alert('新参保单位不能为空,请确认!','warn');
					return false;
				}
				var resume_aae044 = Base.getValue('new_aae044');//单位名称 
				var resume_aac001 = Base.getValue('aac001');//人员编号
				var resume_aac003 = Base.getValue('aac003');//人员姓名 
				var resume_aae013 = Base.getValue('aae013');//备注 
				var resume_aab033 = Base.getValue('aab033');
				var resume_aac013 = Base.getValue('aac013');
				if(resume_aac013==''){
					Base.alert('用工形式不能为空,请确认!','warn');
					return false;
				}
				var resume_aac066 = Base.getValue('aac066');
				if(resume_aac066==''){
					Base.alert('参保身份不能为空,请确认!','warn');
					return false;
				}
				var resume_aac040 = Base.getValue('aac040');
				if(resume_aac040==''){
					Base.alert('工资不能为空,请确认!','warn');
					return false;
				}
				var resume_aae035 = Base.getValue('aae035');
				if(resume_aae035==''){
					Base.alert('恢复缴费日期不能为空,请确认!','warn');
					return false;
				}
				var resume_aae160 = Base.getValue('aae160');
				if(resume_aae160==''){
					Base.alert('恢复缴费原因不能为空,请确认!','warn');
					return false;
				}
				var resume_ajc050 = Base.getValue('ajc050');
				if(resume_ajc050==''){
					Base.alert('本次参工日期不能为空,请确认!','warn');
					return false;
				} 
				for(i=0;i<resumeLen;i++){
					var resume_aaz136 = Base.getValue('aaz136_'+resumeRows[i].aae140);//基数核定规则参数ID
					if(resume_aaz136==''){
						Base.alert('基数核定规则不能为空,请确认!','warn');
						Base.activeTab('tab_'+resumeRows[i].aae140);
						return false;
					}
					var resume_yaz289 = Base.getValue('yaz289_'+resumeRows[i].aae140);//征缴规则参数ID
					if(resume_yaz289==''){
						Base.alert('征缴规则不能为空,请确认!','warn');
						Base.activeTab('tab_'+resumeRows[i].aae140);
						return false;
					}
				}
				for(i=0;i<resumeLen;i++){
					var totalRows = {};
					totalRows.bglx = '2';
					totalRows.aab001 = resume_aab001;//单位编号
					totalRows.aae044 = resume_aae044;//单位名称
					totalRows.aac001 = resume_aac001;//人员ID
					totalRows.aac003 = resume_aac003;//姓名
					totalRows.aae140 = resumeRows[i].aae140;//险种类型
					totalRows.aae035 = resume_aae035;//续保日期
					totalRows.aae160 = resume_aae160;//续保原因
					totalRows.aae013 = resume_aae013;//备注
					totalRows.aab033 = resume_aab033;//征收方式
					totalRows.aac013 = resume_aac013;//用工形式
					totalRows.aac066 = resume_aac066;//参保身份
					totalRows.ajc050 = resume_ajc050;//本次参工日期
					totalRows.aac049 = resumeRows[i].aac049;//首次参保年月
					var resume_aaz136;
					if("310"==resumeRows[i].aae140&&("310102"==resumeRows[i].ykc006||"310202"==resumeRows[i].ykc006)){
					    resume_aaz136 = resumeRows[i].aaz136;
					}else if("310"==resumeRows[i].aae140&&("31006"==resumeRows[i].aaz136||"31009"==resumeRows[i].aaz136)){
					    resume_aaz136 = resumeRows[i].aaz136;
					}else{
					    resume_aaz136 = Base.getValue('aaz136_'+resumeRows[i].aae140);//基数核定规则参数ID
					}
					totalRows.aaz136 = resume_aaz136;
					var resume_yaz289;
					if("310"==resumeRows[i].aae140&&("310102"==resumeRows[i].ykc006||"310202"==resumeRows[i].ykc006)){
					   resume_yaz289 = resumeRows[i].yaz289;
					}else if("310"==resumeRows[i].aae140&&("31004"==resumeRows[i].yaz289||"31005"==resumeRows[i].yaz289||"31006"==resumeRows[i].yaz289)){
					   resume_yaz289 = resumeRows[i].yaz289;
					}else{
					   resume_yaz289 = Base.getValue('yaz289_'+resumeRows[i].aae140);//征缴规则参数ID
					}
					totalRows.yaz289 = resume_yaz289;
					totalRows.aac030 = resume_aae035;//个人参保日期
					totalRows.aac040 = resume_aac040;//工资
					totalRows.aaz159 = resumeRows[i].aaz159;//人员参保关系ID
					if("310"==resumeRows[i].aae140&&"2"==Base.getValue("akc022")&&"3101"==resumeRows[i].ykc005){
					    totalRows.ykc005 = "3102";
					    if(resumeRows[i].ykc006!=''){
					        totalRows.ykc006 = "3102"+resumeRows[i].ykc006.substr(4,2);
					    }
					}else if("310"==resumeRows[i].aae140&&"1"==Base.getValue("akc022")&&"3102"==resumeRows[i].ykc005){
					    totalRows.ykc005 = "3101";
					    if(resumeRows[i].ykc006!=''){
					        totalRows.ykc006 = "3101"+resumeRows[i].ykc006.substr(4,2);
					    }
					}else{
					    totalRows.ykc005 = resumeRows[i].ykc005;
					    totalRows.ykc006 = resumeRows[i].ykc006;
					}
					
					Base.addGridRowDown("changeInfoGrid", totalRows);
				}
			}
			if(!createNewAae140()){
				return false;			
			}
		}
			Base.activeTab('tb_changeInfo');
	}
	
	//险种新增
	function createNewAae140(){
		//加入险种新增相关信息 
			var aae140Array = new Array();
			aae140Array = ['110','120','210','310','320','330','340', '370','410','510'];
			var ckAae140Len = aae140Array.length;
			var ckAae140 = false;
			for(var i=0;i<ckAae140Len;i++){
				var ckis = Base.getObj('aae140_'+aae140Array[i]).checked;
				if(ckis){
					ckAae140 = true;
				}
			}
			//判断是否有新参保险种信息
			if(ckAae140){
				var resume_aab001 = Base.getValue('new_aab001');//单位编号
				if(resume_aab001==''){
					Base.alert('恢复缴费单位不能为空,请确认!','warn');
					return false;
				}
				var resume_aae044 = Base.getValue('new_aae044');
				var resume_aac001 = Base.getValue('aac001');
				var resume_aac003 = Base.getValue('aac003');
				var resume_aae013 = Base.getValue('aae013'); 
				var resume_aab033 = Base.getValue('aab033');
				var resume_aac013 = Base.getValue('aac013');
				if(resume_aac013==''){
					Base.alert('用工形式不能为空,请确认!','warn');
					return false;
				}
				var resume_aac066 = Base.getValue('aac066'); 
				if(resume_aac066==''){
					Base.alert('参保身份不能为空,请确认!','warn');
					return false;
				}
				var resume_aac040 = Base.getValue('aac040');
				if(resume_aac040==''){
					Base.alert('工资不能为空,请确认!','warn');
					return false;
				}
				var resume_ajc050 = Base.getValue('ajc050');
				if(resume_ajc050==''){
					Base.alert('本次参工日期不能为空,请确认!','warn');
					return false;
				} 
				var resume_aac049 = Base.getValue('aac049');
				for(i=0;i<ckAae140Len;i++){
					var ck = Base.getObj('aae140_'+aae140Array[i]).checked;
					if(ck){
						var new_aae140 = aae140Array[i];
						var resume_ykc005 = Base.getValue('ykc005_'+new_aae140);//特殊人员类型
						if(resume_ykc005==''){
							Base.alert('['+getAae140Name(new_aae140)+']特殊人员类型不能为空,请确认!','warn');
							Base.activeTab('tab_'+new_aae140);
							return false;
						}
						var resume_ykc006 = Base.getValue('ykc006_'+new_aae140);//特殊人员类别
						if(resume_ykc006==''){
							Base.alert('['+getAae140Name(new_aae140)+']特殊人员类别不能为空,请确认!','warn');
							Base.activeTab('tab_'+new_aae140);
							return false;
						}
						var resume_aaz136 = Base.getValue('aaz136_'+new_aae140);//基数核定规则参数ID
						if(resume_aaz136==''){
							Base.alert('['+getAae140Name(new_aae140)+']基数核定规则不能为空,请确认!','warn');
							Base.activeTab('tab_'+new_aae140);
							return false;
						}
						var resume_yaz289 = Base.getValue('yaz289_'+new_aae140);//征缴规则参数ID
						if(resume_yaz289==''){
							Base.alert('['+getAae140Name(new_aae140)+']征缴规则不能为空,请确认!','warn');
							Base.activeTab('tab_'+new_aae140);
							return false;
						}
					}
				}
				for(i=0;i<ckAae140Len;i++){
					var ck = Base.getObj('aae140_'+aae140Array[i]).checked;
					if(ck){
						var totalRows = {};
						var new_aae140 = aae140Array[i];//新参保险种类型
						var resume_aae030 = Base.getValue('aac030_'+new_aae140); 
						if(resume_aae030==''){
							Base.alert('['+getAae140Name(new_aae140)+']个人参保日期不能为空,请确认!','warn');
							return false;
						}
						totalRows.bglx = '4';//新参保标志
						totalRows.aab001 = resume_aab001;//单位编号
						totalRows.aae044 = resume_aae044;//单位名称
						totalRows.aac001 = resume_aac001;//人员ID
						totalRows.aac003 = resume_aac003;//姓名
						totalRows.aae140 = new_aae140;//险种类型
						totalRows.aae035 = resume_aae030;//变更日期
						totalRows.aae013 = resume_aae013;//备注
						totalRows.aab033 = resume_aab033;//征收方式
						totalRows.aac013 = resume_aac013;//用工形式
						totalRows.aac066 = resume_aac066;//参保身份
						totalRows.ajc050 = resume_ajc050;//本次参工日期
						totalRows.aac049 = resume_aac049;//首次参保年月
						var resume_aaz136 = Base.getValue('aaz136_'+new_aae140);//基数核定规则参数ID
						totalRows.aaz136 = resume_aaz136;
						var resume_yaz289 = Base.getValue('yaz289_'+new_aae140);//征缴规则参数ID
						totalRows.ykc005 = Base.getValue("ykc005_"+new_aae140);//特殊人员类型
						totalRows.ykc006 = Base.getValue("ykc006_"+new_aae140);//特殊人员类别
						totalRows.yaz289 = resume_yaz289;
						totalRows.aac030 = resume_aae030;//个人参保日期
						totalRows.aac040 = resume_aac040;//工资
						Base.addGridRowDown("changeInfoGrid", totalRows);
					}
				}
			}
			return true;
	}
	
	//删除已经生成的变更数据 
	function fnAllChange(){
		var getSelectRows = Base.getGridSelectedRows("changeInfoGrid");//获取选中行数据
		if(getSelectRows == ''){
			Base.alert('请先勾选要进行删除的数据，谢谢！','warn');
			return false;
		}else{
			var allSelectStrs;
			for(var i =0;i<getSelectRows.length;i++){
				var aae140 = getSelectRows[i].aae140;
				if(typeof(allSelectStrs) == 'undefined'){
					allSelectStrs = aae140;
				}else{
					allSelectStrs = allSelectStrs + ',' + aae140;
				}
			}
			//判断依赖绑定一并删除 
			var allChangeRows = Base.getGridData('changeInfoGrid');
			var allChangeStrs = getChangeAllData('changeInfoGrid');
			if(allSelectStrs.indexOf('310')>=0 && allSelectStrs.indexOf('330')<0){
				for(var i=0;i<allChangeRows.length;i++){
					var aae140 = allChangeRows[i].aae140;
					if(aae140 == '330'){
						Base.alert("请将和["+getAae140Name('310')+"]存在绑定关系的[<span style='color:#ff0000;'>"+getAae140Name('330')+'</span>]一并勾选！','warn');
						return false;
					}
				}
			}
			if(allSelectStrs.indexOf('310')<0 && allSelectStrs.indexOf('330')>=0){
				for(var i=0;i<allChangeRows.length;i++){
					var aae140 = allChangeRows[i].aae140;
					if(aae140 == '310'){
						Base.alert("请将和["+getAae140Name('330')+"]存在绑定关系的[<span style='color:#ff0000;'>"+getAae140Name('310')+'</span>]一并勾选！','warn');
						return false;
					}
				}
			}
			if(allSelectStrs.indexOf('320')>=0 || allSelectStrs.indexOf('370')>=0){
				if(allSelectStrs.indexOf('310')<0 && allSelectStrs.indexOf('330')<0){
					for(var i=0;i<allChangeRows.length;i++){
						var aae140 = allChangeRows[i].aae140;
						var bglx = allChangeRows[i].bglx;
						if(bglx=='1' || bglx=='3'){
							if(aae140 == '310' || aae140 == '330'){
								Base.alert("请一并删除[<span style='color:#ff0000;'>"+getAae140Name(aae140)+'</span>]！','warn');
								return false;
							}
						}
					}
				}
			}
			if(allSelectStrs.indexOf('310')>=0 || allSelectStrs.indexOf('330')>=0){
				for(var i=0;i<allChangeRows.length;i++){
					var aae140 = allChangeRows[i].aae140;
					var bglx = allChangeRows[i].bglx;
					if(bglx=='2' && (aae140=='310' || aae140=='330')){
						for(var j=0;j<allChangeRows.length;j++){
							var aae140 = allChangeRows[j].aae140;
							var bglx = allChangeRows[j].bglx;
							if(bglx == '2'){
								if((aae140 == '320' && allSelectStrs.indexOf('320')<0) || (aae140 == '370' && allSelectStrs.indexOf('370')<0)){
									Base.alert("请一并删除恢复缴费类型中[<span style='color:#ff0000;'>"+getAae140Name(aae140)+'</span>]！','warn');
									return false;
								}
							}
						}
					}
					if(bglx=='4' && (aae140=='310' || aae140=='330')){
						for(var j=0;j<allChangeRows.length;j++){
							var aae140 = allChangeRows[j].aae140;
							var bglx = allChangeRows[j].bglx;
							if(bglx == '4'){
								if((aae140 == '320' && allSelectStrs.indexOf('320')<0) || (aae140 == '370' && allSelectStrs.indexOf('370')<0)){
									Base.alert("请一并删除险种新增类型中[<span style='color:#ff0000;'>"+getAae140Name(aae140)+'</span>]！','warn');
									return false;
								}
							}
						}
					}
				}
			}
			Base.deleteGridSelectedRows("changeInfoGrid");//删除选中行的数据
		}
	}
	
	
	//时间检查 ,参加工作时间 <= 首次参保年月 <= 本次参加工作日期 <= 个人参保年月 【】
	function fnTimeCheck(timeId){
		//参加工作时间
		var aac007 = "";
		//首次参保年月
		var aac049 = Base.getValue("aac049");
		//本次参加工作日期
		var ajc050 = Base.getValue("ajc050");
		//续保日期
		var aae035 = Base.getValue("aae035");
		//个人参保日期
		var aac030;
		if(timeId.indexOf("aac030") >= 0){
			aac030 = Base.getValue(timeId);
		}
		//个人参保日期判断
		if((timeId.indexOf("aac030") >= 0) && (aac030 != '') ){
			if(aac007 != ""){
				if(aac030 < aac007){
					Base.alert("个人参保日期【<span style='color:#ff0000;'>"+aac030+"</span>】不能小于参加工作日期【<span style='color:#ff0000;'>"+aac007+"</span>】","warn");
					Base.setValue(timeId,'');
					return false;
				}
			}	
			if(aac049 != ""){
				if(aac030 < aac049){
					Base.alert("个人参保日期【<span style='color:#ff0000;'>"+aac030+"</span>】不能小于首次参保日期【<span style='color:#ff0000;'>"+aac049+"</span>】","warn");
					Base.setValue(timeId,'');
					return false;
				}
			}
			if(ajc050 != ""){
				if(aac030 < ajc050){
					Base.alert("个人参保日期【<span style='color:#ff0000;'>"+aac030+"</span>】不能小于本次参加工作日期【<span style='color:#ff0000;'>"+ajc050+"</span>】","warn");
					Base.setValue(timeId,'');
					return false;
				}
			}
		}
		//首次参保年月判断
		if((timeId == "aac049") && (aac049 != '')){
			if(aac007 != ""){
				if(aac049 < aac007){
					Base.alert("首次参保年月【<span style='color:#ff0000;'>"+aac049+"</span>】不能小于参加工作日期【<span style='color:#ff0000;'>"+aac007+"</span>】","warn");
					Base.setValue('aac049','');
					return false;
				}
			}
			if(ajc050 != ""){
				if(aac049 > ajc050){
					Base.alert("首次参保年月【<span style='color:#ff0000;'>"+aac049+"</span>】不能大于本次参加工作日期【<span style='color:#ff0000;'>"+ajc050+"</span>】","warn");
					Base.setValue('aac049','');
					return false;
				}
			}
			var aae140Array = ['110','120','210','310','320','330','340', '370','410','510'];
			for(var i=0;i<aae140Array.length;i++){
				var aae140 = aae140Array[i];
				var aac030_aae140 = Base.getValue('aac030_'+aae140);//个人参保日期
				var aae035_aae140 = Base.getValue('aae035_'+aae140);//续保日期
				if((aac030_aae140 != '') && (aac049 > aac030_aae140)){
					Base.alert("首次参保年月【<span style='color:#ff0000;'>"+aac049+"</span>】不能大于["+getAae140Name(aae140)+"]个人参保日期【<span style='color:#ff0000;'>"+aac030_aae140+"</span>】","warn");
					Base.setValue('aac049','');
					return false;
				}
				if((aae035_aae140 != '') && (ajc050 > aae035_aae140)){
					Base.alert("本次参加工作日期【<span style='color:#ff0000;'>"+ajc050+"</span>】不能大于["+getAae140Name(aae140)+"]续保日期【<span style='color:#ff0000;'>"+aae035_aae140+"</span>】","warn");
					Base.setValue('ajc050','');
					return false;
				}
			}
			return true;
		}
		//本次参加工作日期判断
		if((timeId == "ajc050") && (ajc050 !== '')){
			if(aac007 != ""){
				if(ajc050 < aac007){
					Base.alert("本次参加工作日期【<span style='color:#ff0000;'>"+ajc050+"</span>】不能小于参加工作日期【<span style='color:#ff0000;'>"+aac007+"</span>】","warn");
					Base.setValue('ajc050','');
					return false;
				}
			}
			if(aac049 != ""){
				if(ajc050 < aac049){
					Base.alert("本次参加工作日期【<span style='color:#ff0000;'>"+ajc050+"</span>】不能小于首次参保日期【<span style='color:#ff0000;'>"+aac049+"</span>】","warn");
					Base.setValue('ajc050','');
					return false;
				}
			}
			var aae140Array = ['110','120','210','310','320','330','340', '370','410','510'];
			for(var i=0;i<aae140Array.length;i++){
				var aae140 = aae140Array[i];
				var aac030_aae140 = Base.getValue('aac030_'+aae140);//个人参保日期
				var aae035_aae140 = Base.getValue('aae035_'+aae140);//续保日期
				if((aac030_aae140 != '') && (ajc050 > aac030_aae140)){
					Base.alert("本次参加工作日期【<span style='color:#ff0000;'>"+ajc050+"</span>】不能大于["+getAae140Name(aae140)+"]个人参保日期【<span style='color:#ff0000;'>"+aac030_aae140+"</span>】","warn");
					Base.setValue('ajc050','');
					return false;
				}
				if((aae035_aae140 != '') && (ajc050 > aae035_aae140)){
					Base.alert("本次参加工作日期【<span style='color:#ff0000;'>"+ajc050+"</span>】不能大于["+getAae140Name(aae140)+"]续保日期【<span style='color:#ff0000;'>"+aae035_aae140+"</span>】","warn");
					Base.setValue('ajc050','');
					return false;
				}
			}
		}
	}
	
	//续保控制                                                                                                                                                                                                                                                                                                                                                                   
	function fnSelectChange(rowsData,n){
		var rowsLength = rowsData.length;
		var allRows = Base.getGridData('ac20GridRight');
		var allSize = allRows.length;
		var selectHfAae140;
		for(var i=0;i<rowsLength;i++){
			var aae140 = rowsData[i].aae140;
			if(typeof(selectHfAae140) == 'undefined'){
				selectHfAae140 = aae140;
			}else{
				selectHfAae140 = selectHfAae140 + ',' +aae140;
			}
		}
		if(rowsLength == allSize){//全选
			Base.showObj('tbs_insurance,aae035,aae160');
			for(i=0;i<allSize;i++){
				var aae140 = allRows[i].aae140;
				Base.showObj('tab_'+aae140);
				Base.hideObj('aac030_'+aae140);
			}
		}else{//选部分
			Base.showObj('tbs_insurance,aae035,aae160');
			for(var i=0;i<allRows.length;i++){
				var aae140 = allRows[i].aae140;
				if(typeof(selectHfAae140) != 'undefined' && selectHfAae140.indexOf(aae140) >= 0){
					Base.showObj('tab_'+aae140);
					Base.hideObj('aac030_'+aae140);
				}else{
					if(!Base.getObj('aae140_'+aae140).checked){
						Base.hideObj('tab_'+aae140);
					}
				}
			}
		}
	}
	
	//停保、退保时间判断   
	function fnChangeTime(id){
		var lastDay = Base.getValue('lastDay');
		var changeType = Base.getValue('changeType');
		var lastDay1 = Base.getValue('lastDay1');
		if(id=='change'){
			var changeAae035 = Base.getValue('change_aae035');
			if(changeAae035 == ''){
				Base.alert('请先输入变更时间，谢谢！','warn');
				return false;
			}
			var changeAae035Num = changeAae035.replaceAll('-','');
			var changeAae140List =  Base.getGridSelectedRows('changeGrid');
			for(i=0;i<changeAae140List.length;i++){
				var aac030 = changeAae140List[i].aac030.replaceAll('-','');
				var aae140 = changeAae140List[i].aae140;
				if(aac030 > changeAae035Num){
					Base.alert("变更时间【<span style='color:#ff0000;'>"+changeAae035+"</span>】不能小于 ["+getAae140Name(aae140)+"] 参保时间【<span style='color:#ff0000;'>"+changeAae140List[i].aac030+"</span>】","warn");
					Base.setValue('change_aae035','');
					return false;
				}
				var aae041 = changeAae140List[i].aae041;
				if(aae041 > changeAae035Num.substring(0,6)){
					Base.alert("变更时间【<span style='color:#ff0000;'>"+changeAae035+"</span>】不能小于 ["+getAae140Name(aae140)+"] 开始年月【<span style='color:#ff0000;'>"+aae041+"</span>】","warn");
					Base.setValue("change_aae035","");
					return false;
				}
			}
			if(changeType == '22'){
				if(changeAae035 > lastDay1){
			    	Base.alert("中断变更时间【<span style='color:#ff0000;'>"+changeAae035+"</span>】不能超过下月！","warn");
			    	Base.setValue('change_aae035','');
			    	return false ;
		    	}
			}else{
				if(changeAae035 > lastDay){
			    	Base.alert("变更时间【<span style='color:#ff0000;'>"+changeAae035+"</span>】不能超过当月！","warn");
			    	Base.setValue('change_aae035','');
			    	return false ;
		    	}
	    	}
		}
		if(id=='3'){
			var selectRows = Base.getGridSelectedRows('ac20GridRight');
			if(selectRows != ''){
				var getAae035 = Base.getValue('aae035');
				if(getAae035 == ''){
					Base.alert('请先输入恢复缴费时间，谢谢！','warn');
					return false;
				}
				var aae035 = parseInt(getAae035.replace('-','').substring(0,6));
				var aae042Max = 0;
				for(var i=0;i<selectRows.length;i++){
					var aae042 = parseInt(selectRows[i].aae042);
					if(aae042 > aae042Max){
						aae042Max = aae042;
					}
				}
				if(aae035 <= aae042Max){
					Base.alert("恢复缴费时间【<span style='color:#ff0000;'>"+getAae035+"</span>】不能小于等于险种终止年月【<span style='color:#ff0000;'>"+aae042Max+"</span>】","warn");
					Base.setValue('aae035','');
					return false;
				}
				var ajc050 = Base.getValue('ajc050');
				if(ajc050 > getAae035){
					Base.alert("恢复缴费时间【<span style='color:#ff0000;'>"+getAae035+"</span>】不能小于本次参加工作日期【<span style='color:#ff0000;'>"+ajc050+"</span>】","warn");
					Base.setValue('aae035','');
					return false;
				}
			}
		}
		return true;
	}
	
	//保存
	function submitData(){
		var getChangeRows = Base.getGridData('changeInfoGrid');
		if(getChangeRows==''){
			Base.alert('变更总览中没有添加任何险种,不能进行保存操作,谢谢!','warn');
			return false;
		}
		if(getChangeRows!=''){ 
			var param = {};
			param.totalChangeList = Ta.util.obj2string(getChangeRows);
			Base.submit('form1','changeInsuranceInfoAction!toSave.do',param);
		}
	}
	
	//险种判断 
	function getAae140Name(aae140){
		if(aae140 == '110'){
			return '城镇企业职工基本养老保险';
		}else if(aae140 == '120'){
			return '机关养老保险';
		}else if(aae140 == '210'){
			return '失业保险';
		}else if(aae140 == '310'){
			return '城镇职工基本医疗保险';
		}else if(aae140 == '320'){
			return '公务员医疗补助';
		}else if(aae140 == '330'){
			return '大额医疗费用补助';
		}else if(aae140 == '340'){
			return '离休人员医疗保障';
		}else if(aae140 == '350'){
			return '二乙医疗';
		}else if(aae140 == '370'){
			return '企业补充医疗';
		}else if(aae140 == '410'){
			return '工伤保险';
		}else if(aae140 == '510'){
			return '生育保险';
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
