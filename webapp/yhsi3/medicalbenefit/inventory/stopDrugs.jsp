<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中心药品目录停用</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<!--<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" asToolBarItem="true" type="resetPage"/>-->
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin()" asToolBarItem="true"/>
		<ta:button id="btnShjl" icon="icon-save" key="审核记录" asToolBarItem="true" onClick="verityHistorySuggestView();" display="false"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:text id="aaz231" display="false" readOnly="true"/>
		<ta:text id="aaz234" display="false" readOnly="true"/>
		<ta:panel id="fdstBase" key="基本信息" cols="3">
			<ta:text id="ake001" key="社保三大目录统一编码" maxLength="20" labelWidth="150" required="true" bpopTipMsg="输入社保目录统一编码、ID或名称，可自动查询相关数据！" onChange="fnRPC()"/>
			<ta:text id="ake002" key="社保三大目录名称" maxLength="200" span="2" labelWidth="150" readOnly="true" />
			<ta:selectInput id="ake003" key="三大目录类别" collection="AKE003" value="1" labelWidth="150" readOnly="true" />
			<ta:text id="aka020" key="拼音助记码" cssInput="color:red" labelWidth="150" readOnly="true" />
			<ta:text id="aka021" key="五笔助记码" cssInput="color:red" labelWidth="150" readOnly="true" />
			<ta:text id="aka061" key="通用中文名称" maxLength="200" labelWidth="150" readOnly="true" display="false"/>
			<ta:text id="aka062" key="英文化学名" maxLength="50" labelWidth="150" readOnly="true" display="false"/>
			<ta:selectInput id="aka022" key="医疗使用标志" collection="AKA022" labelWidth="150" readOnly="true" display="false"/>
			<ta:selectInput id="ala011" key="工伤使用标志"  collection="ALA011" labelWidth="150" readOnly="true" display="false"/>
			<ta:selectInput id="ama011" key="生育使用标志" collection="AMA011" labelWidth="150" readOnly="true" display="false"/>
			<ta:selectInput id="aka063" key="医疗发票项目类别" collection="AKA063" labelWidth="150" readOnly="true" filter="01,02,03" reverseFilter="true"/>
			<ta:selectInput id="aka065" key="收费项目等级"  collection="AKA065"  labelWidth="150" readOnly="true"/>
			<ta:selectInput id="ake004" key="生产地类别" collection="AKE004" labelWidth="150" readOnly="true"  />
			<ta:text id="akb020" key="服务机构编号" labelWidth="150" readOnly="true" />
			<ta:text id="akb021" key="服务机构名称"  span="2"  labelWidth="150" readOnly="true"/>
			<ta:selectInput id="aka064" key="处方药标志" collection="AKA064" labelWidth="150" readOnly="true" />
			<ta:text id="ake101" key="区目录编码" maxLength="50" labelWidth="150" readOnly="true" />
			<ta:text id="ake102" key="自定义编码" maxLength="50" labelWidth="150" readOnly="true" />
			<ta:date id="aae030_1" key="开始日期" showSelectPanel="true" labelWidth="150" required="true" readOnly="true"/>
			<ta:date id="aae031" key="结束日期" showSelectPanel="true" labelWidth="150" required="true" onChange="fnChkDate()"/>
			<ta:textarea id="aae013" key="备注" height="50"  span="3" labelWidth="150" readOnly="true" />
			
		<ta:tab id="tab2" key="基本信息" cols="3" >
			<ta:text id="yke058" key="每次用量" maxLength="50" labelWidth="150" readOnly="true"/>
			<ta:text id="yke062" key="限定天数" maxLength="50" labelWidth="150" readOnly="true"/>
			<ta:text id="yke063" key="限制使用范围" maxLength="50" labelWidth="150" readOnly="true"/>
			<ta:text id="yke064" key="单处方限制数量" maxLength="50" labelWidth="150" readOnly="true"/>
			<ta:date id="aae030" key="开始日期" showSelectPanel="true" labelWidth="150" required="true" onChange="fnChkDate()" />
			<ta:selectInput id="aja006" key="失业使用标志" collection="AJA006" labelWidth="150" readOnly="true" display="false"/>
			<ta:selectInput id="aka036" key="限制使用标志" collection="AKA036" labelWidth="150" readOnly="true"/>
			<ta:selectInput id="yke059" key="使用频次" collection="YKE059" labelWidth="150" readOnly="true"/>
			<ta:selectInput id="yke060" key="特药标志" collection="YKE060" labelWidth="150" readOnly="true"/>
			<ta:selectInput id="yke065" key="限制使用最小医院等级" collection="YKE065" labelWidth="150" readOnly="true"/>
			<ta:selectInput id="yke066" key="单复方标志" collection="YKE066" labelWidth="150" readOnly="true"/>
			<ta:selectInput id="yke067" key="儿童用药标志" collection="YKE067" labelWidth="150" readOnly="true"/>
			<ta:selectInput id="aka032" key="分类二" labelWidth="150" readOnly="true" />
			<ta:selectInput id="aka033" key="分类三" labelWidth="150" readOnly="true" />
			<ta:selectInput id="aka034" key="分类四" labelWidth="150" readOnly="true" />
			<ta:textarea id="yke061" key="用法备注" height="50px" span="3" labelWidth="150" maxLength="100"/>
		</ta:tab>
		</ta:panel>
		<ta:box  id="bxCSXX" cols="2" height="210px" >
			<ta:panel id="pnlZfbl" key="自付比例参数" scalable="false"  expanded="false" span="1" height="230">
				<ta:datagrid id="dgdZfbl" fit="true"  haveSn="true" forceFitColumns="true">
					<ta:datagridItem id="aac066" key="参保身份" collection="AAC066"  showDetailed="true" align="center" width="100" hiddenColumn="true"/>
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" showDetailed="true" align="center" />
					<ta:datagridItem id="aka057" key="先自付比例" showDetailed="true" align="center" width="120" dataAlign="right"/>
					<ta:datagridItem id="aae030" key="开始日期" dataType="date" showDetailed="true" align="center" width="100" hiddenColumn="true"/>
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="pnlXjdy" key="限价定义参数" scalable="false"  expanded="false" span="1" height="230">
				<ta:datagrid id="dgdXjdy" fit="true"  haveSn="true" forceFitColumns="true">
					<ta:datagridItem id="akb095" key="限价医院等级" collection="AKB095" showDetailed="true" align="center" />
					<ta:datagridItem id="aka068" key="定价上限金额" dataType="number" showDetailed="true" align="center" dataAlign="right" />
					<ta:datagridItem id="aae030" key="开始日期" dataType="date" showDetailed="true" align="center" width="100" hiddenColumn="true" />
				</ta:datagrid>
			</ta:panel>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		Base.hideObj("tab2");
		initializeSuggestFramework(1,"","ake001",500,300,4,fn_callback,0,false);
	});
	//RPC查询方法
	function fnRPC(){
		var ake001=Base.getValue("ake001");
		if(ake001==""){   //如果没有输入查询条件,则清空所有数据
			Base.resetForm("form1");
			Base.clearGridData("dgdZfbl");
			Base.clearGridData("dgdXjdy");
		}else{
			sfwQueryUtil(1,'getKa20Filter',ake001+',0');//带有过滤条件的RPC查询方法 ,0表示对诊疗项目和服务设施的过滤
		}
	}
	//RPC回调函数
	function fn_callback() {
		 //首先清空原数据
	    Base.resetForm("form1");
	    Base.clearGridData("dgdZfbl");
	    Base.clearGridData("dgdXjdy");
	    Base.setValue("ake003","1");//目录类别
		if (g_Suggest[3]!="药品") {  //三目类别验证
			Base.alert("目录类别不正确!","warn");
			Base.setValue("ake001","");
		} else {
			Base.submit("", "stopDrugsAction!queryDrugsInfo.do", {"dto['aaz231']" : g_Suggest[0]}, null, false, null, null);
		}
	}
	//校验开始日期和结束日期
	function fnChkDate(){
		var aae030 = Base.getValue("aae030");
		var aae031 = Base.getValue("aae031");
		if((aae030 != null &&aae030 != "") && (aae031 != null &&aae031 != "")){
			if(aae031 <= aae030){
				Base.alert("结束日期必须大于开始日期!","warn");
				Base.setValue("aae031","");
				Base.focus("aae031");
				return false;
			}
		}
   	 return true;
	}
	//保存 
	function toSave() {
	    if(!fnChkDate()){
		   return ;
	    } 
		if (Base.validateForm("form1")) {
			Base.confirm("确定要提交吗?", function(btn, callback) {
				if (btn) {
					Base.submit('form1', 'stopDrugsAction!toSave.do');
				}
			});
		}
	}
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>