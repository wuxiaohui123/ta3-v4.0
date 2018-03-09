<%@ page language="java" pageEncoding="UTF-8"%>

<ta:panel id="ffxxlr" key="发放信息录入" cols="3" >
	<ta:selectInput id="yad169" key="支付对象" labelWidth="130" collection="YAD169" readOnly="true"/>
	<ta:selectInput id="aae145" key="支付方式" labelWidth="130" collection="AAE145" readOnly="true"/>
	<ta:selectInput id="aac059" key="领取人证件类型" labelWidth="130" collection="AAC059" readOnly="true"/>
	<ta:text id="aae136" key="领取人证件号" labelWidth="130" readOnly="true"/>
	<ta:text id="aae133" key="领取人姓名" labelWidth="130" readOnly="true"/>
	<ta:text id="aae010" key="银行账号" labelWidth="130" readOnly="true"/>	
	<ta:selectInput id="aaf002" key="代发银行类别" collection="AAF002" onSelect="getAAE044" maxVisibleRows="8" labelWidth="130" readOnly="true"/>
	<ta:selectInput id="aaz009" key="代发机构名称" collection="AAZ009" maxVisibleRows="8" allowInputOtherText="true" labelWidth="130" readOnly="true"/>
	<ta:selectInput id="yaf012" key="开户银行类别" collection="AAF002" onSelect="getAAE008" maxVisibleRows="8" labelWidth="130" readOnly="true"/>
	<ta:selectInput id="yaf013" key="开户银行编号" onSelect="fnsetaaf001" showKey="true" maxVisibleRows="8" allowInputOtherText="true" labelWidth="130" readOnly="true"/>
	<ta:text id="yaf001" key="开户银行名称" labelWidth="130" readOnly="true"/>	
	<ta:selectInput id="yaf011" key="开户银行异地标志" labelWidth="130" collection="YAF011" readOnly="true"/>
	<ta:text id="aae007" key="邮政编码" maxLength="6" labelWidth="130" readOnly="true"/>
	<ta:text id="aae006" key="详细地址" span="2" labelWidth="130" readOnly="true"/>
</ta:panel>
<script type="text/javascript">
$(document).ready(function() {
	var yad169 = Base.getValue("yad169");
	if (yad169 == "11"){
		Base.showObj("aac059");
	}else{
		Base.hideObj("aac059");
	}
	//fn_setPaymentInfoReadOnlyPage();
});	
function getAAE044(){
	Base.submit("aaf002",myPath()+"/process/benefit/common/paymentBaseInfoAction!getAAE044.do");
}
function getAAE008(){

    Base.setValue("yaf001","");
	Base.submit("yaf012", myPath()+"/process/benefit/common/paymentBaseInfoAction!getAAE008.do");
}
function fnsetaaf001(){
   Base.submit("yaf013", myPath()+"/process/benefit/common/paymentBaseInfoAction!getAf07AAE044.do");
}
</script>