<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>资源文件上传</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
	<ta:form id="form1" enctype="multipart/form-data" methord="post">
		<ta:panel cols="3" key="文件信息" scalable="false">
			<ta:selectInput key="文件大类" id="yae800" collection="YAE800" required="true" onSelect="checkYae801FromYae800" />
			<ta:selectInput key="文件小类" id="yae801" collection="YAE801" required="true" />
			<ta:selectInput key="文件级别" id="yae809" collection="YAE809" required="true" />
			<ta:box cols="5">
				<ta:text key="文件编号" id="yae800_bak" columnWidth="0.3" required="true" readOnly="true" bpopTipMsg="以文件大类加'-'分类" />
				<ta:text id="yae800_icon" columnWidth="0.1" labelWidth="0" value="-" readOnly="true" />
				<ta:text id="yae263" span="3" labelWidth="0" required="true" maxLength="47" readOnly="true" onChange="checkYae263();" />
			</ta:box>
			<ta:text key="资源标题" id="yae264" span="2" required="true" maxLength="200" />
			<ta:text key="版本号" id="yae274" display="false" />
			<ta:selectInput key="是否显示" id="yae808" collection="YAE808" value="1" required="true" />
			<ta:text key="关键字" id="yae802" span="1" maxLength="200" />
			<ta:text key="描述" id="yae267" span="3" maxLength="200" />
			<ta:text id="file" name="file" type="file" cssStyle="height: 25px;" key="附件" span="3" />
			<!--  
				<ta:text key="颁布单位" id="yae804" span="2" maxLength="200" />
				<ta:date key="颁布日期" id="yae805" onChange="fn_checkTime();" showSelectPanel="true" />
				<ta:text key="发文号  " id="yae807" span="2" />
				<ta:date key="实施日期" id="yae806" onChange="fn_checkTime();" showSelectPanel="true" />
				-->
		</ta:panel>
		<ta:buttonLayout id="ButtonLayout1">
			<ta:submit id="save" key="新增[A]" icon="xui-icon-spotSave" hotKey="A" isSyncSubmit="true" submitIds="form1" url="swfFileUploadAction!insert.do" onSubmit="fnOnSubmit" />
			<ta:submit id="edit" key="更新[U]" icon="xui-icon-spotSave" hotKey="U" isSyncSubmit="true" submitIds="form1" url="swfFileUploadAction!update.do" onSubmit="fnOnUpdate" />
		</ta:buttonLayout>
	</ta:form>
</body>
</html>
<script>
	$(document).ready(function() {
		$("body").taLayout();
		Base.focus("yae800");
		initializeSuggestFramework(1, null, 'yae263', 500, 200, 2, fnSelect1, 0, false);
	});

	//检查两个时间的关系
	function fn_checkTime() {
		var yae805 = Base.getValue('yae805');//颁布日期
		var yae806 = Base.getValue('yae806');//实施日期
		if (yae805 != '' && yae806 != '') {
			if (yae805 > yae806) {
				Base.alert('颁布日期不能晚于实施日期', "warn");
				Base.setValue('yae806', '');
				return false;
			}
		}
		return true;
	}

	//根据文件大类获取文件小类
	function checkYae801FromYae800() {
		Base.submit('yae800,yae801', 'swfFileUploadAction!getYae801FromYae800.do');
		var yae800_bak = Base.getValue("yae800");
		Base.setValue("yae800_bak", yae800_bak);
		// 检查文件编号是否重复
		checkDocmentIdIsRepeat();
	}

	//新增提交时检查数据有效性
	function fnOnSubmit() {
		if (Base.validateForm("form1")) {
			if (!$("#file").val()) {
				Base.alert("请选择要导入的数据文件。");
				return false;
			}
			;
			$("#form1").attr("ENCTYPE", "multipart/form-data");
			if (!fn_checkTime()) {
				return false;
			}

			return true;
		}
	}

	//更新提交时检查数据有效性
	function fnOnUpdate() {
		if (Base.validateForm("form1")) {
			$("#form1").attr("ENCTYPE", "multipart/form-data");
			if (!fn_checkTime()) {
				return false;
			}
			return true;
		}
	}

	//同步数据
	function fnSelect1() {
		Base.setValue("yae264", '操作手册：' + g_Suggest[1]);
		Base.focus("yae802");
		// 检查文件编号是否重复
		checkDocmentIdIsRepeat();
	}

	function checkYae263() {
		var yae800 = Base.getValue("yae800");
		if (yae800 == '02') {
			sfwQueryUtil(1, 'getYae049', Base.getValue('yae263'));
		} else {
			// 检查文件编号是否重复
			checkDocmentIdIsRepeat();
		}
	}

	// 配置编号-检查文件编号是否重复
	function checkDocmentIdIsRepeat() {
		var yae800_bak = Base.getValue("yae800_bak");
		var yae800_icon = Base.getValue("yae800_icon");
		var yae263 = Base.getValue("yae263");
		if (yae800_bak == "" || yae800_icon == "" || yae263 == "") {
			return false;
		}
		yae263 = yae800_bak + yae800_icon + yae263;
		Base.submit("", "swfFileUploadAction!getDocmentIdIsRepeat.do", {
			"dto['yae263']" : yae263
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>