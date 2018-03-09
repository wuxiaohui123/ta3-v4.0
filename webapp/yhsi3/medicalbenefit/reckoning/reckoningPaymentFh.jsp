<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>清算支付</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="yes-scrollbar"  >
		<ta:pageloading/>
		
		<ta:toolbar id="ButtonLayout1">
            <ta:toolbarItem id="ButtonSave" key="保存(S)" icon="xui-icon-edit2" hotKey="S" onClick="save()"  />
		    <ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true"/>
       </ta:toolbar>
       
     <ta:form id="form1" fit="true" >	 
        
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
			<ta:text id="ykb010" key="待遇申请事件ID"  readOnly="true" display="false" labelWidth="150" />
			<ta:text id="aaz002" key="业务日志ID"  readOnly="true" display="false" labelWidth="150" />
        
	    <ta:tabs id="tabs1" fit="true">
	    <ta:tab id="tab1" key="清算信息" >
		<ta:datagrid  id="kf20"   haveSn="true" fit="true" headerColumnsRows="2">
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
		</ta:tab>
	  </ta:tabs>
</ta:form>
<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
$(document).ready(function () {
	$("body").taLayout();
	Base.filterSelectInput("action", '1,2', true)
});
	
	function save(){
    	var rowData = Base.getGridData("kf20"); //获得表格选中行的JSON数组
    	if(rowData.length < 1){
            Base.alert("没有要操作的数据");
            return false;
        }
        var dataStr = Ta.util.obj2string(rowData); //如果要把得到的数据传到后台，必须把json数组转换成字符串
    	var parameter = {};
    	parameter["gridselect"] = dataStr; //定义一个参数对象 
    	Base.submit("aaz002,action","reckoningPaymentFhAction!save.do",parameter,null,false,null,null);
    	Base.activeTab('tab2');
    }
	// 渲染行颜色
	function fnFormatter(row, cell, value, columnDef,dataContext){
		var aka018 = parseInt(dataContext.aka018);
		if(aka018 == 13)
			value = "<span style='color:blue;'>"+value+"</span>";
		return value;
	}

</script>
<%@ include file="/ta/incfooter.jsp"%>