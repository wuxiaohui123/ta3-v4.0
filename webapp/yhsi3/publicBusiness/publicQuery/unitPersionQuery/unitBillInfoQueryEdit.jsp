<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>单位台账信息详细</title>
<%@ include file="/ta/inc.jsp"%>
</head>
   <body>
      <ta:pageloading />
        <ta:toolbar id="tlb1">
        	<ta:button key="打印缴费明细信息" hotKey="P" id="btnPrint1" icon="icon-print" onClick="printPageJfmx()" asToolBarItem="true" />
        	<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output" onClick="fnExpFile('dg_HDInfo');" asToolBarItem="true" />
		   <ta:button id="btnClose" key="关闭[C]" icon="xui-icon-spotClose"  hotKey="c" asToolBarItem="true" onClick="fnClose()"/>
	    </ta:toolbar>
         <ta:form id="form2" fit="true">
         	<ta:text id="yae518" key="当事人核定ID" display="false"/>
         	<ta:text id="yab003" key="经办机构" display="false"/>
            <ta:tabs id="tabs" fit="true">
                <ta:tab id="tab1" key="单位台账明细">
                    <ta:datagrid id="datagrid2" fit="true" haveSn="true" forceFitColumns="true">
						<ta:datagridItem id="aab001" key="单位编号" align="center" maxChart="6"/>
						<ta:datagridItem id="aae044" key="单位名称" showDetailed="true" align="center" maxChart="10"/>
						<ta:datagridItem id="aae140" key="险种类型" collection="AAE140"  align="center" maxChart="6"/>
						<ta:datagridItem id="yac084" key="离退休标志" collection="YAC084"  align="center" maxChart="4"/>
						<ta:datagridItem id="aae002" key="做账期号"  align="center" maxChart="4"  dataAlign="center"/>
						<ta:datagridItem id="aae003" key="费款所属期"  align="center" maxChart="5" dataAlign="center"/>
						<ta:datagridItem id="aab120" key="个人缴费基数总额"  align="center" maxChart="7" dataAlign="right"/>
						<ta:datagridItem id="aab119" key="人次" align="center" maxChart="5" sortable="true" dataAlign="right" totals="sum" tatalsTextShow="false" />
						<ta:datagridItem id="aae341" key="筹资项目"  align="center" maxChart="7" dataAlign="right" collection="AAE341" showDetailed="true"/>
						<ta:datagridItem id="yad001" key="应缴金额"  align="center" maxChart="5"  dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="yad003" key="已缴金额" formatter="fnFormatterBlue"  align="center" maxChart="5"  dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="qjje" key="欠缴金额" formatter="fnFormatterRed"  align="center" maxChart="5"  dataAlign="right" tatalsTextShow="false" totals="sum"/>
						<ta:datagridItem id="jfzt" key="缴费状态"  align="center" maxChart="5"  dataAlign="right"/>
					</ta:datagrid>
                </ta:tab>
                <ta:tab id="tab2" key="核定人员明细">
			          <ta:panel id="fld3" key="核定人员明细" fit="true" expanded="false" scalable="true">
					      <ta:datagrid id="dg_HDInfo" haveSn="true" fit="true" columnFilter="true">
				              <ta:datagridItem id="aac001" key="人员ID" align="center" dataAlign="left" width="80"></ta:datagridItem>
				              <ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="left" width="60"></ta:datagridItem>
				              <ta:datagridItem id="aac002" key="证件号码" align="center" dataAlign="left" width="150"></ta:datagridItem>
				              <ta:datagridItem id="yac084" key="离退休标志" align="center" dataAlign="center" width="100" collection="YAC084"></ta:datagridItem>
				              <ta:datagridItem id="aae140" key="险种类型" collection="AAE140" align="center" dataAlign="left" width="100"></ta:datagridItem>
				              <ta:datagridItem id="aae002" key="做帐期号" align="center" dataAlign="center" width="100"></ta:datagridItem>
				              <ta:datagridItem id="aae003" key="费款所属期" align="center" dataAlign="center" width="100"></ta:datagridItem>
				              <ta:datagridItem id="aac040" key="工资" align="center" dataAlign="right" dataType="Number" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				              <ta:datagridItem id="aae180" key="缴费基数" align="center" dataAlign="right" dataType="Number" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				              <ta:datagridItem id="jfhj" key="缴费合计" align="center" dataAlign="right" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				              <ta:datagridItem id="dwjf" key="单位缴费" align="center" dataAlign="right" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				              <ta:datagridItem id="dwjfbl" key="单位缴费比例" align="center" dataAlign="right" maxChart="6" ></ta:datagridItem>
				              <ta:datagridItem id="grjf" key="个人缴费" align="center" dataAlign="right" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				              <ta:datagridItem id="grjfbl" key="个人缴费比例" align="center" dataAlign="right" maxChart="6" ></ta:datagridItem>
				              <ta:datagridItem id="hzh" key="划账户" align="center" dataAlign="right" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				              <ta:datagridItem id="hzhbl" key="划账户比例" align="center" dataAlign="right" width="100" totals="sum" tatalsTextShow="false"></ta:datagridItem>
				              <ta:datagridItem id="aae036_dz" key="登帐经办时间"  align="center" maxChart="6" sortable="true"/>
				              <ta:datagridItem id="ykc005" key="参保类型" align="center" dataAlign="center" maxChart="5" collection="YKC005"></ta:datagridItem>
				              <ta:datagridItem id="ykc006" key="人员类别" align="center" dataAlign="center" maxChart="5" collection="YKC006"></ta:datagridItem>
				              <ta:datagridItem id="aac004" key="性别" collection="AAC004" align="center" dataAlign="center" maxChart="2"></ta:datagridItem>
				              <ta:datagridItem id="yab139" key="参保所属机构" collection="AAB301" align="center" dataAlign="center" maxChart="10"></ta:datagridItem>
				           </ta:datagrid> 
				      </ta:panel>    
			      </ta:tab>
            </ta:tabs>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	 //关闭编辑窗口
	function fnClose(){
	    parent.Base.closeWindow("modifyWin");
	    }
	
	//已缴金额表格列渲染
	function fnFormatterBlue(row, cell, value, columnDef, dataContext){
		value = "<span style='color:blue;'>"+value+"</span>";
		return value;
	}
	
	//欠缴金额表格列渲染
	function fnFormatterRed(row, cell, value, columnDef, dataContext){
		value = "<span style='color:red;'>"+value+"</span>";
		return value;
	}
	
	
	//打印缴费明细情况表
	function printPageJfmx(){
		var yae518 = Base.getValue("yae518");
		var yab003 = Base.getValue("yab003");
		var prm ="yae518=" + yae518 + ";yae5182=" + yae518+ ";yab003=" + yab003   
		var fileName = "jfmxPrint.raq";
		fnPrintComm(fileName,prm);	
	}
	
	
	//输出excel表格信息
	function fnExpFile(gridId) {
		var rows = Base.getGridData(gridId);
		if (rows != "") {
			Base.expGridExcel(gridId);
		} else {
			Base.alert("没有数据需要导出,请确认!", "warn");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>