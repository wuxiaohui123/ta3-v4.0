<%@ page language="java" pageEncoding="UTF-8"%>
<!-- 转移人员基本信息 -->
<ta:text id="aab004" key="转出单位名称" readOnly="true" labelWidth="300" span="2" required="true" />
<ta:date id="aac007" key="参加工作时间" readOnly="true" showSelectPanel="true" issue="true" labelWidth="300" required="true" />
<ta:date id="aab305" key="首次参保地实行个人缴费时间" readOnly="true" showSelectPanel="true" issue="true" labelWidth="300" required="true" />
<ta:date id="aac049" key="本人首次缴费时间" readOnly="true" showSelectPanel="true" issue="true" labelWidth="300" required="true" onChange="fnAac049()" />
<ta:date id="aac032" key="本人建立个人账户时间" readOnly="true" showSelectPanel="true" issue="true" labelWidth="300" required="true" />
<ta:date id="aae030" key="在本地缴费起始时间" readOnly="true" showSelectPanel="true" issue="true" labelWidth="300" required="true" onChange="fnAae03031()" />
<ta:date id="aae031" key="在本地缴费终止时间" readOnly="true" showSelectPanel="true" issue="true" labelWidth="300" required="true" onChange="fnAae03031()" />
<ta:number id="aae201" key="在本地实际缴费月数" readOnly="true" labelWidth="300" min="0" max="99999" required="true" />
<ta:date id="aae035" key="转移时间" readOnly="true" showSelectPanel="true"  labelWidth="300" required="true" />
<script type="text/javascript">
	
	//通过本人首次缴费时间默认个人账户建立时间 本地缴费开始时间
    function fnAac049(){        
        var aac049 = Base.getValue('aac049'); //本人首次缴费时间
        if(aac049 != null || aac049 != ''){
            Base.setValue('aac032', aac049); //本人建立个人账户时间
            Base.setValue('aae030', aac049); //在本地缴费起始时间     
            Base.focus('aae031');                   
        }
    } 
    	
    //缴费起止时间校验 且获取缴费总月数
    function fnAae03031(){
        var aae031 = Base.getValue('aae031'); //在本地缴费终止时间 
        var aae030 = Base.getValue('aae030'); //在本地缴费起始时间           
        if((aae031 != null || aae031 != '') && 
              (aae030 != null || aae030 != '')){
            if(aae030 > aae031){
                alert('本地缴费终止时间['+aae031+']早于本地缴费起始时间['+aae030+']!');
                Base.setValue('aae031','');
                Base.setValue('aae201','');                
                Base.focus('aae031');      
                return;
            }else{
                 var allMonths = 0;
	             var beginYearsOfMonths = parseInt(aae030.substring(0,4)) * 12 + parseInt(aae030.substring(4,6));
	             var endYearsOfMonths = parseInt(aae031.substring(0,4)) * 12 + parseInt(aae031.substring(4,6));             
                 allMonths = endYearsOfMonths - beginYearsOfMonths + 1
                 Base.setValue('aae201', allMonths);
                 Base.focus('aae201');    
            }
        }
    }
</script>