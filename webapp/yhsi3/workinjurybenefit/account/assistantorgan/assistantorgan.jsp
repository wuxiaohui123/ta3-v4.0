<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>AssistanTorgan</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body cssStyle="no-scrollbar">
		<ta:pageloading />

		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:panel key="机构信息录入" cols="3" id="assistantorgan">
				<ta:text id="aaz003" key="当事人银行帐号ID" display="false" />
				<ta:text id="aaz106" key="辅助器具机构ID" display="false" />
				<ta:text id="aaz099" key="待遇发放信息ID" display="false" />
				<ta:text id="aaz009_bk" key="代发机构名称" display="false" />
				<ta:text id="yaf013_bk" key="开户银行编号" display="false" />
				<ta:text id="aae140" key="险种类型" display="false" />
				<ta:selectInput id="aae145" key="发放方式" collection="AAE145" display="false"/>
				<ta:text id="aae044" key="机构名称" onChange="fn_queryInfo();" required="true" maxLength="100" labelWidth="130" />
				<ta:selectInput id="akb022" key="角色类别" collection="AKB022" required="true" labelWidth="130" />
				<ta:text id="aaa121" display="false"/>	
			</ta:panel>
			<ta:box id="paymentInfo">
			  <ta:panel id="ffxxlr" key="发放信息录入" cols="3">
				<ta:selectInput id="aaf002" key="代发银行类别" collection="AAF002"  labelWidth="130" value="95533" display="false"/>
				<ta:selectInput id="aaz009" key="代发机构名称"  collection="AAF002" labelWidth="130" value="95533" display="false"/>
				<ta:selectInput id="yaf012" key="开户银行类别" collection="AAF002"  labelWidth="130" value="95533" required="true"  onSelect="fnSelect"/>
				<ta:text id="aae009" key="户名" maxLength="50" readOnly="true" labelWidth="130" span="2"/>
				<ta:text id="aae010" key="银行账号"  maxLength="30" required="true" labelWidth="130" />
				<ta:selectInput id="yaf013" key="开户银行编号"  onSelect="fnsetaaf001" labelWidth="130" showKey="true" />
				<ta:text id="yaf001" key="开户银行名称" maxLength="50"  labelWidth="130" />
			  </ta:panel>
			</ta:box>
			<ta:panel key="机构信息" fit="true">
				<ta:datagrid id="fzqjjgxx" fit="true" haveSn="true" forceFitColumns="true" >
					<ta:datagridItem icon="icon-cancel" key="删除" id="btnDelete" width="50" align="center" click="fnDelRow" />
					<ta:datagridItem icon="icon-edit" key="修改" id="btnUpdate" width="50" align="center" click="fnUpdate" />
					<ta:datagridItem id="aaz003" key="当事人银行帐号ID" hiddenColumn="false" />
					<ta:datagridItem id="aaz106" key="辅助器具机构ID" hiddenColumn="false" />
					<ta:datagridItem id="aaz099" key="待遇发放信息ID" hiddenColumn="false" />
					<ta:datagridItem id="aaz009" key="代发机构名称" hiddenColumn="false" />
					<ta:datagridItem id="akb022" key="机构类别" collection="AKB022" />
					<ta:datagridItem id="aae044" key="机构名称" width="110px" showDetailed="true" />
					<ta:datagridItem id="aae010" key="银行账号" width="120px"/>
					<ta:datagridItem id="yaf012" key="开户银行类别" width="110px" collection="AAF002" />
					<ta:datagridItem id="yaf013" key="开户银行编号" width="110px" />
					<ta:datagridItem id="yaf001" key="开户银行名称" width="110px" />
					<ta:datagridItem id="aae009" key="户名" />
				</ta:datagrid>
			</ta:panel>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function (){
		$("body").taLayout();
	});
	
	function fnSelect(){
		var yaf012 = Base.getValue("yaf012");
		Base.setValue("aaz009",yaf012);
		Base.setValue("aaf002",yaf012);	
		Base.setValue("yaf001","");
		Base.submit("yaf012", "<%=path%>/process/benefit/common/paymentBaseInfoAction!getAAE008.do");	
	}
	
	function fnsetaaf001(){
	   Base.submit("yaf013", "<%=path%>/process/benefit/common/paymentBaseInfoAction!getAf07AAE044.do");
	}
	
	//查询
	function fn_queryInfo(){
		//生育过滤选项
		var aae140 = Base.getValue("aae140");
		if(aae140 == "510"){
			Base.filterSelectInput("akb022","1",true);
			Base.setValue("akb022","1");
		}
		var aae044 = Base.getValue("aae044");
		if(aae044.length == 0){
			return false;
		}
		
		Base.submit("aae044,aae140","assistantorganAction!queryAssistantOrganInfo.do");
  	};
  	
	//修改认定信息
	function fnUpdate(data,e){
		Base.setValue("aaz003",data.aaz003);    //当事人银行帐号ID
		Base.setValue("aaz106",data.aaz106);    //辅助器具机构ID
	 	Base.setValue("aae145",data.aae145);    //待遇发放方式
	 	Base.setValue("aaf002",data.yaf012);    //代发银行类别
	 	Base.setValue("aaz099",data.aaz099);    //待遇发放信息ID
	 	Base.setValue("akb022",data.akb022);    //机构类别
	 	Base.setValue("aae044",data.aae044);    //机构名称
	 	Base.setValue("yaf012",data.yaf012);    //开户银行类别
		Base.setValue("yaf001",data.yaf001);    //开户银行名称
	 	Base.setValue("aae009",data.yaf012);    //户名
	 	Base.setValue("aae010",data.aae010);    //银行账号
	 	var yaf013 = data.yaf013;
	 	Base.submit("yaf012", "<%=path%>/process/benefit/common/paymentBaseInfoAction!getAAE008.do",null,null,false,function(){
	 		Base.setValue("yaf013",yaf013);    //开户银行编号
	 	});	
	 	Base.setValue("aaz009",data.dfjgmc);    //代发机构名称
	 	Base.setValue("aae133",data.aae133);    //领取人姓名
	 	Base.setValue("aae136",data.aae136);    //领取人证件号码
	 	Base._setReadOnly(["akb022"],true);
	 }
	
	
	//删除认定信息
	function fnDelRow(data,e){
		var aaz106 = data.aaz106;
		var aaz003 = data.aaz003;
		Base.setValue("aae044",data.aae044);
		Base.confirm("确认要删除?",function(btn, callback,options) {
		if (btn) {	
			Base.submit("aae044,aae140", "assistantorganAction!toSave.do",{"dto['aaz106']":aaz106,"dto['aaz003']":aaz003,"dto['yae587']":"3"},null,null,function(){
				Base.resetForm("form1");
			});
			}
		});
	}
	
	//保存经办信息
	function submitData(){
		if(!Base.validateForm("assistantorgan")){
			Base.hideMask();
			return false;
		}
		
		//操作选择
		var aaz106 = Base.getValue("aaz106");
		if(aaz106 != null && aaz106 != ""){
			if(!confirm("确认更新？")){ 
				return false;
			}
		}
		Base.submit("assistantorgan,paymentInfo","assistantorganAction!toSave.do",null,null,null,function(){
				Base.resetForm("form1");
			});
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>
