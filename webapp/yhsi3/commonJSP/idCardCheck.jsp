<!-- 险种类型选择 -->
<%@ page language="java" pageEncoding="UTF-8"%>
    <ta:selectInput id="aac058" key="证件类型" collection="aac058"  required="true" labelWidth="120" selectFirstValue="true" onSelect="checkaac058"/>
    <ta:text id="aac002" key="证件号码"   required="true" maxLength="18" labelWidth="120" onChange="fnChange(Base.getValue('aac002'))"/>
<script type="text/javascript">
	//判断证件类型 
	function checkaac058(){
		var aac058 = Base.getValue("aac058");
		Base.setValue("aac002","");
		if(aac058!="1"){
			Base.setValue("aac002","");
			Base.setValue("aac004","");
			Base.setValue("aac006","");
		}
	}
	
	//根据身份证获取出生日期和性别
	function fnChange(idCard){
		var birthday = Base.getIdCardBirthday(idCard);
		var strs= new Array();
		var aac058 = Base.getValue("aac058");
		
		//证件类型为身份证相关才检验
		var sex ;
		if(aac058==1){		
		var checkFlag = new clsIDCard(idCard);
        if (!checkFlag.IsValid()) {
           Base.alert("输入的身份证号无效,请输入真实的身份证号！");  
           Base.setReadOnly("form1");
           Base.setEnable("aac058,aac002");
           //Base.setValue("aac002","");
           Base.setValue("aac004","");
           Base.setValue("aac006","");
 		   Base.focus("aac002");        
           return ;
        }
		strs=birthday.split("-");
		var month = strs[1];
		var day = strs[2];
		var year = strs[0];
		if(parseInt(month)<10){
			month = "0" + month;
		}
		if(parseInt(day)<10){
			day = "0" + day;
		}
		birthday = year + "-" + month + "-" + day;
		Base.setValue("aac006",birthday);
		//性别判断
		var gender;
		
        if(idCard.length == 18) {
                gender = idCard.substr(16, 1);
        }else if(idCard.length != 18){
        	//Base.setValue("aac002","");
        	Base.setValue("aac004","");
        	Base.setValue("aac006","");
        	Base.focus("aac002");
        	alert("身份证格式不对，只能录入18位有效的身份证！");
        	return ;
        }
        
        sex = gender % 2 == 0 ? '2' : '1';
		Base.setValue("aac004",sex);
		}
		Base.submit('aac002,aac058','registerEmployeeAction!toCheckAac002.do',{"dto['aac006']":birthday,"dto['aac004']":sex},null,false,null,function(){
		    Base.openWindow("ourWin","参保信息详情",myPath()+"/process/publicBusiness/manageEmployee/registeremployee/registerEmployeeEditAction.do",{"dto['aac002']":idCard,"dto['aac058']":aac058},"95%","90%",null,null,true);
		});
		Base.setEnable("aac006,aac007");
	}
	
	// 构造函数，变量为15位或者18位的身份证号码	
	function clsIDCard(CardNo) {
	  this.Valid=false;
	  this.ID15='';
	  this.ID18='';
	  this.Local='';
	  if(CardNo!=null)this.SetCardNo(CardNo);
	}
		
	// 设置身份证号码，15位或者18位
	clsIDCard.prototype.SetCardNo = function(CardNo) {
	  this.ID15='';
	  this.ID18='';
	  this.Local='';
	  CardNo=CardNo.replace(" ","");
	  var strCardNo;
	  if(CardNo.length==18) {
	    pattern= /^\d{17}(\d|x|X)$/;
	    if (pattern.exec(CardNo)==null)return;
	    strCardNo=CardNo.toUpperCase();
	  } else {
	    pattern= /^\d{15}$/;
	    if (pattern.exec(CardNo)==null)return;
	    strCardNo=CardNo.substr(0,6)+'19'+CardNo.substr(6,9)
	    strCardNo+=this.GetVCode(strCardNo);
	  }
	  this.Valid=this.CheckValid(strCardNo);
	}
	// 校验身份证有效性
	clsIDCard.prototype.IsValid = function() {
	  return this.Valid;
	}
	// 返回生日字符串，格式如下，1981-10-10
	clsIDCard.prototype.GetBirthDate = function() {
	  var BirthDate='';
	  if(this.Valid)BirthDate=this.GetBirthYear()+'-'+this.GetBirthMonth()+'-'+this.GetBirthDay();
	  return BirthDate;
	}
	// 返回生日中的年，格式如下，1981
	clsIDCard.prototype.GetBirthYear = function() {
	  var BirthYear='';
	  if(this.Valid)BirthYear=this.ID18.substr(6,4);
	  return BirthYear;
	}
	// 返回生日中的月，格式如下，10
	clsIDCard.prototype.GetBirthMonth = function() {
	  var BirthMonth='';
	  if(this.Valid)BirthMonth=this.ID18.substr(10,2);
	  if(BirthMonth.charAt(0)=='0')BirthMonth=BirthMonth.charAt(1);
	  return BirthMonth;
	}
	// 返回生日中的日，格式如下，10
	clsIDCard.prototype.GetBirthDay = function() {
	  var BirthDay='';
	  if(this.Valid)BirthDay=this.ID18.substr(12,2);
	  return BirthDay;
	}
	// 返回性别，1：男，0：女
	clsIDCard.prototype.GetSex = function() {
	  var Sex='';
	  if(this.Valid)Sex=this.ID18.charAt(16)%2;
	  return Sex;
	}
	// 返回15位身份证号码
	clsIDCard.prototype.Get15 = function() {
	  var ID15='';
	  if(this.Valid)ID15=this.ID15;
	  return ID15;
	}
	// 返回18位身份证号码
	clsIDCard.prototype.Get18 = function() {
	  var ID18='';
	  if(this.Valid)ID18=this.ID18;
	  return ID18;
	}
	// 返回所在省，例如：上海市、浙江省
	clsIDCard.prototype.GetLocal = function() {
	  var Local='';
	  if(this.Valid)Local=this.Local;
	  return Local;
	}
	clsIDCard.prototype.GetVCode = function(CardNo17) {
	  var Wi = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);
	  var Ai = new Array('1','0','X','9','8','7','6','5','4','3','2');
	  var cardNoSum = 0;
	  for (var i=0; i<CardNo17.length; i++)cardNoSum+=CardNo17.charAt(i)*Wi[i];
	  var seq = cardNoSum%11;
	  return Ai[seq];
	}
	clsIDCard.prototype.CheckValid = function(CardNo18) {
	  if(this.GetVCode(CardNo18.substr(0,17))!=CardNo18.charAt(17))return false;
	  if(!this.IsDate(CardNo18.substr(6,8)))return false;
	  var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};
	  if(aCity[parseInt(CardNo18.substr(0,2))]==null)return false;
	  this.ID18=CardNo18;
	  this.ID15=CardNo18.substr(0,6)+CardNo18.substr(8,9);
	  this.Local=aCity[parseInt(CardNo18.substr(0,2))];
	  return true;
	}
	clsIDCard.prototype.IsDate = function(strDate) {
	  var r = strDate.match(/^(\d{1,4})(\d{1,2})(\d{1,2})$/);
	  if(r==null)return false;
	  var d= new Date(r[1], r[2]-1, r[3]);
	  return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[2]&&d.getDate()==r[3]);
	}
	
</script>
