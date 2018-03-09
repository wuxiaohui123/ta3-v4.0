<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>保证金支付</title>
<%@ include file="/ta/inc.jsp"%>
</head>
	<body class="no-scrollbar"  >
		<ta:pageloading/>
		
		<ta:toolbar id="ButtonLayout1">
            <ta:toolbarItem id="ButtonQuery" key="查询(Q)" icon="xui-icon-add2" hotKey="Q" onClick="query()"  />
            <ta:toolbarItem id="ButtonSave" key="支付(S)" icon="xui-icon-edit2" hotKey="S" onClick="save()"  />
            <ta:toolbarItem id="ButtonBack" key="撤销支付(C)" icon="xui-icon-edit2" hotKey="C" onClick="saveBack()"  />
            <ta:toolbarItem id="btnCwjzd" key="打印保证金支付单[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toPrint()" />
            <ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage" hotKey="R" asToolBarItem="true"/>
       </ta:toolbar>
       
     <ta:form id="form1" fit="true" >	    
	<ta:fieldset key="查询条件" cols="3" id="baseinfo"  >
	    <ta:date id="aae001" key="年度" labelWidth="120" required="true" dateYear="true" isFocusShowPanel="true" showSelectPanel="true"/>
		<ta:text id="akb020" key="医疗机构编码"  labelWidth="120" onChange="sfwQueryUtil(1,'getKb01',Base.getValue('akb020'))" required="true"/>
		<ta:text id="akb021" key="医疗机构名称"  readOnly="true" labelWidth="120"/>
	</ta:fieldset>
	    <ta:tabs id="tabs1" fit="true" >
	    <ta:tab id="tab1" key="保证金信息和保证金扣款信息" >
	    <ta:panel id="panel1" fit="true" cols="2">
	    <ta:panel id="panel11" fit="true" key="保证金信息">
		<ta:datagrid  id="kb03k1"   haveSn="true" fit="true" headerColumnsRows="2"  selectType="checkbox"  >
			    <ta:datagridItem id="aae209" key="年月" showDetailed="true" align="center" dataAlign="center"  maxChart="6"    formatter="fnFormatter"/>
			    <ta:datagridItem id="akb020" key="医疗机构编号" showDetailed="true" align="center" dataAlign="left" maxChart="6"  formatter="fnFormatter"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" showDetailed="true" align="center" dataAlign="left" maxChart="18"  formatter="fnFormatter"/>			
				<ta:datagridItem id="yka316" key="清算类别" showDetailed="true" align="center" dataAlign="left"  maxChart="6" collection="YKA316"  formatter="fnFormatter"/>
				<ta:datagridItem id="akb079" key="结算人次" showDetailed="true" align="center" dataAlign="right" maxChart="4"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akc264" key="医疗费总额合计" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akc228" key="自费费用" showDetailed="true" align="center" dataAlign="right" maxChart="6"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb081" key="应支付金额" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb069" key="拒付费用" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb082" key="预留比例" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb090" key="保证金金额" showDetailed="true" align="center" dataAlign="right" maxChart="5"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="ykb010" key="清算流水号" showDetailed="true" align="center" dataAlign="left"  maxChart="8" />
			    <ta:datagridItem id="aaz002" key="日志ID" showDetailed="true" align="center" dataAlign="left"  maxChart="8" hiddenColumn="true"/>
		</ta:datagrid>
		</ta:panel>
		<ta:panel id="panel12" key="保证金扣款信息"  >
		<ta:datagrid  id="kb03k7"   haveSn="true"  selectType="checkbox"  height="320px">
			    <ta:datagridItem id="aae001" key="年度" align="center" dataAlign="left"  maxChart="5"  formatter="fnFormatter"/>
				<ta:datagridItem id="yka415" key="应扣基本统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false" hiddenColumn="true"/>
				<ta:datagridItem id="yka413" key="应扣大额统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false" hiddenColumn="true"/>
				<ta:datagridItem id="yka414" key="应扣公务员统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false" hiddenColumn="true"/>
				<ta:datagridItem id="yka394" key="实扣基本统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yka392" key="实扣大额统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yka393" key="实扣公务员统筹" showDetailed="true" align="center" dataAlign="right" maxChart="8" formatter="fnFormatter" totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="aae013" key="备注" showDetailed="true" align="center" dataAlign="left" maxChart="15"  formatter="fnFormatter"  tatalsTextShow="false"/>
				<ta:datagridItem id="aaa027" key="统筹区" collection="AAA027" showDetailed="true" align="center" dataAlign="left" maxChart="5"  formatter="fnFormatter"  tatalsTextShow="false"/>
				<ta:datagridItem id="yae099" key="业务流水号" align="center" dataAlign="left"  maxChart="5"  formatter="fnFormatter"/>
			    <ta:datagridItem id="akb020" key="医疗机构编号" showDetailed="true" align="center" dataAlign="left" maxChart="6"  formatter="fnFormatter"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" showDetailed="true" align="center" dataAlign="left" maxChart="18"  formatter="fnFormatter"/>					
				<ta:datagridItem id="aaz002" key="业务日志ID" showDetailed="true" align="center" dataAlign="left" maxChart="5"  formatter="fnFormatter"  tatalsTextShow="false"/>				
		</ta:datagrid>
		</ta:panel>
		</ta:panel>
		</ta:tab>
		<ta:tab id="tab2" key="保证金支付信息" >
		<ta:datagrid  id="bzjzfxx"   haveSn="true" fit="true" selectType="checkbox" headerColumnsRows="2">
			    <ta:datagridItem id="hdlsh" key="合单流水号" align="center" dataAlign="left"  maxChart="5"  formatter="fnFormatter"/>
			    <ta:datagridItem id="zfph" key="支付流水号" align="center" dataAlign="left"  maxChart="5"  formatter="fnFormatter"/>
			    <ta:datagridItem id="akb020" key="医疗机构编号" showDetailed="true" align="center" dataAlign="left" maxChart="6"  formatter="fnFormatter"/>
				<ta:datagridItem id="akb021" key="医疗机构名称" showDetailed="true" align="center" dataAlign="left" maxChart="18"  formatter="fnFormatter"/>					
				<ta:datagridItem id="aae001" key="年度" align="center" dataAlign="left"  maxChart="5"  formatter="fnFormatter"/>
				<ta:datagridItem id="aaa027" key="统筹区" collection="AAA027" showDetailed="true" align="center" dataAlign="left" maxChart="5"  formatter="fnFormatter"  tatalsTextShow="false"/>	
				<ta:datagridItem id="akb090" key="预留保证金" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false" />
				<ta:datagridItem id="yka415" key="应扣基本统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false" hiddenColumn="true"/>
				<ta:datagridItem id="yka413" key="应扣大额统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false" hiddenColumn="true"/>
				<ta:datagridItem id="yka414" key="应扣公务员统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false" hiddenColumn="true"/>
				<ta:datagridItem id="yka394" key="实扣基本统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yka392" key="实扣大额统筹" showDetailed="true" align="center" dataAlign="right" maxChart="6"  formatter="fnFormatter"  totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="yka393" key="实扣公务员统筹" showDetailed="true" align="center" dataAlign="right" maxChart="8" formatter="fnFormatter" totals="sum" tatalsTextShow="false"/>
				<ta:datagridItem id="akb0901" key="实付保证金" showDetailed="true" align="center" dataAlign="right" maxChart="6" formatter="fnFormatter" totals="sum" tatalsTextShow="false" />
							
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
	initializeSuggestFramework(1,"", "akb020", 750, 300, 7, fn_getHosInfo, 0, false);
});
	function fn_getHosInfo(){
		   Base.setValue("akb020",g_Suggest[0]);//getYDHospitalInfo
		   Base.setValue("akb021",g_Suggest[1]);
		   
		   if(Base.validateForm("baseinfo")){
			    Base.submit("baseinfo","reckoningBzjPaymentAction!query.do",null,null,false,null,null);
		 }
		}
	function query(){		
	     if(Base.validateForm("baseinfo")){
			    Base.submit("baseinfo","reckoningBzjPaymentAction!query.do",null,null,false,null,null);
		 }else{
				Base.alert("查询条件带红星的为必输入项!","warn");
		}
	}
	function save(){
	    var rowDatakb03k1 = Base.getGridSelectedRows("kb03k1"); //获得表格选中行的JSON数组
    	if(rowDatakb03k1.length < 1){
            Base.alert("请勾选保证金信息");
            return false;
        }
        var rowDatakb03k7 = Base.getGridSelectedRows("kb03k7"); //获得表格选中行的JSON数组

    	var parameter = {};
    	parameter["gridselectkb03k1"] = Ta.util.obj2string(rowDatakb03k1); //定义一个参数对象 
    	parameter["gridselectkb03k7"] = Ta.util.obj2string(rowDatakb03k7); //定义一个参数对象 
	    
	    if(Base.validateForm("baseinfo")){
    	      Base.submit("baseinfo","reckoningBzjPaymentAction!save.do",parameter,null,false,null,null);
    	      Base.activeTab('tab2');
		 }else{
			  Base.alert("查询条件带红星的为必输入项!","warn");
		}
    }
    function saveBack(){
	    var rowData = Base.getGridSelectedRows("bzjzfxx"); //获得表格选中行的JSON数组
    	if(rowData.length < 1){
            Base.alert("没有勾选保证金支付数据");
            return false;
        }
	    
	    var dataStr = Ta.util.obj2string(rowData); //如果要把得到的数据传到后台，必须把json数组转换成字符串
    	var parameter = {};
    	parameter["gridselect"] = dataStr; //定义一个参数对象 
    	Base.submit("baseinfo","reckoningBzjPaymentAction!saveBack.do",parameter,null,false,null,null);
    	Base.activeTab('tab2');
    }
	// 渲染行颜色
	function fnFormatter(row, cell, value, columnDef,dataContext){
		var aka018 = parseInt(dataContext.aka018);
		if(aka018 > 3)
			value = "<span style='color:blue;'>"+value+"</span>";
		return value;
	}
//打印
	function toPrint(){
		var rows= Base.getGridSelectedRows("bzjzfxx");				
		if(rows.length == 0){
			Base.alert("请选择要打印的数据!");
			return false;
		}
		var hdlsh=new Array(rows.length);
		Base.confirm("是否确定打印?",function (y){
	 		if(y){
	 			for(var i=0;i<rows.length;i++){
	 				hdlsh[i] =  rows[i].hdlsh;
	 			}
	 			print1(hdlsh);
	 		}
	 	}); 
		
	 	
	}

  function print1(data){
		 var hdlsh = data;	
		 var strprint ="reckoningBzj.raq";
		 var aae014 = Base.getValue("aae014");
        
	//调用过程，准备打印数据
	$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName="+strprint+"&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aae014="+aae014+";hdlsh=" +hdlsh );
  }
</script>
<%@ include file="/ta/incfooter.jsp"%>