<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>registerEmployee</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
    <ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="submitData();"  asToolBarItem="true"/>
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+R" type="resetPage" asToolBarItem="true"/>
		<ta:button id="closeWinBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="closeWin();" asToolBarItem="true"/>
		<ta:button id="verityBtn" icon="icon-save" key="审核记录" onClick="verityHistorySuggestView();" display="false" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
	<ta:panel fit="true">	
		<ta:tabs id="tabsSI" fit="true">
			<ta:tab id="infoTb" key="个人基本信息" cssStyle="overflow:auto">
				<ta:panel id="fltUnit" key="单位基本信息" cols="3" expanded="false" scalable="false">
					<ta:box cols="2">
						<ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="20" columnWidth="0.9" onChange="callDwRPC()" bpopTipMsg="可输入单位管理码、公司名称、单位ID"/>
						<ta:buttonLayout align="left" columnWidth="0.1">
							<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC()"/>
						</ta:buttonLayout>
					</ta:box>
					<ta:text id="aae044" key="单位名称" readOnly="true" span="2" labelWidth="120"/>
					<ta:text id="aab999" key="单位管理码" readOnly="true"  labelWidth="120" />
					<ta:selectInput id="aab019" key="单位类型" labelWidth="120" readOnly="true"  collection="AAB019" />
					<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" readOnly="true" collection="YAB019" />
				</ta:panel>
				<ta:panel id="fldryxx" key="人员信息" cols="3" >
					<ta:text id="isNew" display="false" value="0"/>
					<ta:text id="aaz002" key="业务日志ID" display="false" />
					<%@ include file="/yhsi3/commonJSP/idCardCheck.jsp"%>
					<ta:text id="aac001" key="个人编号" readOnly="true" labelWidth="120" maxLength="15"/>
					<ta:text id="aac003" key="姓名" labelWidth="120" maxLength="60" required="true"/>
					<ta:selectInput id="aac004" key="性别" readOnly="true" collection="AAC004" labelWidth="120" required="true"/>
					<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120" required="true" showSelectPanel="true"/>
					<ta:date id="yac581" key="身份证有效开始时间" readOnly="true" labelWidth="120" showSelectPanel="true"/>
					<ta:date id="yac582" key="身份证有效截止时间" readOnly="true" labelWidth="120" showSelectPanel="true"/>
					<ta:date id="aac007" key="参加工作时间" required="true" labelWidth="120" onChange="checkAllTime('aac007')" showSelectPanel="true"/>
					<ta:selectInput id="aac012" key="个人身份" collection="aac012" labelWidth="120" required="true"/>
					<ta:selectInput id="aja004" key="农民工标示" collection="aja004" labelWidth="120" required="true" selectFirstValue="true"/>
					<ta:selectInput id="aac118" key="被征地农民标识" collection="aac118" labelWidth="120"  required="true" selectFirstValue="true" display="false" />
					<ta:selectInput id="aac064" key="转业军人标识" collection="aac064" labelWidth="120"   required="true" value="90" display="false"/>
					<ta:selectInput id="yac584" key="参战军人标识" collection="yac584" labelWidth="120"  required="true"  selectFirstValue="true" display="false"/>
					<ta:selectInput id="aac005" key="民族" collection="aac005" labelWidth="120" value="01"/>
					<ta:selectInput id="aac011" key="学历" collection="aac011" labelWidth="120"/>
					<ta:selectInput id="aac017" key="婚姻状况" collection="aac017" labelWidth="120"/>
					<ta:selectInput id="aac016" key="就业状态" collection="aac016" labelWidth="120"/>
					<ta:selectInput id="yac030" key="在编人员标识" collection="yac030" labelWidth="120" />
					<ta:selectInput id="aac033" key="健康状况" collection="aac033" labelWidth="120"/>
					<ta:selectInput id="aab301" key="所属行政区代码" collection="aab301" labelWidth="120" islevel="true" isMustLeaf="true"/>
					<ta:text id="aae013" key="备注" span="3" labelWidth="120" maxLength="200"/>
				</ta:panel>
				<ta:panel id="fldry" key="荣誉信息" cols="3" expanded="false" scalable="false">
					<ta:selectInput id="aac014" key="专业技术职务等级" collection="aac014" labelWidth="120"/>
					<ta:selectInput id="aac015" key="国家职业资格等级" collection="aac015" labelWidth="120"/>
					<ta:selectInput id="aac020" key="行政职务" collection="aac020" labelWidth="120"/>
				</ta:panel>
				<ta:panel id="fldlx" key="联系信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aae006" key="地址" labelWidth="120" span="2" maxLength="200" required="true"/>
					<ta:text id="aae007" key="邮编" validType="zipcode" maxLength="6" labelWidth="120" />
					<ta:text id="aae004" key="联系人姓名" labelWidth="120" maxLength="60"/>
					<ta:text id="aae005" key="联系人电话" labelWidth="120" validType="mobile" maxLength="30" required="true"/>
					<ta:text id="yae107" key="移动电话" labelWidth="120" validType="mobile"  maxLength="50"/>
					<ta:text id="aae159" key="联系电子邮箱" validType="email" labelWidth="120"  maxLength="50" />
				</ta:panel>
				<ta:panel id="fldhj" key="户籍信息" cols="3" expanded="false" scalable="false">
					<ta:selectInput id="aac009" key="户口性质" labelWidth="120" islevel="true" isMustLeaf="true" collection="AAC009"/>
					<ta:text id="aac010" key="户口所在地" labelWidth="120" maxLength="100" required="true"/>
					<ta:text id="aab401" key="户口簿编号" labelWidth="120" validType="nochinese" maxLength="20"/>
				</ta:panel>
			</ta:tab>
			<ta:tab id="Tabgrcb" key="个人参保信息">
				<ta:text id="a110" display="false"/>			    
				<ta:text id="a120" display="false"/>
				<ta:text id="a210" display="false"/>
				<ta:text id="a310" display="false"/>
				<ta:text id="a320" display="false"/>
				<ta:text id="a330" display="false"/>
				<ta:text id="a340" display="false"/>				
				<ta:text id="a370" display="false"/>																									
				<ta:text id="a410" display="false"/>
				<ta:text id="a510" display="false"/>
				<ta:text id="ykc005110" display="false"/>
				<ta:text id="ykc005120" display="false"/>			    
				<ta:text id="ykc005210" display="false"/>
				<ta:text id="ykc005310" display="false"/>
				<ta:text id="ykc005320" display="false"/>
				<ta:text id="ykc005330" display="false"/>			
				<ta:text id="ykc005340" display="false"/>				
				<ta:text id="ykc005370" display="false"/>																									
				<ta:text id="ykc005410" display="false"/>
				<ta:text id="ykc005510" display="false"/>
				<ta:text id="ykc006110" display="false"/>
				<ta:text id="ykc006120" display="false"/>			    
				<ta:text id="ykc006210" display="false"/>
				<ta:text id="ykc006310" display="false"/>
				<ta:text id="ykc006320" display="false"/>	
				<ta:text id="ykc006330" display="false"/>		
				<ta:text id="ykc006340" display="false"/>				
				<ta:text id="ykc006370" display="false"/>																									
				<ta:text id="ykc006410" display="false"/>
				<ta:text id="ykc006510" display="false"/>
                <%@ include file="/yhsi3/commonJSP/xzlx_gr.jsp"%>									
				<ta:panel cols="3" id="fltCB" expanded="false" scalable="false">
					<ta:number id="aac040" key="工资" labelWidth="120" required="true" precision="2"  asAamount="true" amountPre="￥" onChange="checkMoney()" max="99999999"/>
					<ta:selectInput id="aac066" key="参保身份" filter="2" collection="aac066" labelWidth="120" required="true" selectFirstValue="true"/>
					<ta:selectInput id="aac013" key="用工形式" required="true" selectFirstValue="true" onSelect="fnAac013" collection="aac013" labelWidth="120" />
					<ta:date id="aac049" key="首次参保年月" labelWidth="120" required="true" showSelectPanel="true" issue="true" onChange="checkAllTime('aac049');"/>	                  
					<ta:date id="ajc050" key="本次参加工作日期"  labelWidth="120" required="true" showSelectPanel="true" onChange="checkAllTime('ajc050');" />
				</ta:panel>
				<ta:tabs id="tbs_xzxx" fit="true">
					<ta:tab id="tb_cbxx" key="单位参保信息">
		    			<ta:datagrid id="cb_grid" fit="true" forceFitColumns="true">
	    				<ta:datagridItem id="aab001_cb" key="单位ID" align="center" width="100"/>
			    		<ta:datagridItem id="aae140_cb" key="险种类型" collection="AAE140" width="170" align="center" dataAlign="left" />
						<ta:datagridItem id="aab050_cb" key="参保日期"  dataType="date" width="100" align="center" dataAlign="center" />
						<ta:datagridItem id="aab051_cb" key="参保状态" collection="AAB051" width="100" align="center" dataAlign="left" />
						<ta:datagridItem id="yae097_cb" key="最大做账期号" width="100"   align="center" dataAlign="left" />
						<ta:datagridItem id="yaz289_cb" key="征缴规则ID" collection="YAZ289" width="220" align="center" dataAlign="left" showDetailed="true"/>
						<ta:datagridItem id="aaz136_cb" key="基数核定规则ID" collection="AAZ136" width="170" align="center" dataAlign="left" />
						<ta:datagridItem id="yab139_cb" key="参保所属机构"  collection="YAB003" width="260" align="center" dataAlign="left" />
					   	</ta:datagrid>
					</ta:tab>
                    <%@ include file="/yhsi3/commonJSP/xzlx_tab_gr.jsp"%>	
				</ta:tabs>
			</ta:tab>
			<ta:tab id="sjlcTb" key="事件流程记录" >
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $("body").taLayout();
        Base.focus("aab001");
        initializeSuggestFramework(1, '', 'jstj', 500, 200, 4, fn_queryInfoPerson, 0, false);
        initializeSuggestFramework(2, '', 'aab001', 900, 200, 7, fnCheckAae140, 1, false);
    });
    function callDwRPC(){
		sfwQueryUtil_newRPC(2,'getAb01String',{"dto['inputString']":Base.getValue('aab001')});
	}
	function showDwRPC(){
		Base.openWindow("newRPCWindow","RPC查询窗口",myPath()+"/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do",null,1000,450,null,fn_setDwData,true);
	}
	function fn_setDwData(){
		 Base.submit(null, "registerEmployeeAction!getUnitInsu.do", {
             "dto['aab001']": aab001
         },
         null, false,
         function(data) {
             //单位管理类型：01表示普通单位，02表示灵活就业虚拟单位
             var yab019 = Base.getValue("yab019");
             //如果是灵活就业单位，则不展示工资输入项，反之，则展示并为必输入项
             if ("02" == yab019) {
                 Base.setValue("aac040", "");
                 Base.setDisRequired("aac040");
                 Base.hideObj("aac040");
             } else {
                 Base.setValue("aac040", "");
                 Base.setRequired("aac040");
                 Base.showObj("aac040");
             }

             //判断单位类型，如果是机关或者参照公务员事业单位则让在编人员可选，否则默认为非在编
             if (Base.getValue("aab019") == "30" || Base.getValue("aab019") == "58" || Base.getValue("aab019") == "55") {
                 Base.setValue("yac030", "1");
                 Base.filterSelectInput("yac030", "", false);
             } else {
                 Base.setValue("yac030", "0");
                 Base.filterSelectInput("yac030", "0", true);
             }

             Base._setReadOnly("aac002", false);
             Base._setReadOnly("aac058", false);

         },
         null);
		Base.setValue("aab001", parent.getValue("aab001"));
	}
    
    //人员回调函数
    function fn_queryInfoPerson() {
        if (g_Suggest != "") {
            if (Base.getValue("aab999") == "") {
                Base.alert("请先输入单位信息", "warn");
                Base.focus("aab999");
                Base.setValue("aac002", "");
                Base.setValue("aac003", "");
                return false;
            }
            Base.setDisabled("jstj");
            Base.setValue("isNew", "1");
            Base.setReadonly("aac002,aab401,aac005,aac003,aac004,aac006,aac007,aac009,aac058");
            Base.setDisabled("aac010,aac011,aac012,aac014,aac015,aac016,aac017,aac020,aac033,aac060,aac084");
            Base.setDisabled("aae004,aae005,yae107,aae006,aae007,aae159,aja004,aab301,yac011,yac008");
            Base.submit("aac001,aab001", "registerEmployeeAction!toQueryPerson.do");
        }
    }

    function submitData() {
        var aae140Arr = ['110', '120', '210', '310', '320', '330', '340', '370', '410', '510'];
        var len = aae140Arr.length;
        for (i = 0; i < len; i++) {
            Base.setValue("a" + aae140Arr[i], "0");
            if (Base.getObj("aae140_" + aae140Arr[i]).checked) {
                Base.setValue("a" + aae140Arr[i], "1");
            }
        }
        //根据是否勾选勾选险种来确定点保存时  检验所有的必录项
        var a110 = Base.getObj("aae140_110").checked;
        var a120 = Base.getObj("aae140_120").checked;
        var a210 = Base.getObj("aae140_210").checked;
        var a310 = Base.getObj("aae140_310").checked;
        var a320 = Base.getObj("aae140_320").checked;
        var a330 = Base.getObj("aae140_330").checked;
        var a340 = Base.getObj("aae140_340").checked;
        var a370 = Base.getObj("aae140_370").checked;
        var a410 = Base.getObj("aae140_410").checked;
        var a510 = Base.getObj("aae140_510").checked;

        if (! (a110 || a120 || a210 || a310 || a320 || a330 || a340 || a370 || a410 || a510)) {
            if (confirm("未新增任何险种，确认保存？")) {
                //保存成功之后，清空页面上的信息，并且初始化一些值
                Base.submit('form1', 'registerEmployeeAction!toSave.do', null, null, true,
                function() {
                    //成功回调函数
                    Base.clearData("fldryxx");
                    Base.clearData("fldry");
                    Base.clearData("fltCB");
                    Base.clearData("fldlx");
                    Base.clearData("fldhj");
                    Base.setValue("aac058", '1');
                    Base.setValue("aja004", '0');
                    Base.setValue("aac005", '01');
                    Base.setValue("aac066", '1');
                    Base.setValue("aac013", '1');
                });
            }
        } else {
            //单位管理类型：01表示普通单位，02表示灵活就业虚拟单位
            var yab019 = Base.getValue("yab019");
            //如果是灵活就业单位，则不检查工资输入项
            if ("01" == yab019) {
                //工资
                var aac040 = Base.getValue("aac040");
                if (aac040 == '') {
                    Base.activeTab('Tabgrcb');
                    alert('工资不能为空!');
                    Base.focus('aac040');
                    return false;
                }
            }
            var aac066 = Base.getValue("aac066");
            if (aac066 == '') {
                Base.activeTab('Tabgrcb');
                alert('参保身份不能为空!');
                Base.focus('aac066');
                return false;
            }

            var aac013 = Base.getValue("aac013");
            if (aac013 == '') {
                Base.activeTab('Tabgrcb');
                alert('用工形式不能为空!');
                Base.focus('aac013');
                return false;
            }
            var aac049 = Base.getValue("aac049");
            if (aac049 == '') {
                Base.activeTab('Tabgrcb');
                alert('首次参保年月不能为空!');
                Base.focus('aac049');
                return false;
            }
            var ajc050 = Base.getValue("ajc050");
            if (ajc050 == '') {
                Base.activeTab('Tabgrcb');
                alert('本次参加工作日期不能为空!');
                Base.focus('ajc050');
                return false;
            }
            for (i = 0; i < len; i++) {
                var ck = Base.getObj('aae140_' + aae140Arr[i]).checked;
                if (ck) {
                    var aaz136 = Base.getValue('aaz136_' + aae140Arr[i]);
                    var aac030 = Base.getValue('aac030_' + aae140Arr[i]);
                    var yaz289 = Base.getValue('yaz289_' + aae140Arr[i]);
                    if ((aaz136 == '') || (aac030 == '') || (yaz289 == '')) {
                        Base.activeTab('Tabgrcb');
                        Base.activeTab('tab_' + aae140Arr[i]);
                        alert("请将【" + getAae140Name(aae140Arr[i]) + "】必输项填写完整!");
                        return false;
                    }
                }
            }
            //单位编号不为空
            var aab001 = Base.getValue("aab001");
            if ('' == aab001) {
                Base.activeTab('infoTb');
                alert('请将【个人基本信息】必录项填写完整!');
                Base.focus("aab001");
                return false;
            }
            //证件类型
            var aac058 = Base.getValue("aac058");
            if ('' == aac058) {
                Base.activeTab('infoTb');
                alert('请将【个人基本信息】必录项填写完整!');
                Base.focus("aac058");
                return false;
            }
            //证件号码
            var aac002 = Base.getValue("aac002");
            if ('' == aac002) {
                Base.activeTab('infoTb');
                alert('请将【个人基本信息】必录项填写完整!');
                Base.focus("aac002");
                return false;
            }
            //姓名
            var aac003 = Base.getValue("aac003");
            if ('' == aac003) {
                Base.activeTab('infoTb');
                alert('请将【个人基本信息】必录项填写完整!');
                Base.focus("aac003");
                return false;
            }
            //参加工作时间
            var aac007 = Base.getValue("aac007");
            if ('' == aac007) {
                Base.activeTab('infoTb');
                alert('请将【个人基本信息】必录项填写完整!');
                Base.focus("aac007");
                return false;
            }
            //个人身份
            var aac012 = Base.getValue("aac012");
            if ('' == aac012) {
                Base.activeTab('infoTb');
                alert('请将【个人基本信息】必录项填写完整!');
                Base.focus("aac012");
                return false;
            }
            //aja004农民工标识
            var aja004 = Base.getValue("aja004");
            if ('' == aja004) {
                Base.activeTab('infoTb');
                alert('请将【个人基本信息】必录项填写完整!');
                Base.focus("aja004");
                return false;
            }

            Base.submit('form1', 'registerEmployeeAction!toSave.do', null, null, true);
        }
    }

    function fnAac013(value, key) {
        var aae140Arr = ['110', '120', '210', '310', '320', '330', '340', '370', '410', '510'];
        if (key != "") {
            var len = aae140Arr.length;
            for (i = 0; i < len; i++) {
                Base.setValue("aac013_" + aae140Arr[i], key);
            }
        }
    }

    // 根据单位参保险种 显示个人可参保险种
    function fnCheckAae140() {
        var aae140Arr = ['110', '120', '210', '310', '320', '330', '340', '370', '410', '510'];
        var len = aae140Arr.length;
        for (i = 0; i < len; i++) {
            Base.setValue('aae140_' + aae140Arr[i], null);
            Base.setValue('aab050_' + aae140Arr[i], null);
            Base.setValue('aab033_' + aae140Arr[i], null);
            Base.setValue('aac013_' + aae140Arr[i], null);
            Base.setValue('yaz289_' + aae140Arr[i], null);
            Base.setValue('aaz136_' + aae140Arr[i], null);
            Base.setValue('aac030_' + aae140Arr[i], null);
        }
        if (g_Suggest != "") {
            Base.setValue("aab001", g_Suggest[1]);
            var aab001 = g_Suggest[1];
            Base.setValue("isNew", "0");
            var len = aae140Arr.length;
            for (i = 0; i < len; i++) {
                Base.hideObj("tab_" + aae140Arr[i]);
                Base.hideObj("aae140_" + aae140Arr[i]);
            }
            //全选复选框默认不选中
            Base.setValue("aae140_all", false);
            Base.submit(null, "registerEmployeeAction!getUnitInsu.do", {
                "dto['aab001']": aab001
            },
            null, false,
            function(data) {
                //单位管理类型：01表示普通单位，02表示灵活就业虚拟单位
                var yab019 = Base.getValue("yab019");
                //如果是灵活就业单位，则不展示工资输入项，反之，则展示并为必输入项
                if ("02" == yab019) {
                    Base.setValue("aac040", "");
                    Base.setDisRequired("aac040");
                    Base.hideObj("aac040");
                } else {
                    Base.setValue("aac040", "");
                    Base.setRequired("aac040");
                    Base.showObj("aac040");
                }

                //判断单位类型，如果是机关或者参照公务员事业单位则让在编人员可选，否则默认为非在编
                if (Base.getValue("aab019") == "30" || Base.getValue("aab019") == "58" || Base.getValue("aab019") == "55") {
                    Base.setValue("yac030", "1");
                    Base.filterSelectInput("yac030", "", false);
                } else {
                    Base.setValue("yac030", "0");
                    Base.filterSelectInput("yac030", "0", true);
                }

                Base._setReadOnly("aac002", false);
                Base._setReadOnly("aac058", false);

            },
            null);
        }
    }
	
   
    //工资检验
    function checkMoney() {
        var aac040 = Base.getValue("aac040");
        if (aac040 < 0) {
            alert('工资不能为负数!');
            Base.setValue("aac040", "");
            Base.focus("aac040");
        }
        if (parseInt(aac040) > (parseInt(99999999))) {
            alert("现输入工资为：【" + aac040 + "】，其超出最大值【99999999】，请确认后重新录入！");
            Base.setValue("aac040", "");
            Base.focus("aac040");
        }
    }

    function checkAllTime(id) {
        var aac006 = Base.getValue("aac006"); //出生日期
        var aac007 = Base.getValue("aac007"); //参工时间
        var aac049 = Base.getValue("aac049"); //首次参保年月
        var ajc050 = Base.getValue("ajc050"); //本次参工时间
        var aae140Str = '110,120,210,310,320,330,340,350,370,410,510';
        var aae140Arr = ['110', '120', '210', '310', '320', '330', '340', '350', '370', '410', '510'];
        var len = aae140Arr.length;
        //出生日期<参工时间<=首次参保年月<=本次参加工作日期<=个人参保日期
        if ((id == "aac006" || id == "aac007") && (aac006 != "" && aac007 != "")) {
            if (aac007 < aac006) {
                Base.alert("【参加工作时间：" + aac007 + "】不能早于【出生日期：" + aac006 + "】，请检查后重新录入！", "warn");
                Base.setValue(id, "");
                Base.focus(id);
                return false;
            }
        }

        if ((id == "aac049" || id == "aac007") && (aac049 != "" && aac007 != "")) {
            if (aac049 < aac007.substring(0,4) + aac007.substring(5,7)) {
                if (id == "aac007") {
                    Base.alert("【参加工作时间：" + aac007 + "】不能晚于【首次参保年月：" + aac049 + "】，请检查后重新录入！", "warn");
                } else {
                    Base.alert("【首次参保年月：" + aac049 + "】不能早于【参加工作时间：" + aac007 + "】，请检查后重新录入！", "warn");
                }
                Base.setValue(id, "");
                Base.focus(id);
                return false;
            }
        }

        if ((id == "aac049" || id == "ajc050") && (aac049 != "" && ajc050 != "")) {
            if (ajc050.substring(0,4) + ajc050.substring(5,7) < aac049) {
                if (id == "aac049") {
                    Base.alert("【首次参保年月：" + aac049 + "】不能晚于【本次参工日期：" + ajc050 + "】，请检查后重新录入！", "warn");
                } else {
                    Base.alert("【本次参工日期：" + ajc050 + "】不能早于【首次参保年月：" + aac049 + "】，请检查后重新录入！", "warn");
                }
                Base.setValue(id, "");
                Base.focus(id);
                return false;
            }
        }

        // 个人参保日期ID拼接字符串
        var index = aae140Str.indexOf(id);
        var aae140 = id;
        if (index != -1) {
            id = "aac030_" + id;
            var aac030 = Base.getValue(id);
            if (aac030 != "" && ajc050 != "") {
                if (aac030 < ajc050) {
                    Base.alert(getAae140Name(aae140) + " 个人参保日期【" + aac030 + "】不能早于本次参加工作日期【" + ajc050 + "】!", "warn");
                    Base.setValue(id, '');
                    Base.activeTab('tab_' + aae140);
                    Base.focus(id);
                    return false;
                }
            }
        }

        if (id == "ajc050" && ajc050 != "") {
            var cks = false;
            for (var i = 0; i < len; i++) {
                var checkObj = Base.getObj('aae140_' + aae140Arr[i]);
                if (checkObj == undefined) {
                    continue;
                }
                var ck = checkObj.checked;
                if (ck) {
                    cks = true;
                    break;
                }
            }
            //单位参保时间
            var rows = Base.getGridData("cb_grid");
            if (cks) {
                Base.confirm('将个人参保日期和本次参加工作日期同步吗？',
                function(yes, callback) {
                    if (yes) {
                        for (var i = 0; i < len; i++) {
                            var checkObj = Base.getObj('aae140_' + aae140Arr[i]);
                            if (checkObj == undefined) {
                                continue;
                            }
                            var ck1 = checkObj.checked;
                            if (ck1) {
                                for (var j = 0; j < rows.length; j++) {
                                    if (aae140Arr[i] == rows[j].aae140_cb) {
                                        var aab050_cb = rows[j].aab050_cb;
                                        if (Base.getValue("ajc050") < (aab050_cb.substr(0, 10))) {
                                            Base.alert("本次参加工作日期【" + ajc050 + "】不能早于单位参保时间【" + aab050_cb.substr(0, 10) + "】!", "warn");
                                            Base.setValue("ajc050", '');
                                            return;
                                        }
                                    }
                                }
                            }
                        }
                        for (var i = 0; i < len; i++) {
                            Base.setValue('aac030_' + aae140Arr[i], ajc050);
                            Base.setValue('aae206_' + aae140Arr[i], ajc050.substr(0, 4) + ajc050.substr(5, 2));
                        }
                    } else {
                        //个人参保时间 和 本次参加工作时间 校验及赋值
                        for (var i = 0; i < len; i++) {
                            //个人参保日期提前全部附上本次参加工作日期
                            var checkObj = Base.getObj('aae140_' + aae140Arr[i]);
                            if (checkObj == undefined) {
                                continue;
                            }
                            var ck = checkObj.checked;
                            if (ck) {
                                var aac030 = Base.getValue('aac030_' + aae140Arr[i]);
                                if ((aac030 != '') && (ajc050 > aac030)) {
                                    Base.alert("本次参加工作日期【" + ajc050 + "】不能晚于【" + getAae140Name(aae140Arr[i]) + "】个人参保时间【" + aac030 + "】!", "warn");
                                    Base.setValue('ajc050', '');
                                    Base.activeTab('tab_' + aae140Arr[i]);
                                    return false;
                                }
                            }
                        }
                    }
                });
            } else {
                for (var i = 0; i < len; i++) {
                    Base.setValue('aac030_' + aae140Arr[i], '');
                }
            }
        }
    }

    //险种名字
    function getAae140Name(id) {
        if (id == '110') {
            return '企业养老';
        } else if (id == '120') {
            return '机关养老';
        } else if (id == '210') {
            return '失业';
        } else if (id == '310') {
            return '基本医疗';
        } else if (id == '320') {
            return '公务员补充';
        } else if (id == '330') {
            return '大病补助';
        } else if (id == '340') {
            return '离休';
        } else if (id == '350') {
            return '二乙';
        } else if (id == '370') {
            return '企业补充';
        } else if (id == '410') {
            return '工伤';
        } else if (id == '510') {
            return '生育';
        }
    }

    //关闭窗口
    function closeWin() {
        parent.Base.closeWindow('userwin');
    }
</script>
<%@ include file="/ta/incfooter.jsp"%>