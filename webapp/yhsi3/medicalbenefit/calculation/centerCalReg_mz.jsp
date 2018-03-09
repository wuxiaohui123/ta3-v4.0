<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>零星报销登记(门诊)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="saveBtn" key="保存" icon="xui-icon-spotSave"  onClick="toSave()"  />
		<ta:toolbarItem id="shBtn" key="明细录入" icon="xui-icon-spotCheck"   onClick="toMxSh()"  />
		<ta:toolbarItem id="editBtn" key="修改" icon="xui-icon-spotEdit"   onClick="toEdit()"  />
		<ta:toolbarItem id="edityBtn" key="确定修改" icon="xui-icon-spotSave"   onClick="toEditY()" />
		<ta:toolbarItem id="cancelBtn" key="撤销" icon="xui-icon-spotDelete"  onClick="toCencel()"  />
		<ta:toolbarItem id="jiaofeiBtn" key="查询缴费信息" icon="xui-icon-query"   onClick="toQueryJiaoFei()"/>
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<ta:text id="aaz217" key="人员医疗就诊事件ID"  display="false" labelWidth="120" />
			<ta:text id="aaz216" key="医疗待遇结算事件ID" display="false" labelWidth="120" />
			<ta:text id="aaz002" key="业务日志ID" display="false" labelWidth="120" />
			<ta:text id="aaa027" key="经办分中心" display="false" labelWidth="120" />
		</ta:box>
		<ta:panel id="panel1" key="基本信息" cols="3">
			<ta:text id="aac001"  key="个人ID"  required="true" labelWidth="120"/>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
			<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="120" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
			<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120" />
			<ta:selectInput id="yac084" key="退休标志" readOnly="true" collection="YAC084" labelWidth="120" />
			<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" />
			<ta:text id="yke112" key="年龄"  readOnly="true" span="1" labelWidth="120" />
			<ta:selectInput id="ykc005" key="人员类型" readOnly="true" collection="YKC005" labelWidth="120" />
			<ta:selectInput id="ykc006" key="人员类别" readOnly="true" collection="YKC006" labelWidth="120" />
			<ta:text id="aac008" key="待遇状态" readOnly="true"  labelWidth="120" />
			<ta:text id="aae003" key="最大缴费年月" readOnly="true"  labelWidth="120" />
			<ta:text id="aae240" key="账户余额" readOnly="true"  labelWidth="120" />
		</ta:panel>
		<ta:panel id="panel2" key="就诊信息" cols="3">
			<ta:selectInput id="aka130" key="医疗类别" collection="AKA130" required="true" labelWidth="120"  maxVisibleRows="8" onSelect="fnSelectAka130"/> 
			<ta:date id="aae030" key="开始日期" showSelectPanel="true" required="true"  onChange="fnDate(this)" labelWidth="120"/>
			<ta:date id="aae031" key="结束日期" showSelectPanel="true" required="true" onChange="fnDate(this)" labelWidth="120"/>
			<ta:text id="akb020"  key="医疗机构编号"  required="true" labelWidth="120" popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do?dto.sort=desc" popWinHeight="500" popWinWidth="900" />
			<ta:selectInput id="akb020_y" key="申请备案医院"  labelWidth="120" onSelect="fnAkb020_y"/>
			<ta:text id="akb020_1" key="医疗机构编码(后台)"  readOnly="true" display="false" />
			<ta:text id="akb021" key="医疗机构名称" required="true" span="2" labelWidth="120" />
			<ta:selectInput id="akb097" collection="AKB096" key="医疗机构等级" readOnly="true" labelWidth="120"/>
			<ta:selectInput id="ake013" key="报销原因" collection="AKE013" value="10"  filter="11,12,13"  maxVisibleRows="6" required="true" labelWidth="120"/>
			<ta:text id="aae072" key="单据号" labelWidth="120" />
			<ta:text id="yke069" key="提交单据份数" labelWidth="120" />
			<ta:text id="ake024" key="疾病诊断" labelWidth="120" span="2"/>
		</ta:panel>
		<ta:panel id="dyspxx" key="待遇审批信息" height="120px" cols="3">
			<ta:selectInput id="ykc239" key="基本医疗享受状态" collection="YKC239" readOnly="true" labelWidth="120" labelStyle="color:blue;" cssStyle="color:red;"/>
			<ta:text id="yka249" key="基本统筹限额标准" readOnly="true" labelWidth="120"/>
			<ta:text id="yka119" key="本次基本医疗限额" readOnly="true" labelWidth="120"/>
			<ta:text id="yka114" key="起付标准" readOnly="true" labelWidth="120"/>
			<ta:text id="yka115" key="本次付起付线" readOnly="true" labelWidth="120"/>
			<ta:textarea id="spqksm" key="审批情况说明" span="3" height="60px" readOnly="true" labelWidth="120"/>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 750, 300, 7, fn_getPerson, 0, false);
	});
	// 个人ID change事件
	$("#aac001").change(function(){
		sfwQueryUtil(1,'getAc01ByAae140ForYL',Base.getValue('aac001'));
	});
	// 医疗人员回调方法
	function fn_getPerson(){
		Base.setValue("aac001",g_Suggest[2]);
		var param = {};
		param["dto['aac001']"] = g_Suggest[2]; // 人员ID
		param["dto['checkAaa027']"] = "0"; // 是否检查分中心
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getPersonInfo.do",param,
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg, 'warn');
							Base.setValue("aac001",'');
							return true;
						}
						if(data &&  data.personInfoDto) {
							Base.setValue("aac002",data.personInfoDto.aac002);
							Base.setValue("aac003",data.personInfoDto.aac003);
							Base.setValue("aac004",data.personInfoDto.aac004);
							Base.setValue("aac006",data.personInfoDto.aac006);
							Base.setValue("aab003",data.personInfoDto.aab003);
							Base.setValue("aac066",data.personInfoDto.aac066);
							Base.setValue("yac084",data.personInfoDto.yac084);
							Base.setValue("ykc005",data.personInfoDto.ykc005);
							Base.setValue("ykc006",data.personInfoDto.ykc006);
							Base.setValue("yke112",data.personInfoDto.yke112);
							Base.setValue("aae140",data.personInfoDto.aae140);
							Base.setValue("aac008",data.personInfoDto.aac008);
							Base.setValue("aae003",data.personInfoDto.aae003);
							Base.setValue("aae240",data.personInfoDto.aae240);
							
							// 焦点置于医疗类型
							Base.focus("aka130");
							// 同步获取相关数据 :1,人员待遇信息;2,申请备案信息
							getRelationData();
						}
					});
	}
	 // 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata){
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	   fn_getHospital();
	}
	// 医疗机构回调方法 
	function fn_getHospital(){
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",
					{"dto['akb020']":Base.getValue("akb020")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg, 'warn');
							Base.setValue("akb020","");
							return false;
						}
						if(data &&  data.hospitalInfoDto) {
							Base.setValue("akb097",data.hospitalInfoDto.akb097); // 医疗机构等级
							Base.setValue("akb021",data.hospitalInfoDto.akb021); // 医疗机构名称
							Base.setValue("akb020_1",data.hospitalInfoDto.akb020); // 医疗机构编码
							// 同步获取相关数据 :1,人员待遇信息;2,申请备案信息
							getRelationData();
						}
					});
	}
	
	// 同步获取相关数据 :1,人员待遇信息;2,申请备案信息
	function getRelationData()
	{
		if(getYdaz()) // 获取异地住院信息
		   fn_getDysp(); // 获取待遇审批信息
	}
	
	//医疗类别下拉选择事件
	function fnSelectAka130(key,value)
	{
		Base.setValue("akb020_y",""); // 清空异地医院编码
		Base.setValue("akb020_1",""); // 清空医院编码
		Base.setValue("akb020",""); // 清空医院编码
		Base.setValue("akb021",""); // 清空医院名称
		Base.setValue("akb097",""); // 清空医院等级
		Base.setReadOnly("akb097"); // 医疗机构等级只读
		Base.setDisRequired("akb097"); // 医疗机构等级取消必录
		Base.hideObj("akb020_y"); // 隐藏异地医院编码
		Base.showObj("akb020"); // 显示统筹区内的医院编码
		Base.setEnable("akb020"); // 医疗机构编号可录入(放大镜)
		if(getYdaz()) // 异地安置信息
	      fn_getDysp();// 获取待遇审批信息
	}
	
	//备案医院下拉选择
	function fnAkb020_y(key,value)
	{
		//////    医疗机构编码、医疗名称和医疗机构等级的自动生成       start///////
		// value的值格式:akb020_aka101.由编码和等级组成
		var akb020s = value.split("_"); // 先将value分成akb020和aka101
		var akb020 = akb020s; // 医疗机构编码
		var akb097 = ""; // 医疗机构等级 
		if(akb020s.length > 1)
		{
			akb020 = akb020s[0];
			akb097 = akb020s[1];
		}
		Base.setValue("akb021",key);
		Base.setValue("akb020_1",akb020);//医疗机构编码
		Base.setValue("akb097",akb097);//医疗机构等级
		//////    医疗机构编码、医疗名称和医疗机构等级的自动生成       end///////
		// 获取待遇信息
		fn_getDysp();
	}
	
	//获取人员的异地安置备案信息
	function getYdaz()
	{
		var flag = true;
		//先验证医疗类别是否是异地安置
		var aka130 = Base.getValue("aka130");
		// 28:异地安置住院(区内);29:异地安置住院(区外)
		if("15"== aka130)
		{
			//人员ID
			var aac001 = Base.getValue("aac001");
			if("" == aac001 || null == aac001)
				return;
			Base.submit("aac001","centerCalRegAction!getKc45k1.do",null,null,false,function(){
				Base.hideObj("akb020");
				Base.showObj("akb020_y");
				Base.setEnable("akb020_y");
				Base.setValue("akb020_y",""); // 清空异地医院编码
				Base.setValue("akb020_1",""); // 清空医院编码
				Base.setValue("akb020",""); // 清空医院编码
				Base.setEnable("akb097"); // 医疗机构等级可修改
				Base.setRequired("akb097"); // 医疗机构等级为必录入项
				Base.filterSelectInput("akb097","04,05",false);
				//Base.focus("akb020_y");
			},function(){
				Base.alert("没有获取到异地备案信息!","warn");
				flag = false;
			});
		}
		return flag;
	}
	
	// 获取医疗机构编码
	function getAkb020()
	{
		//医疗机构编码
		var akb020 = Base.getValue("akb020_1");
		if("" == akb020 || null == akb020){
		   akb020 = Base.getValue("akb020");
		   if("" == akb020 || null == akb020){
		       akb020 = Base.getValue("akb020_y"); // 获取医院机构编码
		       if("" != akb020 && null != akb020)
		    	   akb020 = akb020.split("_")[0];
		   }   
		}
		return akb020;
	}
	
	//开始日期和结束日期的验证
	function fnDate(o)
	{
		var id = o.id;
		var value = o.value;
		var aae030 = Base.getValue("aae030");
		var aae031 = Base.getValue("aae031");
		// 输入开始日期,同步结束日期
		if("aae030" == id)    
			   Base.setValue("aae031",value);
		// 同步获取相关数据 :1,人员待遇信息;2,申请备案信息
		//getRelationData();
	}
		
	//查询待遇信息
	function fn_getDysp()
	{
		//先清空待遇信息
		Base.clearData("dyspxx");
		//人员编号
		var aac001 = Base.getValue("aac001");
		//医疗类别 
		var aka130 = Base.getValue("aka130");
		//医疗机构编码
		var akb020 = getAkb020();
		//开始日期
		var aae030 = Base.getValue("aae030");
		//结束日期 
		var aae031 = Base.getValue("aae031");
		//如果有一个为空,则直接返回 
		if("" == aac001 || null == aac001||
		   "" == aka130 || null == aka130||
		   "" == akb020 || null == akb020||
		   "" == aae030 || null == aae030||
		   "" == aae031 || null == aae031)
			return true;
		//险种类型
		var aae140 = Base.getValue("aae140");
		//医疗机构名称 
		var akb021 = Base.getValue("akb021");
		//备注
		var aae013 = Base.getValue("aae013");
	    //开始日期不能大于结束日期 		
		if(aae030 > aae031){
			Base.setValue("aae031","");
			Base.alert("结束日期不能小于开始日期!","warn",function(){Base.focus("aae031");});
			return false;
		}
		//参数
		var param={"dto['aac001']":aac001,
				   "dto['aaz217']":"1",
				   "dto['aaz216']":"1",
				   "dto['aka130']":aka130,
				   "dto['yka032']":"1",
				   "dto['akb020']":akb020,
				   "dto['yka026']":"",
				   "dto['aae030']":aae030,
				   "dto['aae031']":aae031,
				   "dto['ykd089']":"",
				   "dto['aae013']":aae013,
				   "dto['checkddzt']":"0",
				   "dto['sfwrit']":"0",
			       "dto['sfyqtjzxx']":"0",
				   "dto['sfjsqfx']":"1",
				   "dto['aae100']":"0",
				   "dto['aae140']":aae140,
				   "dto['akb021']":akb021
				   };
	    //获取待遇数据			 
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getDyspInfo.do",
					param,
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							//Base.setDisabled('saveBtn');
							Base.alert(data.errMsg, 'error');
							return false;
						}
						if(data &&  data.dyspDto){  
							Base.setValue("akb023",data.dyspDto.akb023);
							Base.setValue("aka101",data.dyspDto.aka101);
							Base.setValue("aac066",data.dyspDto.aac066);
							if('390' != Base.getValue('aae140')){
								Base.setValue("aae140",data.dyspDto.aae140);
							}
							Base.setValue("ykc239",data.dyspDto.ykc239);
							Base.setValue("yka249",data.dyspDto.yka249);
							Base.setValue("yka119",data.dyspDto.yka119);
							Base.setValue("yka114",data.dyspDto.yka114);
							Base.setValue("yka115",data.dyspDto.yka115);
							Base.setValue("spqksm",data.dyspDto.spqksm);
			
						}
					});
	}
	
	// 保存
	function toSave() 
	{
			var aac001 = Base.getValue("aac001");
			var aka130 = Base.getValue("aka130");
			var aae030 = Base.getValue("aae030");
			var aae031 = Base.getValue("aae031");
			var akb020 = getAkb020();
			var akb021 = Base.getValue("akb021");
			var ake013 = Base.getValue("ake013");
			if("" == aac001 || null == aac001)
				return Base.alert("请输入人员ID!","warn",function(){Base.focus("aac001");});
			if("" == aka130 || null == aka130)
				return Base.alert("请输入医疗类别!","warn",function(){Base.focus("aka130");});
			if("" == aae030 || null == aae030)
				return Base.alert("请输入开始日期!","warn",function(){Base.focus("aae030");});
			if("" == aae031 || null == aae031)
				return Base.alert("请输入结束日期!","warn",function(){Base.focus("aae031");});
			//开始日期不能大于结束日期 		
			if(aae030 > aae031){
				Base.setValue("aae031","");
				Base.alert("结束日期不能小于开始日期!","warn",function(){Base.focus("aae031");});
				return false;
			}
			//if("" == akb020 || null == akb020)
			//	return Base.alert("请输入医疗机构编号!","warn",function(){Base.focus("akb020");});
			if("" == akb021 || null == akb021)
				return Base.alert("请输入医疗机构名称!","warn",function(){Base.focus("akb021");});
			if("" == ake013 || null == ake013)
				return Base.alert("请输入报销原因!","warn",function(){Base.focus("ake013");});
			//保存
			Base.submit("form1","centerCalRegAction!toSave.do");
	}
	
	//撤销
	function toCencel()
	{
	    Base.submit("form1","centerCalRegAction!toCencel.do",null,null,false,function(){
	    	Base.alert("撤销成功!","success",function(){
	    	  document.location.reload();
	    	});
	    });
	}
	
	// 修改
	function toEdit()
	{
	    Base.submit("aaz217,aaz002,aac001,aka130","centerCalRegAction!toEdit.do");
	}
	// 修改
	function toEditY()
	{
	    Base.submit("form1","centerCalRegAction!toEditY.do");
	}

	// 明细录入
	function toMxSh()
	{
		var parameter = {};
		parameter["dto['aac001']"] = Base.getValue("aac001");
		parameter["dto['aaz217']"] = Base.getValue("aaz217");
		parameter["dto['aae030']"] = Base.getValue("aae030");
		parameter["dto['aae031']"] = Base.getValue("aae031");
		parameter["dto['aka130']"] = Base.getValue("aka130");
		Base.openWindow("win_mxlr", "明细录入信息", "<%=path%>/medicalbenefit/calculation/centerCalRegAction!toMxSh.do", parameter, "99%", "99%", null, null, true, null, null);
	}
	
	// 查询缴费信息
	function toQueryJiaoFei()
	{
		var aac001 = Base.getValue("aac001");
		if("" == aac001 || null == aac001){
			Base.alert("请输入个人ID","warn");
			return;
		}
		var parameter = {};
		parameter["dto['aac001']"] = aac001;
		parameter["dto['aae140']"] = Base.getValue("aae140");
		Base.openWindow("win_jf", "人员缴费信息", "<%=path%>/medicalbenefit/calculation/centerCalRegAction!toQueryJiaoFei.do", parameter, "98%", "95%", null, null, true, "", ""); 
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>