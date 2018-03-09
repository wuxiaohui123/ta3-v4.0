<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TreatmentRecalculation</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:buttonLayout align="center" span="3">
			<ta:button id="btnSave" icon="xui-icon-spotSave" hotKey="ctrl+S" key="保存[S]" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印基本养老金核定表" onClick="print()" asToolBarItem="true" />
			<ta:button id="printBtn1" icon="xui-icon-spotPrint" key="打印养老金历年调整表" onClick="print1()" asToolBarItem="true" />
			<ta:button id="printBtn2" icon="xui-icon-spotPrint" key="打印调整基本养老金申报表" onClick="print2()" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false" />
		</ta:buttonLayout>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:tabs fit="true">
			<ta:tab id="txxx" key="退休信息" cssStyle="overflow:auto;" selected="true">
				<ta:panel id="fld_emp" cols="3" key="基本信息">
					<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
					<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
					<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
					<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
					<ta:date id="aac007" key="参加工作时间" labelWidth="130" readOnly="true" />
					<ta:date id="aac049" key="养老参保日期" labelWidth="130" readOnly="true" display="false" />
					<ta:selectInput id="aac009" key="户口性质" labelWidth="130" collection="aac009" readOnly="true" display="false" />
					<ta:selectInput id="aac012" key="个人身份" labelWidth="130" collection="aac012" readOnly="true" />
					<ta:selectInput id="aac013" key="用工形式" labelWidth="130" collection="aac013" readOnly="true" />
					<ta:selectInput id="aac011" key="学历" labelWidth="130" collection="aac011" readOnly="true" display="true" />
					<ta:selectInput id="aac017" key="婚姻状况" labelWidth="130" collection="aac017" readOnly="true" display="false" />
					<ta:text id="aac010" key="户口所在地址" labelWidth="130" readOnly="true" />
					<ta:selectInput id="aac008" key="人员状态" labelWidth="130" collection="aac008" readOnly="true" display="false" />
					<ta:text id="aae005_1" key="联系电话" labelWidth="130" readOnly="true" />
					<ta:text id="aae007_1" key="邮政编码" labelWidth="130" readOnly="true" />
					<ta:selectInput id="yab139" key="参保所属机构" labelWidth="130" collection="yab003" readOnly="true" display="false" />
					<ta:text id="aae006_1" key="地址" labelWidth="130" readOnly="true" span="2" />
					<ta:text id="yab003" key="经办机构ID" readOnly="true" display="false" />
					<ta:text id="aaz157" key="参保明细ID" display="false" />
					<ta:text id="aaz159" key="参保关系ID" display="false" />
				</ta:panel>
				<ta:panel id="rytxxx" cols="3" key="人员退休信息" cssStyle="overflow:auto;">
					<%-- 打印参数--%>
					<ta:text id="aaz170" key="人员待遇核定事件ID(本次待遇核定事件ID)" readOnly="true" display="false" labelWidth="130" />
					<ta:text id="aaz257" key="享受定期待遇人员ID(重算前，实际前后是一个值)" readOnly="true" display="false" labelWidth="130" />
					<%-- 打印参数--%>
					<ta:text id="aab071" key="退休申报单位ID" display="false" readOnly="true" />
					<ta:text id="aab999_1" key="退休申报单位编码" labelWidth="130" display="true" readOnly="true" />
					<ta:text id="aae044_1" key="退休申报单位名称" labelWidth="130" readOnly="true" span="2" />
					<ta:date id="yac516" key="档案出生日期" labelWidth="130" showSelectPanel="false" readOnly="true" required="true" />
					<ta:selectInput id="aac082" key="离退休登记类型" labelWidth="130" collection="aac082" required="true" readOnly="true" display="false" />
					<ta:selectInput id="aic161" key="离退休类别" labelWidth="130" collection="aic161" required="true" readOnly="true" />
					<ta:date id="aic162" key="离退休日期" labelWidth="130" showSelectPanel="true" readOnly="true" required="true" />
					<ta:date id="aae210" key="待遇享受开始年月" labelWidth="130" issue="true" showSelectPanel="true" readOnly="true" required="true" onChange="fn_checkAae210()" />
					<ta:date id="aae211" key="待遇核定年月" labelWidth="130" issue="true" showSelectPanel="true" readOnly="true" />
					<ta:date id="aae041" key="缴费开始年月" labelWidth="130" issue="true" showSelectPanel="true" readOnly="true" />
					<ta:date id="aae042" key="缴费终止年月" labelWidth="130" issue="true" showSelectPanel="true" readOnly="true" />
					<ta:number id="aae200" key="视同缴费月数" labelWidth="130" readOnly="true" max="999" min="0" required="true" alignLeft="true" />
					<ta:number id="aae201" key="实际缴费月数" labelWidth="130" readOnly="true" max="999" min="0" required="true" alignLeft="true" />
					<ta:number id="yic206" key="提前退休月数" labelWidth="130" readOnly="false" max="999" min="0" required="true" alignLeft="true" />
					<ta:number id="aae204" key="特殊工种折算月数" labelWidth="130" readOnly="true" max="999" min="0" alignLeft="true" />
					<ta:selectInput id="aac014" key="专业技术职务等级" labelWidth="130" collection="aac014" readOnly="true" />
					<ta:selectInput id="aac015" key="国家职业资格等级" labelWidth="130" collection="aac015" readOnly="true" />
					<ta:selectInput id="aac020" key="行政职务(级别)" labelWidth="130" collection="aac020" readOnly="true" />
					<ta:selectInput id="aac081" key="建国前老工人标志" labelWidth="130" collection="aac081" readOnly="true" />
					<ta:selectInput id="aac085" key="原工商业者标志" labelWidth="130" collection="aac085" readOnly="true" />
					<ta:date id="aac055" key="参加革命工作日期" labelWidth="130" showSelectPanel="true" readOnly="true" />
					<ta:selectInput id="aac064" key="退役军人类别" labelWidth="130" collection="aac064" readOnly="true" />
					<ta:selectInput id="aac065" key="退役军衔级别" labelWidth="130" collection="aac065" readOnly="true" />
					<ta:number id="aac056" key="军龄(月)" labelWidth="130" max="999" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="aae203" key="军龄折算月数" labelWidth="130" max="999" min="0" readOnly="true" alignLeft="true" />
					<ta:selectInput id="yic009" key="特殊贡献表彰类型" labelWidth="130" collection="YIC009" readOnly="true" />
					<ta:selectInput id="yic010" key="计划生育类型" labelWidth="130" collection="YIC010" readOnly="true" />
					<ta:selectInput id="ykc005" key="是否事业单位在编人员" labelWidth="130" collection="YAE230" readOnly="true" />
					<ta:number id="yic380" key="统筹应承担金额" labelWidth="130" max="10000" min="0" display="false" readOnly="true" alignLeft="false" />
					<ta:number id="yic381" key="单位应承担金额" labelWidth="130" max="10000" min="0" display="false" readOnly="true" alignLeft="false" />
					<ta:date id="aae206" key="建账年月" labelWidth="130" issue="true" showSelectPanel="true" readOnly="false" required="true" />
					<ta:selectInput id="yic436" key="是否区直转入" labelWidth="130" collection="sfbz" required="true" value="0" />
					<ta:selectInput id="yae230" key="是否补发待遇" labelWidth="130" collection="yae230" value="0" readOnly="false" required="true" />
					<ta:selectInput id="chchzhbz" key="重汇账户标识" labelWidth="130" collection="SFBZ" value="0" readOnly="false" required="true" />
					<ta:text id="aaz261" key="退休行政审批ID" display="false" />
					<ta:textarea id="aae013_1" key="备注" labelWidth="130" span="3" height="40px" maxLength="100" />
				</ta:panel>
				<ta:panel id="rysnjsinfo" cols="3" key="人员四年基数信息" fit="true" cssStyle="overflow:auto;">
					<ta:datagrid id="rysnjsGrid">
						<ta:datagridItem id="aae001" key="年度" sortable="true" width="200" align="center" dataAlign="center" />
						<ta:datagridItem id="yic182" key="计算指数所用基数" sortable="true" width="200" align="center" dataAlign="center" />
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab id="rycshdqdyxx" key="待遇信息" cssStyle="overflow:auto;">
				<ta:panel id="xbf" cols="3" key="新办法">
					<ta:text id="aic164_new" key="平均缴费指数" labelWidth="130" readOnly="true" />
					<ta:text id="yic259_new" key="平均工资" labelWidth="130" readOnly="true" />
					<ta:text id="yic250_new" key="指数化月平均缴费工资" labelWidth="130" readOnly="true" />
					<ta:text id="yic292_new" key="个人账户养老金计发月数" labelWidth="130" readOnly="true" />
					<ta:text id="aic240_new" key="基础养老金" labelWidth="130" readOnly="true" />
					<ta:text id="aic241_new" key="过渡性养老金" labelWidth="130" readOnly="true" />
					<ta:text id="aic242_new" key="个人账户养老金" labelWidth="130" readOnly="true" />
					<ta:text id="aic244_new" key="调节金" labelWidth="130" readOnly="true" />
					<ta:text id="yic343_new" key="总额" labelWidth="130" readOnly="true" />
				</ta:panel>
				<ta:panel id="ybf" cols="3" key="原办法">
					<ta:text id="aic164_old" key="平均缴费指数" labelWidth="130" readOnly="true" />
					<ta:text id="yic259_old" key="平均工资" labelWidth="130" readOnly="true" />
					<ta:text id="yic250_old" key="指数化月平均缴费工资" labelWidth="130" readOnly="true" />
					<ta:text id="yic292_old" key="个人账户养老金计发月数" labelWidth="130" readOnly="true" />
					<ta:text id="aic240_old" key="基础养老金" labelWidth="130" readOnly="true" />
					<ta:text id="aic241_old" key="过渡性养老金" labelWidth="130" readOnly="true" />
					<ta:text id="aic242_old" key="个人账户养老金" labelWidth="130" readOnly="true" />
					<ta:text id="aic244_old" key="调节金" labelWidth="130" readOnly="true" />
					<ta:text id="yic333_old" key="生活补助" labelWidth="130" readOnly="true" />
					<ta:text id="yic343_old" key="总额" labelWidth="130" readOnly="true" />
				</ta:panel>
				<ta:panel id="db" cols="3" key="新、老办法对比">
					<ta:text id="yic272" key="过渡期限高比例" labelWidth="130" readOnly="true" />
					<ta:text id="yic411" key="养老金调差" labelWidth="130" readOnly="true" />
				</ta:panel>
				<ta:panel id="zhxx" cols="3" key="个人账户信息">
					<ta:number id="aae238" key="账户本金" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="dwjfhzbj" key="单位缴费划转本金" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="grjfhzbj" key="个人缴费划转本金" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="aae239" key="利息" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="dwjfhzlx" key="单位缴费划转利息" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="grjfhzlx" key="个人缴费划转利息" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
					<ta:number id="aae240" key="账户总金额" labelWidth="130" precision="2" min="0" readOnly="true" alignLeft="true" />
				</ta:panel>
				<ta:panel id="csqxx" cols="2">
					<ta:panel id="csqxx1" key="重算前待遇信息">
						<ta:datagrid id="csqdyxxGrid" haveSn="true" enableColumnMove="false">
							<ta:datagridItem id="aaa036" key="待遇类别" collection="aaa036" sortable="true" width="175" />
							<ta:datagridItem id="aae041" key="开始年月" />
							<ta:datagridItem id="aae042" key="终止年月" />
							<ta:datagridItem id="aae019" key="待遇金额" totals="sum" width="160" />
						</ta:datagrid>
					</ta:panel>
					<ta:panel id="csqxx2" key="重算后待遇信息">
						<ta:datagrid id="rydqdyxxGrid" haveSn="true" enableColumnMove="false">
							<ta:datagridItem id="aaa036" key="待遇类别" collection="aaa036" sortable="true" width="150" />
							<ta:datagridItem id="aaa085" key="定期待遇标志" width="90" collection="aaa085" />
							<ta:datagridItem id="aae041" key="开始年月" width="70" />
							<ta:datagridItem id="aae042" key="终止年月" width="70" />
							<ta:datagridItem id="aae129" key="核发金额" totals="sum" width="130" />
						</ta:datagrid>
					</ta:panel>
				</ta:panel>
			</ta:tab>
			<ta:tab id="rydybtxx" key="人员待遇补退信息">
				<ta:datagrid id="rydybtxxGrid" haveSn="true" enableColumnMove="false" fit="true">
					<ta:datagridItem id="aaa078" key="补扣发标志" width="360" collection="AAA078" sortable="true" align="center" />
					<ta:datagridItem id="aae003" key="补扣年月" width="360" align="center" />
					<ta:datagridItem id="aae129" key="补扣总金额" totals="sum" width="360" align="center" dataAlign="right" />
					<ta:dataGridToolPaging url="" showCount="false" showButton="false" showDetails="false" showExcel="true"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="rynjfzsxxL" key="101号文人员年缴费指数信息(老办法)">
				<ta:datagrid id="rynzsxxGridL" columnFilter="true" haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="yic066" key="计算办法" collection="yic066" sortable="true" align="center" />
					<ta:datagridItem id="aae001" key="年度" sortable="true" align="center" dataAlign="center" />
					<ta:datagridItem id="aic078" key="本年应缴月数" align="center" dataAlign="center" />
					<ta:datagridItem id="aic079" key="本年实缴月数" align="center" dataAlign="center" />
					<ta:datagridItem id="yic182" key="基数" align="center" dataAlign="right" />
					<ta:datagridItem id="yic181" key="工资" align="center" dataAlign="right" />
					<ta:datagridItem id="yic183" key="缴费指数" totals="avg" align="center" dataAlign="right" />
					<ta:dataGridToolPaging url="" showCount="false" showButton="false" showDetails="false" showExcel="true"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="rynjfzsxxX" key="54号文人员年缴费指数信息(新办法)">
				<ta:datagrid id="rynzsxxGridX" columnFilter="true" haveSn="true" forceFitColumns="true" fit="true">
					<ta:datagridItem id="yic066" key="计算办法" collection="yic066" sortable="true" align="center" />
					<ta:datagridItem id="aae001" key="年度" sortable="true" align="center" dataAlign="center" />
					<ta:datagridItem id="aic078" key="本年应缴月数" align="center" dataAlign="center" />
					<ta:datagridItem id="aic079" key="本年实缴月数" align="center" dataAlign="center" />
					<ta:datagridItem id="yic182" key="基数" align="center" dataAlign="right" />
					<ta:datagridItem id="yic181" key="工资" align="center" dataAlign="right" />
					<ta:datagridItem id="yic183" key="缴费指数" totals="avg" align="center" dataAlign="right" />
					<ta:dataGridToolPaging url="" showCount="false" showButton="false" showDetails="false" showExcel="true"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="ryyjfzsxx" key="人员月缴费指数信息" cssStyle="overflow:hidden;">
				<ta:datagrid id="ryyzsxxGrid" haveSn="true" enableColumnMove="false" fit="true" columnFilter="true">
					<ta:datagridItem id="yic066" key="计算办法" width="215" collection="yic066" sortable="true" align="center" dataAlign="center" />
					<ta:datagridItem id="aae003" key="款费所属期" width="215" sortable="true" align="center" dataAlign="center" />
					<ta:datagridItem id="yic182" key="基数" align="center" width="215" dataAlign="right" />
					<ta:datagridItem id="yic181" key="工资" align="center" width="215" dataAlign="right" />
					<ta:datagridItem id="yic183" key="缴费指数" totals="avg" width="215" align="center" dataAlign="right" />
					<ta:dataGridToolPaging url="" showCount="false" showButton="false" showDetails="false" showExcel="true"></ta:dataGridToolPaging>
				</ta:datagrid>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	//打开查询个人信息页面
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, fn_setRyData, true);
	}
	
	// 查询个人信息回调函数
	function fn_setRyData() {
		Base.submit("aac001,aae140,aaa121","<%=path%>/process/pensionbenefit/approve/treatmentrecalculation/treatmentRecalculationAction!queryBaseInfo.do",null,null,fn_check);
	}
	
	//打印基本养老金核定表
	function print() {
	    var aac001 = Base.getValue("aac001");
	    if (aac001 == null || aac001 == "") {
	      Base.alert("个人编号为空,不能打印");
	      return;
	    }
	    var aaz170 = Base.getValue("aaz170");
	    if (aaz170 == null || aaz170 == "") {
	      Base.alert("核定事件ID为空,不能打印");
	      return;
	    }
	    var ykc005 = Base.getValue("ykc005");
	    if (ykc005 == null || ykc005 == "") {
	      Base.alert("是否事业单位在编人员标志为空,不能打印");
	      return;
	    }    
	    if(ykc005 == '1'){
	         $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dyjs_jbyljhdb_74.raq&"
	        		 +"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					 +"serverPagedPrint=no&mirror=no&"
					 +"paramString=aac001="+aac001+";aaz170="+aaz170);
	    }else{
	         $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_csdyjs_jbyljhdb_54.raq&"
	        		 +"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					 +"serverPagedPrint=no&mirror=no&"
					 +"paramString=aac001="+aac001+";aaz170="+aaz170);
	    }
  	}

	//打印养老金历年调整表
	function print1() {
	    var aac001 = Base.getValue("aac001");
	    if (aac001 == null || aac001 == "") {
	      Base.alert("个人编号为空,不能打印");
	      return;
	    }
	    var aaz170 = Base.getValue("aaz170");
	    if (aaz170 == null || aaz170 == "") {
	      Base.alert("核定事件ID为空,不能打印");
	      return;
	    }
	    var aaz002 = Base.getValue("aaz002");
	    if (aaz002 == null || aaz002 == "") {
	      Base.alert("业务日志ID为空,不能打印");
	      return;
	    }   
        $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dycs_dylntzb.raq&"
        		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
			    +"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001+";aaz002="+aaz002+";aaz170="+aaz170);
  	}
  
	//打印调整基本养老金申报表
	function print2() {
	    var aac001 = Base.getValue("aac001");
	    if (aac001 == null || aac001 == "") {
	      Base.alert("个人编号为空,不能打印");
	      return;
	    }
	    var aaz170 = Base.getValue("aaz170");
	    if (aaz170 == null || aaz170 == "") {
	      Base.alert("核定事件ID为空,不能打印");
	      return;
	    }
	    
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=i_dycs_tzjbyljsbb.raq&"
	    		+"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
			    +"serverPagedPrint=no&mirror=no&"+"paramString=aac001="+aac001+";aaz170="+aaz170);
  	}

	//回调函数	
	function fn_queryInfo(){
	   if (g_Suggest != ""){ 
		   fn_setPersonBaseInfoData();
		   Base.submit("aac001,aae140,aaa121","<%=path%>/process/pensionbenefit/approve/treatmentrecalculation/treatmentRecalculationAction!queryBaseInfo.do",null,null,fn_check);   
	   }
	}

	function fn_dfxbt(){
	    var aae210 = Base.getValue("aae210");
	    var dfxbt = Base.getValue("dfxbt");
	    var begin = Base.getValue("begin");
	    if(dfxbt == ""){
	        alert("请先填写地方性补贴金额！");
		    Base.setValue("begin", "");
		    Base.setValue("end", "");
	    }
	    if(parseInt(begin) < parseInt(aae210)){
	        alert("补贴开始年月"+begin+"不能早于待遇享受开始年月"+aae210+"，请确认！");
		    Base.setValue("begin", "");
	    }
	    if(parseFloat(dfxbt) > 0){
		    Base.submit("aae210,dfxbtset","<%=path%>/process/pensionbenefit/approve/treatmentcalculation/treatmentCalculationAction!dfxbt.do", null, null, null);
		}
	}

	function fn_end() {
		var begin = Base.getValue("begin");
		var end = Base.getValue("end");
		var dfxbt = Base.getValue("dfxbt");
		if (dfxbt == "") {
			alert("请先填写地方性补贴金额！");
			Base.setValue("begin", "");
			Base.setValue("end", "");
		}
		if (parseInt(end) < parseInt(begin)) {
			alert("终止年月" + end + "不能早于开始年月" + begin + "，请确认！");
			Base.setValue("end", "");
		}
	}

	function fn_check() {
		Base.resetForm("form1");
		initializeSuggestFramework(3, "ac01", "jstj", 700, 200, 4, fn_queryInfo, 1, false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
	}

	//保存经办信息
	function submitData() {
		var begin = Base.getValue("begin");
		var end = Base.getValue("end");
		var dfxbt = Base.getValue("dfxbt");
		var aae210 = Base.getValue("aae210");
		var aae211 = Base.getValue("aic162").replace(/-/g, '').substring(0, 6);
		if (aae210 == null || aae210 == "") {
			Base.alert("待遇开始年月不能为空，请确认！");
			Base.focus("aae210");
			return false;
		}
		if (aae211 == null || aae211 == "") {
			Base.alert("待遇核定年月不能为空，请确认！");
			Base.focus("aae211");
			return false;
		}
		if (aae210 <= aae211) {
			Base.alert("待遇开始年月不能小于或等于退休日期，请确认！");
			Base.focus("aae210");
			return false;
		}
		if (dfxbt != "") {
			if (begin == "") {
				alert("请填写补贴开始年月");
				return;
			}
			if (end == "") {
				alert("请填写补贴终止年月");
				return;
			}
		}
		Base.submit("form1", "treatmentRecalculationAction!toSave.do", null, null, null, function(data) {
			Base.setDisabled("btnSave");
		});
	}

	function fn_checkAae210() {
		var aae210 = Base.getValue("aae210");
		var aae211 = Base.getValue("aic162").replace(/-/g, '').substring(0, 6);
		if (aae210 == null || aae210 == "") {
			Base.alert("待遇开始年月不能为空，请确认！");
			Base.focus("aae210");
			return false;
		}
		if (aae211 == null || aae211 == "") {
			Base.alert("待遇核定年月不能为空，请确认！");
			Base.focus("aae211");
			return false;
		}
		if (aae210 <= aae211) {
			Base.alert("待遇开始年月不能小于或等于退休日期，请确认！");
			Base.focus("aae210");
			return false;
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
<script type="text/javascript">
	var div = parent.$("#userwin");
	setTimeout(function() {
		div.window("maximize");
	}, 1)
</script>