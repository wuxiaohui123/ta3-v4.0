<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>慢性病明细审核</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="toolBars">
		<ta:toolbarItem id="btnOk"      key="确定"        icon="xui-icon-spotSave"    onClick="toSave('1')"/>
		<ta:toolbarItem id="closeBtn"   key="退出"        icon="xui-icon-spotReset"    onClick="closeWin()"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true" >
	     <ta:box id="bxJsInfo"  fit="true" cols="4" cssStyle="margin-top:10px;">
	         <ta:selectInput id="bxlx"  key="报销类型"   required="true"  labelWidth="120"  collection="BXLX"/>
		     <ta:text id="aae001" key="年度"        labelWidth="120"  readOnly="true"/>
		     <ta:text id="aaz217" key="就诊流水号"  readOnly="true" labelWidth="120"/>
		     <ta:text id="aaz216" key="结算流水号"  readOnly="true" labelWidth="120"/>
		    
		     <div class="fielddiv" > 
		        <label for="akc191" class="fieldLabel" style="width:120px" > 住院流水号： </label> 
		        <div class="fielddiv2" style="margin-left:120px" > 
		          <span class="popWin" onClick="fn_akc191()"></span>
			      <input type="text" id="akc191" name="dto['akc191']" readOnly="true" class="textinput readonly" >
			    </div>
		     </div>
			
			<ta:text id="aac003" key="姓名"   readOnly="true" labelWidth="120"/>
			<ta:text id="aac001" key="个人ID" labelWidth="120"  readOnly="true"/>
			<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
			<ta:text id="yke112" key="年龄" readOnly="true" labelWidth="120" />
			<ta:selectInput id="akc021" key="人员性质" readOnly="true" collection="AKC021" labelWidth="120" />
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" />
			<ta:selectInput id="aab019" key="单位类型" readOnly="true" collection="AAB019" labelWidth="120" />
			<ta:text id="aae030" key="入院日期"  readOnly="true" labelWidth="120" />
			<ta:text id="aae031" key="出院日期"  readOnly="true" labelWidth="120" />
			<ta:text id="yke021" key="住院天数"  readOnly="true" labelWidth="120" />
			<ta:text id="akb021" key="就诊医院"  readOnly="true" span="2" labelWidth="120" />
			<ta:text id="akc196" key="出院诊断"  readOnly="true" span="2" labelWidth="120" />
			<ta:text id="qfxzflj"  key="起付线报销累计"  readOnly="true" labelWidth="120" />
			<ta:number id="yka058" key="起付线"    required="true" labelWidth="120"  precision="2"/>
			<ta:text id="qfxbl"  key="起付线自付比例"    readOnly="true"  labelWidth="120"  />
			<ta:text id="qfxzf"  key="起付线统筹支付"    readOnly="true"  labelWidth="120"  />
			<ta:text id="tczflj" key="个人自付报销累计"  readOnly="true"  labelWidth="120" />
			<ta:number id="yka059"     key="个人支付"          required="true"   labelWidth="120"   precision="2"/>
			<ta:text id="tczfbl"     key="个人支付自付比例"   readOnly="true"  labelWidth="120"  />
			<ta:text id="tczf"   key="个人支付统筹支付"   readOnly="true"  labelWidth="120" />
			<ta:text id="aae009" key="银行户名" labelWidth="120" required="true" />
			<ta:text id="aae010" key="银行账号" labelWidth="120" required="true"  span="2"/>			
			<ta:selectInput id="yaf011" key="银行异地标志" collection="YAF011" labelWidth="120" required="true"/> 
			<ta:selectInput id="aaf002" key="银行类型" collection="AAF002" labelWidth="120" required="true"  widthPercentage="150%" isAutoExtend="false"/> 
		    <ta:text id="yae597" key="银行名称"  labelWidth="120"  span="2"  />
			<ta:text id="aaz065" key="银行ID"    labelWidth="120"  readOnly="true"/>
			<ta:text id="aae013" key="备注"      labelWidth="120"  span="4"/>
	    </ta:box>		
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(2,"","yae597",700,300,4,aaz065_callback,0,false);
	});
    //  银行ID  change事件
	$("#yae597").change(function(){
		Base.setValue("aaz065");
		sfwQueryUtil(2,'getAf07ForYl',Base.getValue('aaz065'));
	});

	// 银行回调 方法
	function aaz065_callback()
	{
		Base.setValue("aaz065",g_Suggest[3]);
		Base.setValue("yae597",g_Suggest[0]);
	}
	
	// 获取补报销数据
	function fn_akc191()
	{
		var bxlx = Base.getValue("bxlx"); // 报销类型
		if("" == bxlx || null == bxlx)
		{
			Base.alert("请先选择报销类型!","warn");
			return ;
		}else{
			top._akc191_gwybx = this.window;
			var param = {};
			Base.openWindow('win_akc191',"选择公务员医疗补助报销数据","<%=path%>/medicalbenefit/calculation/calculationGWYAction!getBxsj.do",param,"85%","75%",null,function(){
				Base.setEnable("btnOk");
				var aaz217 = Base.getValue("aaz217");
				if ("" == aaz217 || null == aaz217){
					
				}else{
					 toSave("0");
				}
			},true);
		}
	}
	
	//　保存
	function toSave(jslb)
	{
		var param = {};
		var aaz217 = Base.getValue("aaz217");
		var aaz216 = Base.getValue("aaz216");
		var aac001 = Base.getValue("aac001");
		var aac003 = Base.getValue("aac003");
		var bxlx = Base.getValue("bxlx");
		var yka058 = Base.getValue("yka058");
		var yka059 = Base.getValue("yka059");
		var aae013 = Base.getValue("aae013");
		var aae009 = Base.getValue("aae009");
		var aae010 = Base.getValue("aae010");
		var yaf011 = Base.getValue("yaf011");
		var aaf002 = Base.getValue("aaf002");
		var aaz065 = Base.getValue("aaz065");
		if("1" == jslb)
		{
			if("" == aaz217 || null == aaz217)
				return Base.alert("请先选择补报销数据!","warn");
			if("" == bxlx || null == bxlx)
				return Base.alert("请先选择报销类型!","warn");
			if("" == yka058 || null == yka058)
				return Base.alert("起付线不能为空!","warn");
			if("" == yka059 || null == yka059)
				return Base.alert("个人支付不能为空!","warn");
			if("" == aae009 || null == aae009)
				return Base.alert("银行户名不能为空!","warn");
			if("" == aae010 || null == aae010)
				return Base.alert("银行账号不能为空!","warn");
			if("" == yaf011 || null == yaf011)
				return Base.alert("异地标志不能为空!","warn");
			if("" == aaf002 || null == aaf002)
				return Base.alert("银行类型不能为空!","warn");
			// 置灰保存按钮
			Base.setDisabled("btnOk");
		}
		param["dto.aaz217"]=aaz217;
		param["dto.aaz216"]=aaz216;
		param["dto.aac001"]=aac001;
		param["dto.aac003"]=aac003;
		param["dto.bxlx"]=bxlx;
		param["dto.yka058"]=yka058;
		param["dto.yka059"]=yka059;
		param["dto.aae013"]=aae013;
		param["dto.jslb"]=jslb;
		param["dto.aae009"]=aae009;
		param["dto.aae010"]=aae010;
		param["dto.yaf011"]=yaf011;
		param["dto.aaf002"]=aaf002;
		param["dto.aaz065"]=aaz065;
		Base.submit("","calculationGWYAction!toSave.do",param);
	}
	
	// 退出
    function closeWin()
    {
    	parent.Base.closeWindow("win_js");
    }
	
</script>
<%@ include file="/ta/incfooter.jsp"%>