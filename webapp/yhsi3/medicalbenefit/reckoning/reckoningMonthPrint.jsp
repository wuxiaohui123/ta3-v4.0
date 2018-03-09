<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>费用月度清算单据打印</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="btr1" >
		<ta:toolbarItem id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="query()"/>
		<ta:toolbarItem id="btnJsd" key="打印清算支付单[A]" icon="xui-icon-spotSave" hotKey="A" onClick="toPrint('1')" />
<!-- 		<ta:toolbarItem id="btnCwjzd" key="打印清算支付合单[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toPrint('2')" /> -->
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset"  hotKey="R" onClick="reset()"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="fdstHospital" key="医疗服务机构信息" cols="3" >
			<ta:text id="akb020" key="医疗机构编码"  labelWidth="120" onChange="sfwQueryUtil(1,'getKb01',Base.getValue('akb020'))"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="120"/>
			<ta:box id="bxAae209" span="1" cols="2">
				<ta:date id="aae209_k" key="结算年月"  showSelectPanel="true" labelWidth="120" issue="true" columnWidth="0.65" required="true"/>
				<ta:date id="aae209_j" key="至"  showSelectPanel="true" labelWidth="15" issue="true" columnWidth="0.35"/>
			</ta:box>	
			<ta:selectInput id="yka316" key="清算类别" labelWidth="120" collection="YKA316" />
			
			<ta:text id="aae014" key="经办人姓名" display="false"/>
		</ta:panel>
		<ta:panel id="pnlAuditInfo" key="清算信息" fit="true" expanded="false" scalable="false">
			<ta:datagrid id="kf20" fit="true" haveSn="true" selectType="checkbox" headerColumnsRows="2" groupingBy="hdlsh" >
			    <ta:datagridItem id="hdlsh" key="合单流水号" showDetailed="true" align="center" dataAlign="left"  maxChart="8" formatter="fnFormatter" />
			    <ta:datagridItem id="aaz031" key="财务单据号" showDetailed="true" align="center" dataAlign="left"  maxChart="8" formatter="fnFormatter" />
				<ta:datagridItem id="aka018" key="清算状态" collection="AKA018" align="center" dataAlign="left"  maxChart="5"  formatter="fnFormatter"/>
			    <ta:datagridItem id="aae117" key="支付状态" collection="AAE117" align="center" dataAlign="left"  maxChart="5"  formatter="fnFormatter"/>
				<ta:datagridItem id="aae209" key="年月" showDetailed="true" align="center" dataAlign="center"  maxChart="6"    formatter="fnFormatter"/>
			    <ta:datagridItem id="akb020" key="医疗机构编号" showDetailed="true" align="center" dataAlign="left" maxChart="6"  formatter="fnFormatter"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" showDetailed="true" align="center" dataAlign="left" maxChart="18"  formatter="fnFormatter"/>			
				<ta:datagridItem id="yka316" key="清算类别" showDetailed="true" align="center" dataAlign="left"  maxChart="6" collection="YKA316"  formatter="fnFormatter"/>
				<ta:datagridItem id="akb079" key="结算人次" showDetailed="true" align="center" dataAlign="right" maxChart="4"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb065" key="医疗费总额合计" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akc228" key="自费费用" showDetailed="true" align="center" dataAlign="right" maxChart="6"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yka318" key="先行自付" showDetailed="true" align="center" dataAlign="right" maxChart="5" formatter="fnFormatter" totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb069" key="拒付费用" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb081" key="应支付金额" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb082" key="预留比例" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb090" key="预留金额" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb094" key="实支付金额" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb068" key="统筹基金支付" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>	
				<ta:datagridItem id="yka059" key="统筹比例自付" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>	
				<ta:datagridItem id="ake026" key="企业补充医疗基金支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake029" key="大额救助医疗基金支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake032" key="二乙医疗专项医疗基金支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake034" key="个人账户支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake036" key="公补医疗个人账户支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake038" key="基本医疗个人账户支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yke073" key="离休账户支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yke074" key="1-6级残疾军人医疗补助账户支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yke075" key="企业补充医疗保险账户支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake035" key="公补统筹基金支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake039" key="基本医疗基金支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake041" key="城镇居民基本医疗统筹基金支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake042" key="老红军专项医疗基金支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ake043" key="离休专项医疗基金" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yle001" key="医疗工伤报销金额" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ame001" key="生育基金支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yje001" key="失业基金支出" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yke054" key="其他待遇报销金额（自费）" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yke055" key="其他待遇报销金额" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akc268" key="超限额费用" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yka063" key="超封顶线" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yae041" key="审核人" showDetailed="true" align="center" dataAlign="left"  collection="AAE011" maxChart="3" formatter="fnFormatter"/>
				<ta:datagridItem id="yae051" key="审核日期" showDetailed="true" align="center" dataAlign="center" maxChart="10" formatter="fnFormatter"/>
				<ta:datagridItem id="yae042" key="结算人" showDetailed="true" align="center" dataAlign="left"  collection="AAE011" maxChart="3" formatter="fnFormatter"/>
				<ta:datagridItem id="yae052" key="结算日期" showDetailed="true" align="center" dataAlign="center" maxChart="10" formatter="fnFormatter"/>
			    <ta:datagridItem id="ykb010" key="清算流水号" showDetailed="true" align="center" dataAlign="left"  maxChart="8" />
			    <ta:datagridItem id="aaz002" key="日志ID" showDetailed="true" align="center" dataAlign="left"  maxChart="8" hiddenColumn="true"/>
			</ta:datagrid>
		</ta:panel> 
	</ta:form>
	<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"kb01", "akb020", 750, 300, 3, fn_getHosInfo, 0, false);
	});
	//医疗机构回调函数
	function fn_getHosInfo(){
		   Base.setValue("akb020",g_Suggest[0]);//getYDHospitalInfo
	       Base.setValue("akb021",g_Suggest[1]);
	}
	function reset(){
	   Base.clearGridData("kf20");
	   Base.setValue("akb020","");
	   Base.setValue("akb021","");
	   Base.setValue("yka316","");
	   Base.setValue("aae209_k","");
	   Base.setValue("aae209_j","");
	}	
	//查询
	function query(){
		var aae209_k = Base.getValue("aae209_k");
		var aae209_j = Base.getValue("aae209_j");
		if("" == aae209_k || null == aae209_k)
			return Base.alert("请输入结算年月!","warn",function(){
				Base.focus("aae209_k");
			});
		if("" == aae209_j || null == aae209_j)
			return Base.alert("请输入结算年月!","warn",function(){
				Base.focus("aae209_j");
			});
		// 先清除表格数据
		Base.clearGridData("kf20");
		Base.submit('form1','reckoningMonthPrintAction!toQuery.do');
	}
	
	//打印
	function toPrint(bz){
		var rows= Base.getGridSelectedRows("kf20");				
		if(rows.length == 0){
			Base.alert("请选择要打印的数据!");
			return false;
		}
		var hdlsh=new Array(rows.length);
		var bz = "1";
		Base.confirm("是否确定打印?",function (y){
	 		if(y){
	 			for(var i=0;i<rows.length;i++){
	 				hdlsh[i] =  rows[i].hdlsh;
	 			}
	 			print1(bz,hdlsh);
	 		}
	 	}); 
		
	 	
	}

  function print1(bz,data){
		 var hdlsh = data;	
		 var strprint ="";
		 var aae014 = Base.getValue("aae014");
		 var aaa121="";//业务类型编码	
		 if(bz == "1"){//清算支付单
		    strprint ="reckoning.raq";
		    aaa121="清算支付单打印";//业务类型编码
		 }
		 if(bz == "2"){//清算支付合单
		    strprint ="reckoningHeDan.raq";
		    aaa121="清算支付合单打印";//业务类型编码
		 }
	//调用过程，准备打印数据
	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+strprint+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aae014="+aae014+";hdlsh=" +hdlsh );
  }

	// 渲染行颜色
	function fnFormatter(row, cell, value, columnDef,dataContext){
		var aka018 = parseInt(dataContext.aka018);
		if(aka018 > 3)
			value = "<span style='color:blue;'>"+value+"</span>";
		return value;
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>