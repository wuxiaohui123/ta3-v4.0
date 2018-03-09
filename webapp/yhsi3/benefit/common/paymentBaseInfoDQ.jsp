<%@ page language="java" pageEncoding="UTF-8"%>
<ta:panel id="ffxxlr_dq" key="发放信息录入(定期)" cols="3" height="110">
    <ta:text id="aaz001_dq" key="组织ID" labelWidth="130" display="false" />
	<ta:text id="yaz099_dq" key="组织发放信息ID" labelWidth="130" display="false" />
	<ta:selectInput id="yad169_dq" key="支付对象 " required="true" labelWidth="130" collection="YAD169" value="11"  reverseFilter="true" onSelect="fn_checkbankzs_dq"/>
	<ta:selectInput id="aae145_dq" key="支付方式 " required="true" labelWidth="130" collection="AAE145" value="14"  reverseFilter="true" onSelect="fn_checkRequired_dq"/>
	<ta:selectInput id="aac059_dq" key="领取人证件类型 " required="true" labelWidth="130" collection="AAC059" value="1" display="true" />
	<ta:text id="aae136_dq" key="领取人证件号" required="true" readOnly="false" labelWidth="130" display="true"/>
	<ta:text id="aae133_dq" key="领取人姓名  " required="true" readOnly="false" labelWidth="130" />
	<ta:text id="aae010_dq" key="银行账号" required="true" labelWidth="130" />	
	<ta:selectInput id="aaf002_dq" key="代发银行类别" collection="AAF002" required="true" onSelect="fn_getAAE044_dq" maxVisibleRows="8" labelWidth="130" display="false"/>
	<ta:selectInput id="aaz009_dq" key="代发机构名称" required="true" collection="AAZ009" maxVisibleRows="8" allowInputOtherText="true" labelWidth="130" display="false"/>
	<ta:selectInput id="yaf012_dq" key="开户银行类别" collection="AAF002" required="true" onSelect="fn_getAAE008_dq" maxVisibleRows="8" labelWidth="130" />
	<ta:selectInput id="yaf013_dq" key="开户银行编号" onSelect="fn_setaaf001_dq" showKey="true" maxVisibleRows="8" allowInputOtherText="true" labelWidth="130" />
	<ta:text id="yaf001_dq" key="开户银行名称" labelWidth="130" />
	<ta:selectInput id="yaf011_dq" key="银行同城异地标志" required="true" labelWidth="130" collection="YAF011" value="0"/>
	<ta:text id="aae007_dq" key="邮政编码" maxLength="6" readOnly="true" labelWidth="130" display="false"/>
	<ta:text id="aae006_dq" key="详细地址" span="2" readOnly="true" labelWidth="130" display="false"/>
</ta:panel>
<script type="text/javascript">
function fn_checkbankzs_dq(){
	var yad169 = Base.getValue("yad169_dq");
    var aaa121 = Base.getValue("aaa121");
	var aac002 = Base.getValue("aac002");
    var aac003 = Base.getValue("aac003");	    
	
	if (yad169 != "11"){
		Base.setValue("aae145_dq","");			
		Base.setValue("aac059_dq","");
		Base.setValue("aae136_dq","");
		Base.setValue("aae133_dq","");
   		Base.setValue("aae010_dq","");			
   		Base.setValue("aaf002_dq","");	
   		Base.setValue("aaz009_dq","");
   		Base.setValue("yaf001_dq","");
   		Base.setValue("yaf013_dq","");
   		Base.setValue("yaf012_dq","");		
   		Base.setValue("aae007_dq","");
		Base.setValue("aae006_dq","");	
		Base.setValue("yaz099_dq","");
		Base.setValue("yaf011_dq","");
	}else{
		Base.setValue("aac059_dq","1");
		Base.setValue("aae136_dq",aac002);
		Base.setValue("aae133_dq",aac003);			
	}		
	
	if (aaa121 != "G50002" && aaa121 != "I50002" &&
		aaa121 != "J50002" && aaa121 != "L10025" &&	
		aaa121 != "M10025" && aaa121 != "I40005" &&
		aaa121 != "G40005" && aaa121 != "J40005" &&
		aaa121 != "L10023" && aaa121 != "M10010" ){
			fn_FfxxlrInitialization();
		}		
	
	if (yad169 == "11"){
		Base.setValue("aae145_dq","");			
		Base.setValue("aac059_dq","1");
//		Base.setValue("aae136_dq","");
//		Base.setValue("aae133_dq","");
   		Base.setValue("aae010_dq","");			
   		Base.setValue("aaf002_dq","");	
   		Base.setValue("aaz009_dq","");
   		Base.setValue("yaf001_dq","");
   		Base.setValue("yaf013_dq","");
   		Base.setValue("yaf012_dq","");		
   		Base.setValue("aae007_dq","");
		Base.setValue("aae006_dq","");
		Base.setValue("yaz099_dq","");
		Base.setValue("yaf011_dq","");			
		//Base.filterSelectInput("aae145",["11","14"],true);
		Base.setDisRequired(["aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","aae006_dq","aae007_dq"]);
		Base._setReadOnly(["aae133_dq","aae136_dq","aac059_dq","aae145_dq","aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","aae006_dq","aae007_dq","yaf011_dq"],false);
		Base.showObj(["aae133_dq","aae136_dq","aac059_dq","aae145_dq","aaf002_dq","aaz009_dq","aae010_dq","yaf012_dq","yaf013_dq","yaf001_dq","aae006_dq","aae007_dq","yaf011_dq"]);
	}else{
		//Base.filterSelectInput("aae145",["11","12","14","21"],true);	
		var aaz001 = fn_privateContorlAaz001();
		if(aaz001 != null && aaz001 != ""){
			Base.setValue("aaz001_dq",aaz001);
		}else{
			aaz001 = Base.getValue("aaz001_dq");
		}
		var aae140 = Base.getValue("aae140");
		var aaa121 = Base.getValue("aaa121");
		if(aaz001 == null || aaz001 == ""){
		  alert("组织ID为空！");
		  Base.setValue("yad169_dq","");
		  return false;
		}
		if(aae140 == null || aae140 == ""){
			  alert("险种类型为空！");
			  Base.setValue("yad169_dq","");
			  return false;
			}
		if(aaa121 == null || aaa121 == ""){
			  alert("业务编码为空！");
			  Base.setValue("yad169_dq","");
			  return false;
			}			
		Base.hideObj(["aae133_dq","aae136_dq","aae145_dq","aac059_dq","aaf002_dq","aaz009_dq","aae010_dq","yaf012_dq","yaf013_dq","yaf001_dq","aae007_dq","aae006_dq","yaf011_dq"]);
		Base.submit("ffxxlr_dq,aae140,aaa121",myPahth()+"/process/benefit/common/paymentBaseInfoAction!GetAe31Info_dq.do",null,null,null,function(data){
			fn_setPaymentInfoReadOnlyPage_dq();
		    Base._setReadOnly("ffxxlr_dq",true);
		    Base._setReadOnly("yad169_dq",false);
		});			
	}				
	//fn_privateContorlYad169();
}
	
	function fn_checkRequired_dq(){
	    var aac002 = Base.getValue("aac002");
	    var aac003 = Base.getValue("aac003");
		var aae145 = Base.getValue("aae145_dq");
		if (aac002 == null || aac002 == ''){
			Base._setReadOnly("aae136_dq",false);
		}else{
			Base.setValue("aae136_dq",aac002);
		}
		
		if (aac003 == null || aac003 == ''){
			Base._setReadOnly("aae133_dq",false);
		}else{
			Base.setValue("aae133_dq",aac003);
		}
	   	if(aae145 == "11"){
	   		Base.setDisRequired(["aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","aae006_dq","aae007_dq","yaf011_dq"]);
	   		Base.setRequired(["aae010_dq","aaf002_dq","aaz009_dq","yaf011_dq"]);
	   		Base._setReadOnly(["aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","yaf011_dq"],false);
	   		Base._setReadOnly(["aae006_dq","aae007_dq"],true);
	   		Base.hideObj(["aae006_dq","aae007_dq"]);
	   		Base.showObj(["aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","yaf011_dq"]); 
	   		Base.setValue("aae010_dq","");	 
	   		Base.setValue("aaf002_dq","");	 
	   		Base.setValue("aaz009_dq","");	
	   		Base.setValue("yaf012_dq","");	 
	   		Base.setValue("yaf013_dq","");	
	   		Base.setValue("yaf001_dq","");	   		
	   		Base.setValue("aae006_dq","");
	   		Base.setValue("aae007_dq","");
	   		Base.setValue("yaf011_dq","0");
	   	}else if(aae145 == "12"){
	   		Base.setDisRequired(["aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","yaf011_dq"]);
	   		Base.setRequired(["aae006_dq","aae007_dq"]);
	   		Base._setReadOnly(["aae006_dq","aae007_dq"],false);
	   		Base._setReadOnly(["aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","yaf011_dq"],true);
	   		Base.showObj(["aae006_dq","aae007_dq"]);
	   		Base.hideObj(["aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","yaf011_dq"]);
	   		Base.setValue("aae010_dq","");	 
	   		Base.setValue("aaf002_dq","");	 
	   		Base.setValue("aaz009_dq","");	
	   		Base.setValue("yaf012_dq","");	 
	   		Base.setValue("yaf013_dq","");	
	   		Base.setValue("yaf001_dq","");	   		
	   		Base.setValue("aae006_dq","");
	   		Base.setValue("aae007_dq","");
	   		Base.setValue("yaf011_dq","");
	   	}else if(aae145 == "14"){
	   		Base.setDisRequired(["aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","aae006_dq","aae007_dq","yaf011_dq"]);
	   		Base.setRequired(["aae010_dq","yaf012_dq","yaf011_dq"]);
	   		Base._setReadOnly(["aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","yaf011_dq"],false);
	   		Base._setReadOnly(["aaf002_dq","aaz009_dq","aae006_dq","aae007_dq"],true);
	   		Base.hideObj(["aaf002_dq","aaz009_dq","aae006_dq","aae007_dq"]);
	   		Base.showObj(["aae010_dq","yaf001_dq","yaf012_dq","yaf013_dq","yaf011_dq"]); 	
	   		Base.setValue("aae010_dq","");	 
	   		Base.setValue("aaf002_dq","");	 
	   		Base.setValue("aaz009_dq","");	
	   		Base.setValue("yaf012_dq","");	 
	   		Base.setValue("yaf013_dq","");	
	   		Base.setValue("yaf001_dq","");	   		
	   		Base.setValue("aae006_dq","");
	   		Base.setValue("aae007_dq","");
	   		Base.setValue("yaf011_dq","0");
	   	}else if(aae145 == "21"){
	   		Base.setDisRequired(["aae010_dq","aaf002_dq","aaz009_dq","yaf001_dq","yaf012_dq","yaf013_dq","aae006_dq","aae007_dq","yaf011_dq"]);
	   		Base._setReadOnly(["aae010_dq","yaf012_dq","yaf011_dq"],false);
	   		Base.showObj(["aae010_dq","yaf012_dq","yaf011_dq"]);	   		
	   		Base.hideObj(["aaf002_dq","aaz009_dq","aae006_dq","aae007_dq"]);
	   		Base.setValue("aae010_dq","");	 
	   		Base.setValue("aaf002_dq","");	 
	   		Base.setValue("aaz009_dq","");	
	   		Base.setValue("yaf012_dq","");	 
	   		Base.setValue("yaf013_dq","");	
	   		Base.setValue("yaf001_dq","");	   		
	   		Base.setValue("aae006_dq","");
	   		Base.setValue("aae007_dq","");
	   		Base.setValue("yaf011_dq","");
	   	}else{
	   		alert("支付方式录入错误！");
	   		return false;
	   	}	
	   	//fn_privateContorlAae145();
	}
	
    function fn_getAAE044_dq(){
		Base.submit("aaf002_dq",myPahth()+"/process/benefit/common/paymentBaseInfoAction!getAAE044.do");
	}
    function fn_getAAE008_dq(){  
        Base.setValue("yaf001_dq","");
		Base.submit("yaf012_dq", myPahth()+"/process/benefit/common/paymentBaseInfoAction!getAAE008.do");
	}
	function fn_setaaf001_dq(){
	   Base.submit("yaf013_dq", myPahth()+"/process/benefit/common/paymentBaseInfoAction!getAf07AAE044.do");
	}
</script>
