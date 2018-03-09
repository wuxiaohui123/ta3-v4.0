<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>WorkinjuryCognizanceQuery</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body style="margin:0px;padding:0px"  class="no-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="tlb">
	  <ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="ctrl+Q" onClick="query()" asToolBarItem="true" />
	  <ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" onClick="print()" hotKey="ctrl+P" asToolBarItem="true" />       
      <ta:button id="printBtn_TX" icon="xui-icon-spotPrint" key="打印停续人员明细表" onClick="printTX()"  asToolBarItem="true" />
      <ta:button id="printBtn_TXHZ" icon="xui-icon-spotPrint" key="打印停续人员汇总表" onClick="printTXHZ()"  asToolBarItem="true" />  
      <ta:button id="printBtn_SY" icon="xui-icon-spotPrint" key="打印失业停领通知书" onClick="printSYTZ()"  asToolBarItem="true" />  
      <ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true"  cssStyle="margin-right:5px">
		<ta:panel id="jstj" key="检索条件" cols="3">
			<ta:text id="qxkzAction" key="qxkzAction" display="false"/>
			<ta:text id="aae140" key="险种类型" display="false"/>
			<ta:selectInput id="bglx" key="变更类型" required="true" data="[{'id':'1','name':'停发'},{'id':'2','name':'续发'},{'id':'3','name':'终止'}]" onSelect="checkBglx" />
			<ta:selectInput id="aae160" key="变更原因" />		
			<ta:date id="aae235" key="变更年月" issue="true"  showSelectPanel="true" />
			<ta:box cols="2">
				<ta:text id="aac001" key="个人编号" maxLength="20" required="true" columnWidth="0.9" onChange="callRyRPC();" bpopTipMsg="可输入公民身份号码、姓名、人员ID" />
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showRyRPCBtn" key="?" onClick="showRyRPC();" />
				</ta:buttonLayout>
			</ta:box>			
		  	<ta:text id="aac002" key="身份证编号"   readOnly="true"/>			
			<ta:selectInput id="aac063" key="供养亲属标志" collection="AAC063" onSelect="checkBglx"/>			
			<ta:box cols="2">
				<ta:text id="aab001" key="单位编号" maxLength="20" columnWidth="0.9"  bpopTipMsg="可输入单位名称、单位代码、单位ID" onChange="callDwRPC();" required="true"/>
				<ta:buttonLayout align="left" columnWidth="0.1">
					<ta:button id="showDwRPCBtn" key="?" onClick="showDwRPC();" />
				</ta:buttonLayout>
			</ta:box>			
			<ta:text id="aac003" key="姓名" display="false"/>
			<ta:text id="yab003" key="经办机构" display="false"/>
			<ta:date id="aae036_s" key="经办时间起" showSelectPanel="true" />
			<ta:date id="aae036_e" key="经办时间止" showSelectPanel="true" />
			<ta:selectInput id="aae016" key="复核标识" collection="aae016" filter="0,1" reverseFilter="true"/>
		</ta:panel>
		<ta:panel id="Ac77Panel" key="人员变更信息" fit="true" >
			<ta:datagrid id="Ac77Grid" fit="true" columnFilter="true" haveSn="true" selectType="checkbox">
				<ta:datagridItem id="aab001" key="单位编号"     width="100px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aae044" key="单位名称"     width="100px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aac001" key="个人编号"     width="100px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aac002" key="公民身份号码"  width="150px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aac003" key="姓名"        width="100px" dataAlign="center" align="center" sortable="true" />
				<ta:datagridItem id="aae160" key="变更原因"     width="180px" collection="AAE160"  dataAlign="center" align="center"  sortable="true" />
				<ta:datagridItem id="aae040" key="变更日期" dataAlign="center" align="center" width="100px" sortable="true" />
				<ta:datagridItem id="dqdy"   key="变更时待遇" dataAlign="right" align="center" width="100" totals="sum" sortable="true" />
				<ta:datagridItem id="aae058" key="变更业务补退金额" dataAlign="right" align="center" width="100" totals="sum" sortable="true" />
				<ta:datagridItem id="ys"    key="变更业务补退月数" width="120px" dataAlign="right" align="center" sortable="true" />
				<ta:datagridItem id="aaz002" key="业务日志ID"  width="150px" dataAlign="center" align="center" sortable="true"  />
				<ta:datagridItem id="aae016" key="复核标志" collection="aae016" width="100px" dataAlign="right" align="center" sortable="true" />
				<ta:datagridItem id="aae011" key="经办人" width="100px" align="center" dataAlign="center" sortable="true" />
				<ta:datagridItem id="aae036" key="经办时间" width="120px" dataAlign="center" align="center" showDetailed="true" sortable="true" />
				<ta:datagridItem id="aae013" key="备注" width="180px" align="center" dataAlign="left" sortable="true" />
				<ta:dataGridToolPaging  url="treatmentChangeAction!query.do" submitIds="jstj" showExcel="true" showCount="true" pageSize="1000" resultType="java.util.HashMap" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
	<br /><iframe id="report1_printIFrame" name="report1_printIFrame" width="100"
		height="100" style="position:absolute;left:-100px;top:-100px"></iframe>	
</body>
</html>
<script type="text/javascript">
	//页面布局控制
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"ac01","aac001",800,200,6,'',2,false);
		initializeSuggestFramework(2,null,"aab001",700,200,3,'',1,false);
		var aae140 = Base.getValue("aae140");
		if(aae140 != "210"){
		     Base.hideObj("printBtn_SY");
		}
	});
	
	/* 个人编号RPC */
	function callRyRPC() {
		sfwQueryUtil_newRPC(1, 'getAac001DYAC60String', {"dto['inputString']" : Base.getValue("aac001"),"dto['aae140']":Base.getValue("aae140")});
	}
	
	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow13.do", null, 1000, 450, null, null, true);
	}
	
	//单位RPC
	function callDwRPC(){
		sfwQueryUtil_newRPC(2,'getAb01String',{"dto['inputString']" : Base.getValue("aab001")});
	}
	
	//单位RPC
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null, null, true);
	}
	
	//开始流转(指定"开始流转"按钮的Action方法)
	function query() {
		Base.submit("form1", Base.getValue("qxkzAction")+"!query.do");
	}	
	
	function checkBglx() {

		var aae140 = Base.getValue("aae140");
		var bglx = Base.getValue("bglx");
		var aac063 = Base.getValue("aac063");

		if (aae140 == '' || bglx == '') {
			return;
		}

		//根据险种过滤
		if ((aae140 == '110' || aae140 == '120') && aac063 == '0') {

			if (bglx == '1') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '1201',
					name : '离退休人员未提供生存证明'
				}, {
					id : '1202',
					name : '离退休人员被判刑收监执行或被劳动教养'
				}, {
					id : '1203',
					name : '离退休人员失踪'
				}, {
					id : '1206',
					name : '银行帐号错误'
				}, {
					id : '1207',
					name : '邮寄地址错误'
				}, {
					id : '1299',
					name : '其他原因暂停养老待遇'
				} ]);
			}
			if (bglx == '2') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '1301',
					name : '离退休人员提供生存证明续发'
				}, {
					id : '1302',
					name : '刑满'
				}, {
					id : '1303',
					name : '失踪后生还'
				}, {
					id : '1304',
					name : '被判刑后暂予监外执行、假释'
				}, {
					id : '1399',
					name : '其他原因续发养老待遇'
				} ]);

			}
			if (bglx == '3') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '1401',
					name : '离退休人员死亡'
				}, {
					id : '1402',
					name : '离退休人员出国定居'
				}, {
					id : '1403',
					name : '离退休人员港澳台定居'
				}, {
					id : '1499',
					name : '其他原因终止养老待遇'
				} ]);

			}
		}
		if ((aae140 == '110' || aae140 == '120') && aac063 == '1') {
			if (bglx == '1') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '1601',
					name : '养老供养亲属未提供生存证明'
				}, {
					id : '1602',
					name : '养老供养亲属被判刑收监执行或被劳动教养'
				}, {
					id : '1603',
					name : '养老供养亲属失踪'
				}, {
					id : '1606',
					name : '银行帐号错误'
				}, {
					id : '1607',
					name : '邮寄地址错误'
				}, {
					id : '1699',
					name : '其他原因暂停养老供养亲属待遇'
				} ]);
			}
			if (bglx == '2') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '1701',
					name : '养老供养亲属提供生存证明续发'
				}, {
					id : '1702',
					name : '刑满'
				}, {
					id : '1703',
					name : '失踪后生还'
				}, {
					id : '1799',
					name : '其他原因续发养老供养亲属待遇'
				} ]);

			}
			if (bglx == '3') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '1801',
					name : '养老供养亲属死亡'
				}, {
					id : '1804',
					name : '养老供养亲属达龄'
				}, {
					id : '1899',
					name : '其他原因终止养老供养亲属待遇'
				} ]);

			}
		}
		if ((aae140 == '110' || aae140 == '120') && aac063 == '') {

			if (bglx == '1') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '1201',
					name : '离退休人员未提供生存证明'
				}, {
					id : '1202',
					name : '离退休人员被判刑收监执行或被劳动教养'
				}, {
					id : '1203',
					name : '离退休人员失踪'
				}, {
					id : '1206',
					name : '银行帐号错误'
				}, {
					id : '1207',
					name : '邮寄地址错误'
				}, {
					id : '1299',
					name : '其他原因暂停养老待遇'
				}, {
					id : '1601',
					name : '养老供养亲属未提供生存证明'
				}, {
					id : '1602',
					name : '养老供养亲属被判刑收监执行或被劳动教养'
				}, {
					id : '1603',
					name : '养老供养亲属失踪'
				}, {
					id : '1606',
					name : '银行帐号错误'
				}, {
					id : '1607',
					name : '邮寄地址错误'
				}, {
					id : '1699',
					name : '其他原因暂停养老供养亲属待遇'
				} ]);
			}
			if (bglx == '2') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '1301',
					name : '离退休人员提供生存证明续发'
				}, {
					id : '1302',
					name : '刑满'
				}, {
					id : '1303',
					name : '失踪后生还'
				}, {
					id : '1304',
					name : '被判刑后暂予监外执行、假释'
				}, {
					id : '1399',
					name : '其他原因续发养老待遇'
				}, {
					id : '1701',
					name : '养老供养亲属提供生存证明续发'
				}, {
					id : '1702',
					name : '刑满'
				}, {
					id : '1703',
					name : '失踪后生还'
				}, {
					id : '1799',
					name : '其他原因续发养老供养亲属待遇'
				} ]);

			}
			if (bglx == '3') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '1401',
					name : '离退休人员死亡'
				}, {
					id : '1402',
					name : '离退休人员出国定居'
				}, {
					id : '1403',
					name : '离退休人员港澳台定居'
				}, {
					id : '1499',
					name : '其他原因终止养老待遇'
				}, {
					id : '1801',
					name : '离退休人员死亡'
				}, {
					id : '1804',
					name : '离退休人员出国定居'
				}, {
					id : '1899',
					name : '其他原因终止养老待遇'
				}, {
					id : '1801',
					name : '养老供养亲属死亡'
				}, {
					id : '1804',
					name : '养老供养亲属达龄'
				}, {
					id : '1899',
					name : '其他原因终止养老供养亲属待遇'
				} ]);
			}
		}
		if (aae140 == '210') {

			if (bglx == '1') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '2201',
					name : '无验证信息暂停'
				}, {
					id : '2202',
					name : '失业人员被判刑收监执行或被劳动教养'
				}, {
					id : '2203',
					name : '失业人员失踪'
				}, {
					id : '2204',
					name : '失业人员拒不接受职业介绍和就业指导'
				}, {
					id : '2206',
					name : '银行帐号错误'
				}, {
					id : '2207',
					name : '邮寄地址错误'
				}, {
					id : '2299',
					name : '其他原因暂停失业待遇'
				} ]);
			}
			if (bglx == '2') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '2301',
					name : '通过验证续发'
				}, {
					id : '2302',
					name : '刑满'
				}, {
					id : '2303',
					name : '失踪后生还'
				}, {
					id : '2399',
					name : '其他原因续发养老待遇'
				} ]);

			}
			if (bglx == '3') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '2401',
					name : '失业人员死亡'
				}, {
					id : '2402',
					name : '失业人员出国定居'
				}, {
					id : '2403',
					name : '失业人员港澳台定居'
				}, {
					id : '2404',
					name : '失业人员转出统筹范围外'
				}, {
					id : '2405',
					name : '失业人员待遇到期'
				}, {
					id : '2406',
					name : '失业人员重新就业'
				}, {
					id : '2407',
					name : '失业人员参军'
				}, {
					id : '2408',
					name : '失业人员退休'
				}, {
					id : '2411',
					name : '征集科新参保终止'
				}, {
					id : '2499',
					name : '其他原因终止失业待遇'
				} ]);

			}
		}
		if (aae140 == '410' && aac063 == '0') {

			if (bglx == '1') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '4201',
					name : '工伤职工未提供生存证明'
				}, {
					id : '4202',
					name : '工伤职工被判刑正在收监执行'
				}, {
					id : '4204',
					name : '工伤职工拒绝治疗'
				}, {
					id : '4205',
					name : '工伤职工拒不接受劳动能力鉴定'
				}, {
					id : '4206',
					name : '银行帐号错误'
				}, {
					id : '4207',
					name : '邮寄地址错误'
				}, {
					id : '4299',
					name : '其他原因暂停工伤待遇'
				} ]);
			}
			if (bglx == '2') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '4301',
					name : '工伤职工提供生存证明续发'
				}, {
					id : '4302',
					name : '刑满'
				}, {
					id : '1399',
					name : '其他原因续发工伤待遇'
				} ]);

			}
			if (bglx == '3') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '4401',
					name : '工伤停工留薪期内死亡'
				}, {
					id : '4402',
					name : '工伤停工留薪期满死亡'
				}, {
					id : '4403',
					name : '工伤失踪宣告死亡'
				}, {
					id : '4404',
					name : '工伤职工丧失享受待遇条件'
				}, {
					id : '4405',
					name : '伤残等级降至5级及以下'
				}, {
					id : '4406',
					name : '工伤离退休后死亡'
				}, {
					id : '4499',
					name : '其他原因终止工伤待遇'
				} ]);

			}
		}
		if (aae140 == '410' && aac063 == '1') {

			if (bglx == '1') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '4701',
					name : '工伤供养亲属未提供生存证明'
				}, {
					id : '4702',
					name : '工伤供养亲属被判刑正在收监执行'
				}, {
					id : '4704',
					name : '工伤供养亲属供养期内就业'
				}, {
					id : '4705',
					name : '工伤供养亲属供养期内参军'
				}, {
					id : '4706',
					name : '银行帐号错误'
				}, {
					id : '4707',
					name : '邮寄地址错误'
				}, {
					id : '4799',
					name : '其他原因暂停工伤供养亲属待遇'
				} ]);
			}
			if (bglx == '2') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '4801',
					name : '工伤供养亲属提供生存证明续发'
				}, {
					id : '4802',
					name : '刑满'
				}, {
					id : '1899',
					name : '其他原因续发工伤供养亲属待遇'
				} ]);

			}
			if (bglx == '3') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '4901',
					name : '工伤供养亲属死亡'
				}, {
					id : '4904',
					name : '供养亲属年满18周岁且未完全丧失劳动能力'
				}, {
					id : '4905',
					name : '工亡职工配偶再婚'
				}, {
					id : '4906',
					name : '工伤供养亲属被他人或组织收养'
				}, {
					id : '4999',
					name : '其他原因终止工伤供养亲属待遇'
				} ]);

			}
		}
		if (aae140 == '410' && aac063 == '') {
			if (bglx == '1') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '4201',
					name : '工伤职工未提供生存证明'
				}, {
					id : '4202',
					name : '工伤职工被判刑正在收监执行'
				}, {
					id : '4204',
					name : '工伤职工拒绝治疗'
				}, {
					id : '4205',
					name : '工伤职工拒不接受劳动能力鉴定'
				}, {
					id : '4206',
					name : '银行帐号错误'
				}, {
					id : '4207',
					name : '邮寄地址错误'
				}, {
					id : '4299',
					name : '其他原因暂停工伤待遇'
				}, {
					id : '4701',
					name : '工伤供养亲属未提供生存证明'
				}, {
					id : '4702',
					name : '工伤供养亲属被判刑正在收监执行'
				}, {
					id : '4704',
					name : '工伤供养亲属供养期内就业'
				}, {
					id : '4705',
					name : '工伤供养亲属供养期内参军'
				}, {
					id : '4706',
					name : '银行帐号错误'
				}, {
					id : '4707',
					name : '邮寄地址错误'
				}, {
					id : '4799',
					name : '其他原因暂停工伤供养亲属待遇'
				} ]);
			}
			if (bglx == '2') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '4301',
					name : '工伤职工提供生存证明续发'
				}, {
					id : '4302',
					name : '刑满'
				}, {
					id : '1399',
					name : '其他原因续发工伤待遇'
				}, {
					id : '4801',
					name : '工伤供养亲属提供生存证明续发'
				}, {
					id : '4802',
					name : '刑满'
				}, {
					id : '1899',
					name : '其他原因续发工伤供养亲属待遇'
				} ]);

			}
			if (bglx == '3') {
				Base.setSelectInputDataWidthJson("aae160", [ {
					id : '4401',
					name : '工伤停工留薪期内死亡'
				}, {
					id : '4402',
					name : '工伤停工留薪期满死亡'
				}, {
					id : '4403',
					name : '工伤失踪宣告死亡'
				}, {
					id : '4404',
					name : '工伤职工丧失享受待遇条件'
				}, {
					id : '4405',
					name : '伤残等级降至5级及以下'
				}, {
					id : '4406',
					name : '工伤离退休后死亡'
				}, {
					id : '4499',
					name : '其他原因终止工伤待遇'
				}, {
					id : '4901',
					name : '工伤供养亲属死亡'
				}, {
					id : '4904',
					name : '供养亲属年满18周岁且未完全丧失劳动能力'
				}, {
					id : '4905',
					name : '工亡职工配偶再婚'
				}, {
					id : '4906',
					name : '工伤供养亲属被他人或组织收养'
				}, {
					id : '4999',
					name : '其他原因终止工伤供养亲属待遇'
				} ]);

			}
		}
	}
	
	//打印
	function print() {
		var aae140 = Base.getValue("aae140");
		var aae016 = Base.getValue("aae016");
		var aae160 = Base.getValue("aae160");
		if (aae140 == "110") {
			var aab001 = Base.getValue("aab001");
			var aac001 = Base.getValue("aac001");
			var aae036_s = Base.getValue("aae036_s");
			var aae036_e = Base.getValue("aae036_e");
			if (aab001 == "" || aab001 == null) {
				Base.alert("单位编号为空，请确认！");
				return;
			}
			if (aae036_s == "" || aae036_s == null) {
				Base.alert("经办时间起为空，请确认！");
				return;
			}
			if (aae036_e == "" || aae036_e == null) {
				Base.alert("经办时间止为空，请确认！");
				return;
			}
			$("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=deadTreatment.raq&"
					+ "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
					+ "serverPagedPrint=no&mirror=no&paramString=aab001="+aab001+";aae036_s="+aae036_s+";aae036_e="+aae036_e+";aae016="+aae016+";aac001="+aac001);
	    }else if(aae140 == "210"){
	       var aae235 = Base.getValue("aae235");
	       if(aae235 == ''){
	    	   alert("请录入变动年月！");
	    	   return false;
	       }
	       $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SY_210zzrymd.raq&"
	    		   + "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
	    		   + "serverPagedPrint=no&mirror=no&"+ "paramString=aae140="+aae140+";aae235="+aae235+";aae016="+aae016+";aae160="+aae160);
	    }
	} 
	
	//打印失业通知单
	 function printSYTZ() {
	     var data = Base.getGridSelectedRows("Ac77Grid");
		 var reportVals = new Array();
	     for(var i=0;i < data.length;i++){
			       reportVals.push(data[i].aaz002);
	      }
	      $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=tinglingsybxj.raq&"
	    		  + "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
	    		  + "serverPagedPrint=no&mirror=no&" + "paramString=aaz002="+reportVals);
	} 
	//停续发人员名单打印
	function printTX(){
	  var aae140=Base.getValue("aae140");
	  var aaa099=Base.getValue("bglx");
	  var yab003=Base.getValue("yab003");
	  var aae041=Base.getValue("aae235");
	  var aae160=Base.getValue("aae160");
	  var aae036_s=Base.getValue("aae036_s");
	  var aae036_e=Base.getValue("aae036_e");	 
	  $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=tingxurymddy.raq&"
			  + "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
			  + "serverPagedPrint=no&mirror=no&"+ "paramString=aae140="+aae140+";aaa099="+aaa099+";yab003="+yab003
			  +";aae041="+aae041+";aae160="+aae160+";aae036_s="+aae036_s+";aae036_e="+aae036_e); 
	}
	
	//停续发人员名单汇总打印
	function printTXHZ(){
	  var aae140=Base.getValue("aae140");
	  var aaa099=Base.getValue("bglx");
	  var yab003=Base.getValue("yab003");
	  var aae041=Base.getValue("aae235");
	  var aae160=Base.getValue("aae160");
	  var aae036_s=Base.getValue("aae036_s");
	  var aae036_e=Base.getValue("aae036_e");	 
	  $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=tingxurymddy_hz.raq&"
			  + "srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"
			  + "serverPagedPrint=no&mirror=no&"+ "paramString=aae140="+aae140+";aaa099="+aaa099+";yab003="+yab003
			  +";aae041="+aae041+";aae160="+aae160+";aae036_s="+aae036_s+";aae036_e="+aae036_e); 
	}		
</script>
<%@ include file="/ta/incfooter.jsp"%>