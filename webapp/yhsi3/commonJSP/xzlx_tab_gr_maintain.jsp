<%@ page language="java" pageEncoding="UTF-8"%>
<ta:tab id="tab_110" key="企业养老">
	<ta:box cols="3">
		<ta:text id="aab050_110" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aac066_110" key="参保身份" collection="aac066" labelWidth="120" filter="2" required="true" selectFirstValue="true" display="false"/>
		<ta:selectInput id="aac013_110" key="用工形式" required="true" collection="aac013" labelWidth="120" selectFirstValue="true" display="false"/>
		<ta:date id="aae206_110" key="建账年月" onChange="checkAae206('110','aae206_110')" showSelectPanel="true" required="true" labelWidth="120" issue="true"/>
		<ta:date id="aac049_110" key="首次参保年月" onBlur="checkAac049('110','aac049_110')" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
		<ta:selectInput id="yaz289_110" key="征缴规则" labelWidth="120" required="true" collection="YAZ289" />
		<ta:selectInput id="aaz136_110" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
		<ta:selectInput id="ykc005_110" key="特殊人员类型"  labelWidth="120"  required="true" onSelect="setykc006"/>
		<ta:selectInput id="ykc006_110" key="特殊人员类别"  labelWidth="120"  required="true" />
		<ta:date id="aac030_110" key="个人参保日期" onChange="checkAac030('110','aac030_110')" showSelectPanel="true" labelWidth="120" required="true" />
		<ta:date id="aac030_110_now" key="个人参保日期" labelWidth="120" display="false"/>
		<ta:date id="yae097_110" key="最大做账期号" display="false" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkYae097('yae097_110')" />
		<ta:date id="ajc050_110" key="首次参保年月" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
	</ta:box>
</ta:tab>

<ta:tab id="tab_120" key="机关养老">
	<ta:box cols="3">
		<ta:text id="aab050_120" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aac066_120" key="参保身份" collection="aac066" labelWidth="120" filter="2" required="true" selectFirstValue="true" display="false"/>
		<ta:selectInput id="aac013_120" key="用工形式" required="true" collection="aac013" labelWidth="120" selectFirstValue="true" display="false"/>
		<ta:date id="aae206_120" key="建账年月" onChange="checkAae206('120','aae206_120')" showSelectPanel="true" required="true" labelWidth="120" issue="true"/>
		<ta:date id="aac049_120" key="首次参保年月" onBlur="checkAac049('120','aac049_120')" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
		<ta:selectInput id="yaz289_120" key="征缴规则" labelWidth="120" required="true" collection="YAZ289" />
		<ta:selectInput id="aaz136_120" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
		<ta:selectInput id="ykc005_120" key="特殊人员类型"  labelWidth="120"  required="true" onSelect="setykc006"/>
		<ta:selectInput id="ykc006_120" key="特殊人员类别"  labelWidth="120"  required="true" />
		<ta:date id="aac030_120" key="个人参保日期" onChange="checkAac030('120','aac030_120')" showSelectPanel="true" labelWidth="120" required="true" />
		<ta:date id="aac030_120_now" key="个人参保日期" labelWidth="120" display="false"/>
		<ta:date id="yae097_120" key="最大做账期号" display="false" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkYae097('yae097_120')" />
		<ta:date id="ajc050_120" key="首次参保年月" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
	</ta:box>
</ta:tab>

<ta:tab id="tab_210" key="失业">
	<ta:box cols="3">
		<ta:text id="aab050_210" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aac066_210" key="参保身份" collection="aac066" labelWidth="120" filter="2" required="true" selectFirstValue="true" display="false"/>
		<ta:selectInput id="aac013_210" key="用工形式" required="true" collection="aac013" labelWidth="120" selectFirstValue="true" display="false"/>
		<ta:date id="aac049_210" key="首次参保年月" showSelectPanel="true" onBlur="checkAac049('210','aac049_210')" required="true" labelWidth="120" display="false"/>
		<ta:selectInput id="yaz289_210" key="征缴规则" labelWidth="120" required="true" collection="YAZ289" />
		<ta:selectInput id="aaz136_210" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
		<ta:selectInput id="ykc005_210" key="特殊人员类型"  labelWidth="120"  required="true" onSelect="setykc006"/>
		<ta:selectInput id="ykc006_210" key="特殊人员类别"  labelWidth="120"   required="true"/>
		<ta:date id="aac030_210" key="个人参保日期" showSelectPanel="true" onChange="checkAac030('210','aac030_210')" labelWidth="120" required="true" />
		<ta:date id="aac030_210_now" key="个人参保日期" labelWidth="120" display="false"/>
		<ta:date id="yae097_210" key="最大做账期号" display="false" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkYae097('yae097_210')" />
		<ta:date id="ajc050_210" key="首次参保年月" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
	</ta:box>
</ta:tab>

<ta:tab id="tab_310" key="基本医疗">
	<ta:box cols="3">
		<ta:text id="aab050_310" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aac066_310" key="参保身份" collection="aac066" labelWidth="120" filter="2" required="true" selectFirstValue="true" display="false"/>
		<ta:selectInput id="aac013_310" key="用工形式" required="true" collection="aac013" labelWidth="120" selectFirstValue="true" display="false"/>
		<ta:date id="aac049_310" key="首次参保年月" showSelectPanel="true" required="true" onBlur="checkAac049('310','aac049_310')" labelWidth="120" display="false"/>
		<ta:selectInput id="yaz289_310" key="征缴规则" labelWidth="120" required="true" collection="YAZ289" />
		<ta:selectInput id="aaz136_310" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
		<ta:selectInput id="ykc005_310" key="特殊人员类型"  labelWidth="120"  required="true" onSelect="setykc006"/>
		<ta:selectInput id="ykc006_310" key="特殊人员类别"  labelWidth="120"  required="true" />
		<ta:date id="aac030_310" key="个人参保日期" showSelectPanel="true" labelWidth="120" onChange="checkAac030('310','aac030_310')" required="true" />
		<ta:date id="aac030_310_now" key="个人参保日期" labelWidth="120" display="false"/>
		<ta:date id="yae097_310" key="最大做账期号" display="false" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkYae097('yae097_310')" />
		<ta:date id="ajc050_310" key="首次参保年月" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
	</ta:box>
</ta:tab>

<ta:tab id="tab_320" key="公务员补充">
	<ta:box cols="3">
		<ta:text id="aab050_320" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aac066_320" key="参保身份" collection="aac066" labelWidth="120" filter="2" required="true" selectFirstValue="true" display="false"/>
		<ta:selectInput id="aac013_320" key="用工形式" required="true" collection="aac013" labelWidth="120" selectFirstValue="true" display="false"/>
		<ta:date id="aac049_320" key="首次参保年月" onBlur="checkAac049('320','aac049_320')" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
		<ta:selectInput id="yaz289_320" key="征缴规则" labelWidth="120" required="true" collection="YAZ289" />
		<ta:selectInput id="aaz136_320" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
		<ta:selectInput id="ykc005_320" key="特殊人员类型"  labelWidth="120"  required="true" onSelect="setykc006"/>
		<ta:selectInput id="ykc006_320" key="特殊人员类别"  labelWidth="120"  required="true" />
		<ta:date id="aac030_320" key="个人参保日期" onChange="checkAac030('320','aac030_320')" showSelectPanel="true" labelWidth="120" required="true" />
		<ta:date id="aac030_320_now" key="个人参保日期" labelWidth="120" display="false"/>
		<ta:date id="yae097_320" key="最大做账期号" display="false" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkYae097('yae097_310')" />
		<ta:date id="ajc050_320" key="首次参保年月" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
	</ta:box>
</ta:tab>

<ta:tab id="tab_330" key="大额医疗">
	<ta:box cols="3">
		<ta:text id="aab050_330" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aac066_330" key="参保身份" collection="aac066" labelWidth="120" filter="2" required="true" selectFirstValue="true" display="false"/>
		<ta:selectInput id="aac013_330" key="用工形式" required="true" collection="aac013" labelWidth="120" selectFirstValue="true" display="false"/>
		<ta:date id="aac049_330" key="首次参保年月" onBlur="checkAac049('330','aac049_330')" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
		<ta:selectInput id="yaz289_330" key="征缴规则" labelWidth="120" required="true" collection="YAZ289" />
		<ta:selectInput id="aaz136_330" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
		<ta:selectInput id="ykc005_330" key="特殊人员类型"  labelWidth="120"  required="true" onSelect="setykc006"/>
		<ta:selectInput id="ykc006_330" key="特殊人员类别"  labelWidth="120"  required="true" />
		<ta:date id="aac030_330" key="个人参保日期" onChange="checkAac030('330','aac030_330')" showSelectPanel="true" labelWidth="120" required="true" />
		<ta:date id="aac030_330_now" key="个人参保日期" labelWidth="120" display="false"/>
		<ta:date id="yae097_330" key="最大做账期号" display="false" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkYae097('yae097_310')" />
		<ta:date id="ajc050_330" key="首次参保年月" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
	</ta:box>
</ta:tab>

<ta:tab id="tab_340" key="离休二乙">
	<ta:box cols="3">
		<ta:text id="aab050_340" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aac066_340" key="参保身份" collection="aac066" labelWidth="120" filter="2" required="true" selectFirstValue="true" display="false"/>
		<ta:selectInput id="aac013_340" key="用工形式" required="true" collection="aac013" labelWidth="120" selectFirstValue="true" display="false"/>
		<ta:date id="aac049_340" key="首次参保年月" onBlur="checkAac049('340','aac049_340')" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
		<ta:selectInput id="yaz289_340" key="征缴规则" labelWidth="120" required="true" collection="YAZ289" />
		<ta:selectInput id="aaz136_340" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
		<ta:selectInput id="ykc005_340" key="特殊人员类型"  labelWidth="120"  required="true" onSelect="setykc006"/>
		<ta:selectInput id="ykc006_340" key="特殊人员类别"  labelWidth="120"   required="true"/>
		<ta:date id="aac030_340" key="个人参保日期" onChange="checkAac030('340','aac030_340')" showSelectPanel="true" labelWidth="120" required="true" />
		<ta:date id="aac030_340_now" key="个人参保日期" labelWidth="120" display="false"/>
		<ta:date id="yae097_340" key="最大做账期号" display="false" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkYae097('yae097_310')" />
		<ta:date id="ajc050_340" key="首次参保年月" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
	</ta:box>
</ta:tab>



<ta:tab id="tab_370" key="企业补充">
	<ta:box cols="3">
		<ta:text id="aab050_370" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aac066_370" key="参保身份" collection="aac066" labelWidth="120" filter="2" required="true" selectFirstValue="true" display="false"/>
		<ta:selectInput id="aac013_370" key="用工形式" required="true" collection="aac013" labelWidth="120" selectFirstValue="true" display="false"/>
		<ta:date id="aac049_370" key="首次参保年月" onBlur="checkAac049('370','aac049_370')" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
		<ta:selectInput id="yaz289_370" key="征缴规则" labelWidth="120" required="true" collection="YAZ289" />
		<ta:selectInput id="aaz136_370" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
		<ta:selectInput id="ykc005_370" key="特殊人员类型"  labelWidth="120"  required="true" onSelect="setykc006"/>
		<ta:selectInput id="ykc006_370" key="特殊人员类别"  labelWidth="120"  required="true" />
		<ta:date id="aac030_370" key="个人参保日期" onChange="checkAac030('370','aac030_370')" showSelectPanel="true" labelWidth="120" required="true" />
		<ta:date id="aac030_370_now" key="个人参保日期" labelWidth="120" display="false"/>
		<ta:date id="yae097_370" key="最大做账期号" display="false" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkYae097('yae097_310')" />
		<ta:date id="ajc050_370" key="首次参保年月" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
	</ta:box>
</ta:tab>

<ta:tab id="tab_410" key="工伤保险">
	<ta:box cols="3">
		<ta:text id="aab050_410" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aac066_410" key="参保身份" collection="aac066" labelWidth="120" filter="2" required="true" selectFirstValue="true" display="false"/>
		<ta:selectInput id="aac013_410" key="用工形式" required="true" collection="aac013" labelWidth="120" selectFirstValue="true" display="false"/>
		<ta:date id="aac049_410" key="首次参保年月" onBlur="checkAac049('410','aac049_410')" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
		<ta:selectInput id="yaz289_410" key="征缴规则" labelWidth="120" required="true" collection="YAZ289" />
		<ta:selectInput id="aaz136_410" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
		<ta:selectInput id="ykc005_410" key="特殊人员类型"  labelWidth="120"  required="true" onSelect="setykc006"/>
		<ta:selectInput id="ykc006_410" key="特殊人员类别"  labelWidth="120"  required="true" />
		<ta:date id="aac030_410" key="个人参保日期" onChange="checkAac030('410','aac030_410')" showSelectPanel="true" labelWidth="120" required="true" />
		<ta:date id="aac030_410_now" key="个人参保日期" labelWidth="120" display="false"/>
		<ta:date id="yae097_410" key="最大做账期号" display="false" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkYae097('yae097_410')" />
		<ta:date id="ajc050_410" key="首次参保年月" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
	</ta:box>
</ta:tab>

<ta:tab id="tab_510" key="生育保险">
	<ta:box cols="3">
		<ta:text id="aab050_510" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aac066_510" key="参保身份" collection="aac066" labelWidth="120" filter="2" required="true" selectFirstValue="true" display="false"/>
		<ta:selectInput id="aac013_510" key="用工形式" required="true" collection="aac013" labelWidth="120" selectFirstValue="true" display="false"/>
		<ta:date id="aac049_510" key="首次参保年月" onBlur="checkAac049('510','aac049_510')" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
		<ta:selectInput id="yaz289_510" key="征缴规则" labelWidth="120" required="true" collection="YAZ289" />
		<ta:selectInput id="aaz136_510" key="基数核定规则" labelWidth="120" required="true" collection="AAZ136" />
		<ta:selectInput id="ykc005_510" key="特殊人员类型"  labelWidth="120"  required="true" onSelect="setykc006"/>
		<ta:selectInput id="ykc006_510" key="特殊人员类别"  labelWidth="120"  required="true" />
		<ta:date id="aac030_510" key="个人参保日期" onChange="checkAac030('510','aac030_510')" showSelectPanel="true" labelWidth="120" required="true" />
		<ta:date id="aac030_510_now" key="个人参保日期" labelWidth="120" display="false"/>
		<ta:date id="yae097_510" key="最大做账期号" display="false" showSelectPanel="true" labelWidth="120" issue="true" onChange="checkYae097('yae097_510')" />
		<ta:date id="ajc050_510" key="首次参保年月" showSelectPanel="true" required="true" labelWidth="120" display="false"/>
	</ta:box>
</ta:tab>
<script type="text/javascript">
	function checkAac030(aae140, id) {
		var aac049 = Base.getValue("aac049_" + aae140);
		var aac030 = Base.getValue(id);

		if (aac030 != "" && aac049 != "") {
			if (aac030<aac049) {
				Base.alert("个人参保日期不能早于首次参保年月");
				Base.setValue(id, Base.getValue(id+"_now"));
			}else{
			    Base.submit("aac001",myPath() + "/process/publicBusiness/comm/publicBusinessAction!checkAac030.do",{"dto['aae140']":aae140,"dto['aac030']":aac030},null,false,
				    function(){
				        //成功回调
		                Base.setValue("yae097_"+aae140,fnIssue1(yae097));
				    },function(){
				        //失败回调
				        var aac030_now = Base.getValue(id+"_now");
				        var aac030 = Base.getValue(id);
				        if(aac030_now<aac030){
				            alert("个人已存在实缴或者欠缴信息，更改后的参保时间不能大于现在的参保时间");
				            Base.setValue(id,aac030_now);
				            return;
				        }
				    });
			}
			
		}

	}
	function checkAac049(aae140, id) {
	    var aac007 = Base.getValue('aac007');//参加工作日期
	    var ajc050 = Base.getValue('ajc050');//本次参加工作日期
		var aac049 = Base.getValue(id);
		var aac030 = Base.getValue("aac030_"+aae140);
		if (aac030 != "" && aac049 != "") {
			if (aac030<aac049) {
				Base.alert("首次参保年月不能晚于个人参保日期");
				Base.setValue(id, "");
				return;
			}
			if(aac007!=''){
			    if(aac007 > aac049){
					alert("首次参保年月【"+aac049+"】不能早于参加工作日期【"+aac007+"】!");
					Base.setValue(id,"");
					return;
			    }
			}
			//与本次参加工作日期作比较
			if(ajc050 != ''){
				if(ajc050 < aac049){
					alert("首次参保年月【"+aac049+"】不能晚于本次参加工作日期【"+ajc050+"】!");
					Base.setValue(id,"");
					return false;
				}
			}
		}

	}
	
	//通过传入参保日期，提取险种的最大做账期号
	function fnIssue1(issue){
		var year = issue.substr(0,4);
		var month = issue.substr(5,6);
		var yae097 ;
		if(parseInt(month)==1){
			year=parseInt(year)-1;
			month = 12;
			yae097 = year+""+month;
		}else {
			if(parseInt(month)<11){
			yae097 = year+"0"+(parseInt(month)-1);
			}else{
			yae097 = year+""+(parseInt(month)-1);
			}
		}
		return yae097;
	}
	
	function setykc006(value,key){
	    Base.setValue('ykc006_'+key.substring(0,3),'');
		Base.submit(null,myPath()+"/process/publicBusiness/comm/publicBusinessAction!setYkc006.do",{"dto['ykc005_']":key});
		
	}
	
	function checkAae206(aae140, id){
	    var aac049 = Base.getValue("aac049_110").substr(0,4)+ Base.getValue("aac049_110").substr(5,2);
	    var aae206 = Base.getValue(id);
	    if(aae206<aac049){
	        alert("建账年月不能早于首次参保年月！");
	        Base.setValue(id,"");
	        return;
	    }
	}
	
	//个人最大做账期号可维护的约束
	function checkYae097(yae097ID){
		var aac001 = Base.getValue("aac001");
		var aab001 = Base.getValue("aab001");
		var yae097 = Base.getValue(yae097ID);
		var aae140 = yae097ID.substr(7);
		var aac030 = Base.getValue("aac030_"+aae140);
		var aac030_s = aac030.replace("-","").substr(0,6);
		
		var year = aac030_s.substr(0,4);
		var month = aac030_s.substr(4);
		var yae097_cb ;
		if(parseInt(month)==1){
			year = year-1;
			month=12;
			yae097_cb = year+month;
		}else{
			if(parseInt(month)<11){
				yae097_cb = year +"0"+(parseInt(month)-1);
			}else{
				yae097_cb = year+""+(parseInt(month)-1);
			}
		}
		if(aab001==""||aab001==null){
			alert('单位编号为空，请核实！');
			Base.focus("aab001");
			return ;
		}else{
			if(parseInt(yae097)<(parseInt(yae097_cb))){
				alert("最大做账期号录入不符合业务规范，其录入最小值只能为个人参保日期的上一个月，请检查重新录入！");
				Base.setValue(yae097ID,"");
				Base.focus(yae097ID);
				return false;
			}else{
				Base.submit(null,"maintainBIEmployeeAction!toGetyae097.do",{"dto['aac001']":aac001,"dto['aab001']":aab001,"dto['yae097']":yae097,"dto['aae140']":aae140});
			}
		}
	}
</script>