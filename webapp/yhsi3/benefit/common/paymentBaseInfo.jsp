<%@ page language="java" pageEncoding="UTF-8"%>
<ta:panel id="ffxxlr" key="发放信息录入" cols="3" >
	<ta:text id="aaa005" key="发放信息录入时间点" labelWidth="130" display="false" />
	<ta:text id="aaz001" key="组织ID" labelWidth="130" display="false" />
	<ta:text id="yaz099" key="组织发放信息ID" labelWidth="130" display="false" />
	<ta:selectInput id="yad169" key="支付对象" required="true" labelWidth="130" collection="YAD169" value="11" onSelect="fn_checkbankzs"/>
	<ta:selectInput id="aae145" key="支付方式" required="true" labelWidth="130" collection="AAE145" onSelect="checkRequired" filter="11,14" reverseFilter="true"/>
	<ta:selectInput id="aac059" key="领取人证件类型" required="true" labelWidth="130" collection="AAC059" value="1" display="true"/>
	<ta:text id="aae136" key="领取人证件号" required="true" labelWidth="130"/>
	<ta:text id="aae133" key="领取人姓名" required="true" labelWidth="130"/>
	<ta:text id="aae010" key="银行账号" required="true" labelWidth="130"/>	
	<ta:selectInput id="aaf002" key="代发银行类别" collection="AAF002" required="true" onSelect="getAAE044" maxVisibleRows="8" labelWidth="130" display="false"/>
	<ta:selectInput id="aaz009" key="代发机构名称" required="true" maxVisibleRows="8" allowInputOtherText="true" labelWidth="130" display="false"/>
	<ta:selectInput id="yaf012" key="开户银行类别" collection="AAF002" required="true" onSelect="getAAE008" maxVisibleRows="8" labelWidth="130"/>
	<ta:selectInput id="yaf013" key="开户银行编号" onSelect="fnsetaaf001" showKey="true" maxVisibleRows="8" allowInputOtherText="true" labelWidth="130" widthPercentage="150%"/>
	<ta:text id="yaf001" key="开户银行名称" labelWidth="130"/>	
	<ta:selectInput id="yaf011" key="开户银行异地标志" required="true" labelWidth="130" collection="YAF011" value="0"/>
	<ta:text id="aae007" key="邮政编码" maxLength="6" readOnly="true" labelWidth="130" display="false"/>
	<ta:text id="aae006" key="详细地址" span="2" readOnly="true" labelWidth="130" display="false"/>
</ta:panel>
<script type="text/javascript">
	$(document).ready(function() {
		var yad169 = Base.getValue("yad169");
		if (yad169 == "11"){
			Base.showObj("aac059");
		}else{
			Base.hideObj("aac059");
		}		

		Base.submit("aae140",myPath()+"/process/benefit/common/paymentBaseInfoAction!Getaae145.do",null,null,null,function(data){
			fn_setPaymentInfoPage();
		});			
	});	

	function fn_checkbankzs(){
		var yad169 = Base.getValue("yad169");
	    var aaa121 = Base.getValue("aaa121");
		var aac002 = Base.getValue("aac002");
	    var aac003 = Base.getValue("aac003");	    
		
		if (yad169 != "11"){
			Base.setValue("aae145","");			
			Base.setValue("aac059","");
			Base.setValue("aae136","");
			Base.setValue("aae133","");
	   		Base.setValue("aae010","");			
	   		Base.setValue("aaf002","");	
	   		Base.setValue("aaz009","");
	   		Base.setValue("yaf001","");
	   		Base.setValue("yaf013","");
	   		Base.setValue("yaf012","");		
	   		Base.setValue("aae007","");
			Base.setValue("aae006","");	
			Base.setValue("yaz099","");
			Base.setValue("yaf011","");
		}else{
			Base.setValue("aac059","1");
			Base.setValue("aae136",aac002);
			Base.setValue("aae133",aac003);			
		}		
		
		if (aaa121 != "G50002" && aaa121 != "I50002" &&
			aaa121 != "J50002" && aaa121 != "L10025" &&	
			aaa121 != "M10025" && aaa121 != "I40005" &&
			aaa121 != "G40005" && aaa121 != "J40005" &&
			aaa121 != "L10023" && aaa121 != "M10010" ){
				fn_FfxxlrInitialization();
			}		
		
		if (yad169 == "11"){
			Base.setValue("aae145","");			
			Base.setValue("aac059","1");
//			Base.setValue("aae136","");
//			Base.setValue("aae133","");
	   		Base.setValue("aae010","");			
	   		Base.setValue("aaf002","");	
	   		Base.setValue("aaz009","");
	   		Base.setValue("yaf001","");
	   		Base.setValue("yaf013","");
	   		Base.setValue("yaf012","");		
	   		Base.setValue("aae007","");
			Base.setValue("aae006","");
			Base.setValue("yaz099","");
			Base.setValue("yaf011","");			
			//Base.filterSelectInput("aae145",["11","14"],true);
			Base.setDisRequired(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013","aae006","aae007"]);
			Base._setReadOnly(["aae133","aae136","aac059","aae145","aae010","aaf002","aaz009","yaf001","yaf012","yaf013","aae006","aae007","yaf011"],false);
			Base.showObj(["aae133","aae136","aac059","aae145","aaf002","aaz009","aae010","yaf012","yaf013","yaf001","aae006","aae007","yaf011"]);
		}else{
			//Base.filterSelectInput("aae145",["11","12","14","21"],true);	
			var yaz099 = fn_privateContorlYaz099();
			var aaz001 = fn_privateContorlAaz001();
			if(yaz099 == null || yaz099 == ""){
				if(aaz001 != null && aaz001 != ""){
					Base.setValue("aaz001",aaz001);
				}else{
					aaz001 = Base.getValue("aaz001");
				}
				var aae140 = Base.getValue("aae140");
				var aaa121 = Base.getValue("aaa121");
				if(aaz001 == null || aaz001 == ""){
				  alert("组织ID为空！");
				  Base.setValue("yad169","");
				  return false;
				}
				if(aae140 == null || aae140 == ""){
					  alert("险种类型为空！");
					  Base.setValue("yad169","");
					  return false;
					}
				if(aaa121 == null || aaa121 == ""){
//					  alert("业务编码为空！");
//					  Base.setValue("yad169","");
//					  return false;
					}		
				Base.hideObj(["aae133","aae136","aae145","aac059","aaf002","aaz009","aae010","yaf012","yaf013","yaf001","aae007","aae006","yaf011"]);
				Base.submit("ffxxlr,aae140,aaa121",myPath()+"</process/benefit/common/paymentBaseInfoAction!GetAe31InfoByaaz001.do",null,null,null,function(data){
					fn_setPaymentInfoReadOnlyPage();
				    Base._setReadOnly("ffxxlr",true);
				    Base._setReadOnly("yad169",false);
				});					
			}else{
				Base.setValue("yaz099",yaz099);
				Base.setValue("aaz001",aaz001);
				Base.hideObj(["aae133","aae136","aae145","aac059","aaf002","aaz009","aae010","yaf012","yaf013","yaf001","aae007","aae006","yaf011"]);
				Base.submit("ffxxlr,aae140,aaa121",myPath()+"/process/benefit/common/paymentBaseInfoAction!GetAe31InfoByyaz099.do",null,null,null,function(data){
					fn_setPaymentInfoReadOnlyPage();
				    Base._setReadOnly("ffxxlr",true);
				    Base._setReadOnly("yad169",false);
				});						
			}
		
		}				
		fn_privateContorlYad169();
	}
	
	function checkRequired(){
	    var aac002 = Base.getValue("aac002");
	    var aac003 = Base.getValue("aac003");
		var aae145 = Base.getValue("aae145");
		if (aac002 == null || aac002 == ''){
			Base._setReadOnly("aae136",false);
		}else{
			Base.setValue("aae136",aac002);
		}
		
		if (aac003 == null || aac003 == ''){
			Base._setReadOnly("aae133",false);
		}else{
			Base.setValue("aae133",aac003);
		}
	   	if(aae145 == "11"){
	   		Base.setDisRequired(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013","aae006","aae007","yaf011"]);
	   		Base.setRequired(["aae010","aaf002","aaz009","yaf011"]);
	   		Base._setReadOnly(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013","yaf011"],false);
	   		Base._setReadOnly(["aae006","aae007"],true);
	   		Base.hideObj(["aae006","aae007"]);
	   		Base.showObj(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013","yaf011"]); 
//	   		Base.setValue("aae010","");	 
	   		Base.setValue("aaf002","");	 
	   		Base.setValue("aaz009","");	
	   		Base.setValue("yaf012","");	 
	   		Base.setValue("yaf013","");	
	   		Base.setValue("yaf001","");	   		
	   		Base.setValue("aae006","");
	   		Base.setValue("aae007","");
	   		Base.setValue("yaf011","0");
	   	}else if(aae145 == "12"){
	   		Base.setDisRequired(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013","yaf011"]);
	   		Base.setRequired(["aae006","aae007"]);
	   		Base._setReadOnly(["aae006","aae007"],false);
	   		Base._setReadOnly(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013","yaf011"],true);
	   		Base.showObj(["aae006","aae007"]);
	   		Base.hideObj(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013","yaf011"]);
	   		Base.setValue("aae010","");	 
	   		Base.setValue("aaf002","");	 
	   		Base.setValue("aaz009","");	
	   		Base.setValue("yaf012","");	 
	   		Base.setValue("yaf013","");	
	   		Base.setValue("yaf001","");	   		
	   		Base.setValue("aae006","");
	   		Base.setValue("aae007","");
	   		Base.setValue("yaf011","");
	   	}else if(aae145 == "14"){
	   		Base.setDisRequired(["aae010","yaf001","yaf012","yaf013","aae006","aae007","yaf011"]);
	   		Base.setRequired(["aae010","yaf011","yaf012"]);
	   		Base._setReadOnly(["aae010","yaf001","yaf012","yaf013","yaf011"],false);
	   		Base._setReadOnly(["aae006","aae007"],true);
	   		Base.hideObj(["aae006","aae007","aaf002","aaz009"]);
	   		Base.showObj(["aae010","yaf001","yaf012","yaf013","yaf011"]); 
//	   		Base.setValue("aae010","");	 
	   		Base.setValue("aaf002","");	 
	   		Base.setValue("aaz009","");	
	   		Base.setValue("yaf012","");	 
	   		Base.setValue("yaf013","");	
	   		Base.setValue("yaf001","");	   		
	   		Base.setValue("aae006","");
	   		Base.setValue("aae007","");
	   		Base.setValue("yaf011","0");
	   	}else if(aae145 == "21"){
	   		Base.setDisRequired(["aae010","aaf002","aaz009","yaf001","yaf012","yaf013","aae006","aae007","yaf011"]);
	   		Base._setReadOnly(["aae010","yaf012","yaf011"],false);
	   		Base.showObj(["aae010","yaf012","yaf011"]);	   		
	   		Base.hideObj(["aaf002","aaz009","aae006","aae007"]);
	   		Base.setValue("aae010","");	 
	   		Base.setValue("aaf002","");	 
	   		Base.setValue("aaz009","");	
	   		Base.setValue("yaf012","");	 
	   		Base.setValue("yaf013","");	
	   		Base.setValue("yaf001","");	   		
	   		Base.setValue("aae006","");
	   		Base.setValue("aae007","");
	   		Base.setValue("yaf011","");
	   	}else{
	   		alert("支付方式录入错误！");
	   		return false;
	   	}	
	   	fn_privateContorlAae145();
	}
	
    function getAAE044(){
    	var aaf002 = Base.getValue("aaf002");
    	var aae140 = Base.getValue("aae140");
    	if(aae140 == '110' || aae140 == '210'){
	    	if(aaf002 == '95580' || aaf002 == '96688'){
	    		Base.setValue("aae145", "11");
	        	checkRequired();    	
	        	Base.setValue("aaf002", aaf002);
	    	}else{
	    		Base.setValue("aae145", "14");
	        	checkRequired();    	
	        	Base.setValue("yaf012", aaf002);   
	        	getAAE008();
	        	return;
	    	}   
        } 
		Base.submit("aaf002,aae140",myPath()+"/process/benefit/common/paymentBaseInfoAction!getAAE044.do",null,null,null,
				function(data){
			   Base.submit(null, myPath()+"/process/benefit/common/paymentBaseInfoAction!getAAE008.do",{"dto['yaf012']":Base.getValue("aaf002")});
			                   });
	}
    function getAAE008(){    
    	var yaf012 = Base.getValue("yaf012");
    	var aae140 = Base.getValue("aae140");
    	if(aae140 == '110' || aae140 == '210'){
	    	if(yaf012 == '95580' || yaf012 == '96688'){
	    		Base.setValue("aae145", "11");
	        	checkRequired();    	
	        	Base.setValue("yaf012", yaf012);
	        	Base.setValue("aaf002", yaf012);
	        	getAAE044();
	        	return;
	    	}else{
	    		Base.setValue("aae145", "14");
	        	checkRequired();    	
	        	Base.setValue("yaf012", yaf012);    		
	    	}
    	}
        Base.setValue("yaf001","");
		Base.submit("yaf012", myPath()+"/process/benefit/common/paymentBaseInfoAction!getAAE008.do");
	}
	function fnsetaaf001(){
	   Base.submit("yaf013", myPath()+"/process/benefit/common/paymentBaseInfoAction!getAf07AAE044.do");
	}
</script>
