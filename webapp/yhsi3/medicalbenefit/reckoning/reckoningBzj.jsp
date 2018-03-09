<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>保证金扣款</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar"  >
		<ta:pageloading/>
		
		<ta:toolbar id="ButtonLayout1">
            <ta:toolbarItem id="ButtonQuery" key="查询(Q)" icon="xui-icon-add2" hotKey="Q" onClick="query()"  />
            <ta:toolbarItem id="ButtonSave" key="保存扣款(S)" icon="xui-icon-edit2" hotKey="S" onClick="save()"  />
            <ta:toolbarItem id="ButtonBack" key="撤销扣款(C)" icon="xui-icon-edit2" hotKey="C" onClick="saveBack()"  />
            <ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
       </ta:toolbar>
       
     <ta:form id="form1" fit="true" >	    
	<ta:fieldset key="查询条件" cols="3" id="baseinfo"  >
	    <ta:date id="aae001" key="年度" labelWidth="120" required="true" dateYear="true" isFocusShowPanel="true" showSelectPanel="true"/>
		<ta:text id="akb020" key="医疗机构编码"  labelWidth="120" onChange="sfwQueryUtil(1,'getKb01',Base.getValue('akb020'))" required="true"/>
		<ta:text id="akb021" key="医疗机构名称"  readOnly="true" labelWidth="120"/>
		
	</ta:fieldset>
	    <ta:tabs id="tabs1" fit="true" heightDiff="100">
	    <ta:tab id="tab1" key="清算信息" >
		<ta:datagrid  id="kf20"   haveSn="true" fit="true" headerColumnsRows="2" >
			    <ta:datagridItem id="aka018" key="清算状态"  collection="AKA018" align="center" dataAlign="left"  maxChart="5"  formatter="fnFormatter"/>
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
		<ta:tab id="tab2" key="保证金扣款信息" >
		<ta:datagrid  id="kb03k7"   haveSn="true" fit="true" selectType="checkbox" headerColumnsRows="2">
			    <ta:datagridItem id="yae099" key="业务流水号" align="center" dataAlign="left"  maxChart="5"  formatter="fnFormatter"/>
			    <ta:datagridItem id="akb020" key="医疗机构编号" showDetailed="true" align="center" dataAlign="left" maxChart="6"  formatter="fnFormatter"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" showDetailed="true" align="center" dataAlign="left" maxChart="18"  formatter="fnFormatter"/>					
				<ta:datagridItem id="aae001" key="年度" align="center" dataAlign="left"  maxChart="5"  formatter="fnFormatter"/>
				<ta:datagridItem id="yka415" key="应扣基本统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false" hiddenColumn="true"/>
				<ta:datagridItem id="yka413" key="应扣大额统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false" hiddenColumn="true"/>
				<ta:datagridItem id="yka414" key="应扣公务员统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false" hiddenColumn="true"/>
				<ta:datagridItem id="yka394" key="实扣基本统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yka392" key="实扣大额统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yka393" key="实扣公务员统筹" showDetailed="true" align="center" dataAlign="right" maxChart="8" formatter="fnFormatter" totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="aae013" key="备注" showDetailed="true" align="center" dataAlign="left" maxChart="15"  formatter="fnFormatter"  tatalsTextShow="false"/>
				<ta:datagridItem id="aaa027" key="统筹区" collection="AAA027" showDetailed="true" align="center" dataAlign="left" maxChart="5"  formatter="fnFormatter"  tatalsTextShow="false"/>
				<ta:datagridItem id="aaz002" key="业务日志ID" showDetailed="true" align="center" dataAlign="left" maxChart="5"  formatter="fnFormatter"  tatalsTextShow="false"/>				
		</ta:datagrid>
		</ta:tab>
	  </ta:tabs>
	  <ta:fieldset key="扣款信息" cols="3" id="kkinfo"  >
	    <ta:number id="yka394" key="实扣基本统筹" labelWidth="120"  required="true" precision="2" min="0"/>
		<ta:number id="yka392" key="实扣大额统筹"  labelWidth="120"  required="true" precision="2" min="0"/>
		<ta:number id="yka393" key="实扣公务员统筹"  labelWidth="120" required="true" precision="2" min="0"/>
		<ta:text id="aae013" key="备注"    labelWidth="120" maxLength="100" required="true" span="3"/>
		
	</ta:fieldset>
</ta:form>
<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
</body>
</html>
<script type="text/javascript">
$(document).ready(function () {
	$("body").taLayout();
	initializeSuggestFramework(1,"", "akb020", 750, 300, 7, fn_getHosInfo, 0, false);
});
	function fn_getHosInfo(){
		   Base.setValue("akb020",g_Suggest[0]);//getYDHospitalInfo
		   Base.setValue("akb021",g_Suggest[1]);
		   
		   if(Base.validateForm("baseinfo")){
			    Base.submit("baseinfo","reckoningBzjAction!query.do",null,null,false,null,null);
		 }
		}
	function query(){		
	     if(Base.validateForm("baseinfo")){
			    Base.submit("baseinfo","reckoningBzjAction!query.do",null,null,false,null,null);
		 }else{
				Base.alert("查询条件带红星的为必输入项!","warn");
		}
	}
	function save(){
	    var rowData = Base.getGridData("kf20"); //获得表格选中行的JSON数组
    	if(rowData.length < 1){
            Base.alert("没有清算数据，不能保存扣款");
            return false;
        }
	    
	    if(Base.validateForm("baseinfo") && Base.validateForm("kkinfo")){
    	      Base.submit("baseinfo,kkinfo","reckoningBzjAction!save.do",null,null,false,null,null);
    	      Base.activeTab('tab2');
		 }else{
			  Base.alert("查询条件带红星的为必输入项!","warn");
		}
    }
    function saveBack(){
	    var rowData = Base.getGridSelectedRows("kb03k7"); //获得表格选中行的JSON数组
    	if(rowData.length < 1){
            Base.alert("没有勾选保证金扣款数据，不能撤销扣款");
            return false;
        }
	    
	    var dataStr = Ta.util.obj2string(rowData); //如果要把得到的数据传到后台，必须把json数组转换成字符串
    	var parameter = {};
    	parameter["gridselect"] = dataStr; //定义一个参数对象 
    	Base.submit("baseinfo","reckoningBzjAction!saveBack.do",parameter,null,false,null,null);
    	Base.activeTab('tab2');
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