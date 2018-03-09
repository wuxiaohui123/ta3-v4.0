<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>WorkinjuryCognizanceCheck1</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" icon="xui-icon-spotSave" key="审核[S]"
				hotKey="S" onClick="submitData()" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose"
				hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');"
				asToolBarItem="true" />
			<ta:button id="printBtn" icon="icon-save" key="打印确认"
				asToolBarItem="true" display="false" />
		</ta:toolbar>

		<ta:form id="form1">
			<ta:box id="procInc">
				
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
			</ta:box>
			<!-- 个人基本信息初始化，能否从受理页面一起传过来，按照个人ID异步查询 -->
			<ta:panel id="fset1" cols="3" key="人员基本信息">
				<ta:text id="aac001" key="个人ID" readOnly="true" labelWidth="130"/>
				<ta:text id="aac003" key="姓 名" readOnly="true" labelWidth="130"/>
				<ta:text id="aac002" key="身份证号码" readOnly="true" labelWidth="130"/>
				<ta:text id="aab001_dq" key="当前单位ID" readOnly="true" labelWidth="130"/>
				<ta:text id="aae044_dq" key="当前单位名称" readOnly="true" span="2" labelWidth="130"/>
				<ta:text id="aab999_dq" key="单位管理码" readOnly="true" display="false" labelWidth="130"/>
			</ta:panel>		
			
			<!-- 录入工伤认定登记信息 -->
			<ta:panel id="gsrdxx" key="工伤认定信息" cols="3" >
				<ta:text id="aaz128" key="工伤申报id" display="false" />
				<ta:text id="aaz127" key="工伤认定id" display="false" />
				<ta:text id="aab001" key="工伤单位ID"  labelWidth="130"/>
				<ta:text id="aae044" key="工伤单位名称" readOnly="true" labelWidth="130"/>
				<ta:date id="alc020" key="工伤发生时间" showSelectPanel="true"  validNowTime="left" onChange="timealert();" labelWidth="130"/>
				<ta:selectInput id="alc021" key="伤害程度"  collection="ALC021" labelWidth="130"/>
				<ta:selectInput id="alc022" key="伤害部位"  collection="ALC022" labelWidth="130"/>
				<ta:selectInput id="ala023" key="与受伤害人关系"  collection="ALA023" labelWidth="130"/>
				<ta:selectInput id="ylc035" key="工伤人员类别"  collection="YLC035" value="1" filter="3" labelWidth="130"/>
				<ta:date id="alc040" key="死亡/失踪日期" showSelectPanel="true" validNowTime="left" labelWidth="130"/>
				<ta:selectInput id="ala016" key="认定依据" collection="ALA016"  labelWidth="130" />
				<ta:text id="alc011" key="认定书编号"  labelWidth="130" />
				<ta:date id="alc017" key="受理日期" validNowTime="left" showSelectPanel="true" labelWidth="130"  />
				<ta:selectInput id="alc029" key="工伤认定结论" collection="ALC029"  filter="3" labelWidth="130" />
				<ta:text id="alc030" key="工伤认定机构"  labelWidth="130" />
				<ta:date id="alc031" key="工伤认定日期" validNowTime="left" showSelectPanel="true" labelWidth="130"  />
				<ta:selectInput id="alc027" key="工亡类别" collection="ALC027" labelWidth="130" display="false"/>
				
				<ta:text id="aca111" key="职业/工种" labelWidth="130"/>
				<ta:selectInput id="ala017" key="职业病"  collection="ALA017" labelWidth="130"/>
				<ta:text id="alc007" key="诊断机构"  labelWidth="130"/>
				<ta:date id="ylc045" key="停工留薪期开始" validNowTime="left" labelWidth="130" showSelectPanel="true"/>
				<ta:date id="ylc046" key="停工留薪期结束" validNowTime="right" labelWidth="130" showSelectPanel="true"/>
				<ta:text id="aac042" key="申报人姓名"  labelWidth="130"/>
				<ta:selectInput id="aac043" key="申报人证件类型"  collection="AAC043" labelWidth="130"/>
				<ta:text id="aac044" key="申报人证件号码"  maxLength="18" labelWidth="130"/>
				<ta:text id="aac045" key="申报人电话" validType="mobile" labelWidth="130"/>
				<ta:text id="aac046" key="申报人地址" labelWidth="130"/>
				<ta:date id="alc026" key="报告日期" showSelectPanel="true" validNowTime="left" labelWidth="130"/>
		   		<ta:textarea id="alc006" span="3" key="伤害事件情况" maxLength="200" height="40px" labelWidth="130"/>
		   		<ta:textarea id="alc014" span="3" key="诊断意见" maxLength="200" height="40px" labelWidth="130"/>
		    </ta:panel>
		    
		 <!-- 历史工伤认定列表，可修改或删除选中项 -->
			<ta:panel key="工伤认定历史信息" id="lsrdxx" >
				<ta:datagrid id="lc31Grid" >					
					<ta:datagridItem id="aaz128" key="工伤申报ID" hiddenColumn="true"/>
					<ta:datagridItem id="aab001" key="单位ID"  hiddenColumn="true"/>
					<ta:datagridItem id="aab999" key="单位管理码"  hiddenColumn="true"/>
					<ta:datagridItem id="aae044" key="单位名称"  width="200" />
		            <ta:datagridItem id="alc020" key="工伤发生时间" width="120"/>
		            <ta:datagridItem id="alc022" key="伤害部位" collection="ALC022"/>
		            <ta:datagridItem id="alc021" key="伤害程度" collection="ALC021"/>
					<ta:datagridItem id="ala023" key="与受伤害人关系" collection="ALA023" width="120"/>
					<ta:datagridItem id="alc026" key="报告日期" />
					<ta:datagridItem id="alc007" key="诊断机构" />
					<ta:datagridItem id="aca111" key="职业/工种" collection="ACA111"/>
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017" />
					<ta:datagridItem id="ylc035" key="工伤人员类别" collection="YLC035" width="120"/>
					<ta:datagridItem id="alc040" key="因工死亡(失踪)日期" width="140"/>					
					<ta:datagridItem id="aaz127" key="工伤认定信息ID" hiddenColumn="true"  />
					<ta:datagridItem id="ylc043" key="解除劳动合同"  width="120" hiddenColumn="true" />
					<ta:datagridItem id="ala016" key="认定依据" collection="ALA016"/>
					<ta:datagridItem id="alc011" key="认定书编号" />
					<ta:datagridItem id="alc017" key="受理日期"  />
					<ta:datagridItem id="alc029" key="工伤认定结论" collection="ALC029" width="120"/>
					<ta:datagridItem id="alc030" key="工伤认定机构"  width="120"/>
					<ta:datagridItem id="alc031" key="工伤认定日期"  width="120"/>
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027" />
					<ta:datagridItem id="ylc045" key="停工留薪期开始" width="120" />
					<ta:datagridItem id="ylc046" key="停工留薪期结束" width="120" />
					
					<ta:datagridItem id="aac042" key="申报人姓名" hiddenColumn="true" />
					<ta:datagridItem id="aac043" key="申报人证件类型" hiddenColumn="true" />
					<ta:datagridItem id="aac044" key="申报人证件号码" hiddenColumn="true" />
					<ta:datagridItem id="aac045" key="申报人电话" hiddenColumn="true" />
					<ta:datagridItem id="aac046" key="申报人地址" hiddenColumn="true" />
					<ta:datagridItem id="alc026" key="报告日期" hiddenColumn="true" />
					<ta:datagridItem id="alc006" key="伤害事件情况" hiddenColumn="true" />
					<ta:datagridItem id="alc014" key="诊断意见" hiddenColumn="true" />
				</ta:datagrid>
			</ta:panel>
		</ta:form>

	</body>
</html>
<script type="text/javascript">
	//初始化布局
	$(document).ready(function() {
		$("body").taLayout();
		Base.setReadOnly("gsrdxx");
	});

	//保存经办信息
	function submitData(){
		Base.submit("form1", "workinjuryCognizanceCheck1Action!toSave.do");
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>
