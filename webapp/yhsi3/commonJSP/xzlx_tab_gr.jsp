<%@ page language="java" pageEncoding="UTF-8"%>
<ta:tab id="tab_110" key="企业养老">
	<ta:box cols="3">
		<ta:text id="aab050_110" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aab033_110" key="征收方式" display="false" collection="aab033" labelWidth="120" />
		<ta:selectInput id="aac013_110" key="用工形式" display="false" collection="aac013" labelWidth="120" />
		<ta:date id="aae206_110" key="账户建立年月" labelWidth="120" required="true" showSelectPanel="true" issue="true" onChange="fnCheckAae206('110')" />
		<ta:selectInput id="ykc005_110" key="特殊人员类型" labelWidth="120" required="true" onSelect="setykc006" />
		<ta:selectInput id="ykc006_110" key="特殊人员类别" labelWidth="120" required="true" />
		<ta:selectInput id="yaz289_110" key="征缴规则" labelWidth="120" collection="yaz289" required="true" />
		<ta:selectInput id="aaz136_110" key="基数核定规则" labelWidth="120" collection="aaz136" required="true" />
		<ta:date id="aac030_110" key="个人参保日期" labelWidth="120" required="true" onChange="checkAllTime('110')" showSelectPanel="true" />
	</ta:box>
</ta:tab>

<ta:tab id="tab_120" key="企业养老">
	<ta:box cols="3">
		<ta:text id="aab050_120" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aab033_120" key="征收方式" display="false" collection="aab033" labelWidth="120" />
		<ta:selectInput id="aac013_120" key="用工形式" display="false" collection="aac013" labelWidth="120" />
		<ta:date id="aae206_120" key="账户建立年月" labelWidth="120" required="true" showSelectPanel="true" issue="true" onChange="fnCheckAae206('120')" />
		<ta:selectInput id="ykc005_120" key="特殊人员类型" labelWidth="120" required="true" onSelect="setykc006" />
		<ta:selectInput id="ykc006_120" key="特殊人员类别" labelWidth="120" required="true" />
		<ta:selectInput id="yaz289_120" key="征缴规则" labelWidth="120" collection="yaz289" required="true" />
		<ta:selectInput id="aaz136_120" key="基数核定规则" labelWidth="120" collection="aaz136" required="true" />
		<ta:date id="aac030_120" key="个人参保日期" labelWidth="120" required="true" onChange="checkAllTime('120')" showSelectPanel="true" />
	</ta:box>
</ta:tab>

<ta:tab id="tab_210" key="失业">
	<ta:box cols="3">
		<ta:text id="aab050_210" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aab033_210" key="征收方式" display="false" collection="aab033" labelWidth="120" />
		<ta:selectInput id="aac013_210" key="用工形式" display="false" collection="aac013" labelWidth="120" />
		<ta:selectInput id="ykc005_210" key="特殊人员类型" labelWidth="120" required="true" onSelect="setykc006" />
		<ta:selectInput id="ykc006_210" key="特殊人员类别" labelWidth="120" required="true" />
		<ta:selectInput id="yaz289_210" key="征缴规则" labelWidth="120" collection="yaz289" required="true" />
		<ta:selectInput id="aaz136_210" key="基数核定规则" labelWidth="120" collection="aaz136" required="true" />
		<ta:date id="aac030_210" key="个人参保日期" labelWidth="120" required="true" onChange="checkAllTime('210')" showSelectPanel="true" />
	</ta:box>
</ta:tab>

<ta:tab id="tab_310" key="基本医疗">
	<ta:box cols="3">
		<ta:text id="aab050_310" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aab033_310" key="征收方式" display="false" collection="aab033" labelWidth="120" />
		<ta:selectInput id="aac013_310" key="用工形式" display="false" collection="aac013" labelWidth="120" />
		<ta:selectInput id="ykc005_310" key="特殊人员类型" labelWidth="120" required="true" onSelect="setykc006" />
		<ta:selectInput id="ykc006_310" key="特殊人员类别" labelWidth="120" required="true" />
		<ta:selectInput id="yaz289_310" key="征缴规则" labelWidth="120" collection="yaz289" required="true" />
		<ta:selectInput id="aaz136_310" key="基数核定规则" labelWidth="120" collection="aaz136" required="true" />
		<ta:date id="aac030_310" key="个人参保日期" labelWidth="120" required="true" onChange="checkAllTime('310')" showSelectPanel="true" />
	</ta:box>
</ta:tab>

<ta:tab id="tab_330" key="大额医疗">
	<ta:box cols="3">
		<ta:text id="aab050_330" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aab033_330" key="征收方式" display="false" collection="aab033" labelWidth="120" />
		<ta:selectInput id="aac013_330" key="用工形式" display="false" collection="aac013" labelWidth="120" />
		<ta:selectInput id="ykc005_330" key="特殊人员类型" labelWidth="120" required="true" onSelect="setykc006" />
		<ta:selectInput id="ykc006_330" key="特殊人员类别" labelWidth="120" required="true" />
		<ta:selectInput id="yaz289_330" key="征缴规则" labelWidth="120" collection="yaz289" required="true" />
		<ta:selectInput id="aaz136_330" key="基数核定规则" labelWidth="120" collection="aaz136" required="true" />
		<ta:date id="aac030_330" key="个人参保日期" labelWidth="120" required="true" onChange="checkAllTime('330')" showSelectPanel="true" />
	</ta:box>
</ta:tab>

<ta:tab id="tab_320" key="公务员补充">
	<ta:box cols="3">
		<ta:text id="aab050_320" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aab033_320" key="征收方式" display="false" collection="aab033" labelWidth="120" />
		<ta:selectInput id="aac013_320" key="用工形式" display="false" collection="aac013" labelWidth="120" />
		<ta:selectInput id="ykc005_320" key="特殊人员类型" labelWidth="120" required="true" onSelect="setykc006" />
		<ta:selectInput id="ykc006_320" key="特殊人员类别" labelWidth="120" required="true" />
		<ta:selectInput id="yaz289_320" key="征缴规则" labelWidth="120" collection="yaz289" required="true" />
		<ta:selectInput id="aaz136_320" key="基数核定规则" labelWidth="120" collection="aaz136" required="true" />
		<ta:date id="aac030_320" key="个人参保日期" labelWidth="120" required="true" onChange="checkAllTime('320')" showSelectPanel="true" />
	</ta:box>
</ta:tab>

<ta:tab id="tab_340" key="离休二乙">
	<ta:box cols="3">
		<ta:text id="aab050_340" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aab033_340" key="征收方式" display="false" collection="aab033" labelWidth="120" />
		<ta:selectInput id="aac013_340" key="用工形式" display="false" collection="aac013" labelWidth="120" />
		<ta:selectInput id="ykc005_340" key="特殊人员类型" labelWidth="120" required="true" onSelect="setykc006" />
		<ta:selectInput id="ykc006_340" key="特殊人员类别" labelWidth="120" required="true" />
		<ta:selectInput id="yaz289_340" key="征缴规则" labelWidth="120" collection="yaz289" required="true" />
		<ta:selectInput id="aaz136_340" key="基数核定规则" labelWidth="120" collection="aaz136" required="true" />
		<ta:date id="aac030_340" key="个人参保日期" labelWidth="120" required="true" onChange="checkAllTime('340')" showSelectPanel="true" />
	</ta:box>
</ta:tab>

<ta:tab id="tab_370" key="企业补充">
	<ta:box cols="3">
		<ta:text id="aab050_370" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aab033_370" key="征收方式" display="false" collection="aab033" labelWidth="120" />
		<ta:selectInput id="aac013_370" key="用工形式" display="false" collection="aac013" labelWidth="120" />
		<ta:selectInput id="ykc005_370" key="特殊人员类型" labelWidth="120" required="true" onSelect="setykc006" />
		<ta:selectInput id="ykc006_370" key="特殊人员类别" labelWidth="120" required="true" />
		<ta:selectInput id="yaz289_370" key="征缴规则" labelWidth="120" collection="yaz289" required="true" />
		<ta:selectInput id="aaz136_370" key="基数核定规则" labelWidth="120" collection="aaz136" required="true" />
		<ta:date id="aac030_370" key="个人参保日期" labelWidth="120" required="true" onChange="checkAllTime('370')" showSelectPanel="true" />
	</ta:box>
</ta:tab>

<ta:tab id="tab_410" key="工伤">
	<ta:box cols="3">
		<ta:text id="aab050_410" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aab033_410" key="征收方式" display="false" collection="aab033" labelWidth="120" />
		<ta:selectInput id="aac013_410" key="用工形式" display="false" collection="aac013" labelWidth="120" />
		<ta:selectInput id="ykc005_410" key="特殊人员类型" labelWidth="120" required="true" onSelect="setykc006" />
		<ta:selectInput id="ykc006_410" key="特殊人员类别" labelWidth="120" required="true" />
		<ta:selectInput id="yaz289_410" key="征缴规则" labelWidth="120" collection="yaz289" required="true" />
		<ta:selectInput id="aaz136_410" key="基数核定规则" labelWidth="120" collection="aaz136" required="true" />
		<ta:date id="aac030_410" key="个人参保日期" labelWidth="120" required="true" onChange="checkAllTime('410')" showSelectPanel="true" />
	</ta:box>
</ta:tab>

<ta:tab id="tab_510" key="生育">
	<ta:box cols="3">
		<ta:text id="aab050_510" key="单位参保日期" readOnly="true" display="false" labelWidth="120" />
		<ta:selectInput id="aab033_510" key="征收方式" display="false" collection="aab033" labelWidth="120" />
		<ta:selectInput id="aac013_510" key="用工形式" display="false" collection="aac013" labelWidth="120" />
		<ta:selectInput id="ykc005_510" key="特殊人员类型" labelWidth="120" required="true" onSelect="setykc006" />
		<ta:selectInput id="ykc006_510" key="特殊人员类别" labelWidth="120" required="true" />
		<ta:selectInput id="yaz289_510" key="征缴规则" labelWidth="120" collection="yaz289" required="true" />
		<ta:selectInput id="aaz136_510" key="基数核定规则" labelWidth="120" collection="aaz136" required="true" />
		<ta:date id="aac030_510" key="个人参保日期" labelWidth="120" required="true" onChange="checkAllTime('510')" showSelectPanel="true" />
	</ta:box>
</ta:tab>
<script type="text/javascript">
	function setykc006(value,key){
	    Base.setValue('ykc006_'+key.substring(0,3),'');
	    Base.setEnable('ykc006_'+key.substring(0,3));
		Base.submit(null,myPath()+"/process/publicBusiness/comm/publicBusinessAction!setYkc006.do",{"dto['ykc005_']":key});
		
	}
	function fnCheckAae206(id){
	     var aae206 = Base.getValue("aae206_"+id);
	     var aac049 = Base.getValue("aac049");
	     var aac049Msg = aac049.substr(0,4)+aac049.substr(5,2)
	     if(aae206<aac049Msg){
	         alert("建账年月不能早于首次参保年月");
	         Base.setValue("aae206_"+id,"");
	         return;
	     }
	}
</script>