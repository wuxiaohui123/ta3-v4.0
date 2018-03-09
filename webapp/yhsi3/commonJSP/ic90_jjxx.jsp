<%@ page language="java" pageEncoding="UTF-8"%>
<!-- 转移人员基本信息 -->
<ta:number id="aic093" key="1998年1月1日前账户中个人缴费累计储存额" readOnly="true" labelWidth="300" value="0" precision="2" min="0.00" max="99999999.99" required="true" onChange="fnAdd(this);" />
<ta:number id="aic089" key="1998年1月1日至调转上年末个人账户累计储存额" readOnly="true" labelWidth="300" precision="2" value="0" min="0.00" max="99999999.99" required="true" onChange="fnAdd(this);" />
<ta:number id="aic082" key="调转当年记入个人账户本金金额" readOnly="true" labelWidth="300" precision="2" value="0" required="true" min="0.00" max="99999999.99" onChange="fnAdd(this);" />
<ta:number id="aic083" key="个人账户基金转移额" labelWidth="300" value="0" precision="2" readOnly="true" />
<ta:number id="aic084" key="统筹基金转移额" readOnly="true" labelWidth="300" value="0" precision="2" min="0.00" max="99999999.99" required="true" onChange="fnAdd(this);" />
<ta:number id="aic102" key="转移基金总额" labelWidth="300" value="0" precision="2" readOnly="true" />