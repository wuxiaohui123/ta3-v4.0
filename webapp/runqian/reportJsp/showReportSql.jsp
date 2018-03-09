<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/runqianReport4.tld" prefix="report" %>
<%@taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@ include file="/ta/inc.jsp"%>
	<link type="text/css" href="<%=basePath %>runqian/reportJsp/css/style.css" rel="stylesheet"/>
</head>
<body>
<ta:fieldset key="ddddd">
	<ta:text id="aaa" key="aaaa"/>
	<ta:selectInput id="yad001" key="银行类别" collection="YAD001"  onChange="changeYad"/>
	<ta:button key="按钮" onClick="test()"/>
</ta:fieldset>
<ta:panel fit="true" key="报表">
	<jsp:include page="toolbar.jsp" flush="false" />
	<ta:box fit="true" cssStyle="overflow:auto;">
		<center>
				<report:html name="report1" 
					beanName='<%=request.getParameter("reportName")%>' 
					srcType="defineBean" 
					funcBarLocation="top" 
					needPageMark="yes" 
					generateParamForm="no" 
					needPivot="yes" 
					pivotLabel="" 
					pageMarkLabel=""
					firstPageLabel=""
		            prevPageLabel=""
		            nextPageLabel=""
		            lastPageLabel=""
				/>
		  </center>
		</span>
	</ta:box>
</ta:panel>
</body>
<script language="javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function test() {
		Base.doPrintView("tongqibi");
	}
	function changeYad(value,key){
		alert("asdsd");
		if(value!=null && value!=""){
			alert('asdasd');
			Base.setEnable(['aaz065','yaa005','yaa007']);
			Base.setValue('yaa005',"");
			Base.setValue('yaa007',"");
			Base.submit('fld1','csi3102Action!changeYad.do');
		}
	}

	//设置分页显示值
	document.getElementById( "t_page_span" ).innerHTML=report1_getTotalPage();
	document.getElementById( "c_page_span" ).innerHTML=report1_getCurrPage();
</script>
</html>