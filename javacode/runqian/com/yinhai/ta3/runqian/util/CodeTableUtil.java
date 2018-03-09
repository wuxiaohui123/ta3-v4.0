package com.yinhai.ta3.runqian.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.runqian.base4.util.ReportError;
import com.runqian.report4.model.expression.Expression;
import com.runqian.report4.model.expression.Function;
import com.runqian.report4.model.expression.Variant2;
import com.runqian.report4.usermodel.Context;
import com.yinhai.sysframework.codetable.service.CodeTableLocator;
import com.yinhai.sysframework.iorg.IUser;
import com.yinhai.sysframework.util.WebUtil;


public class CodeTableUtil extends Function {

	public Object calculate(Context arg0, boolean arg1) {
		String codeDesc = null;

		String yab003 = "9999";

		HttpServletRequest request = ServletActionContext.getRequest();

		IUser user = WebUtil.getUserInfo(request);

		if (null != user) {
			yab003 = user.getYab003();
		}

		if (paramList.size() < 2) {
			throw new ReportError("函数GetCodeDesc()必须拥有码值和码表类型这两个参数");
		}

		Expression param1 = (Expression) paramList.get(0);
		Expression param2 = (Expression) paramList.get(1);

		if ((param1 == null) || (param2 == null)) {
			throw new ReportError("传入函数GetCodeDesc()的参数�?为空");
		}

		Object result1 = Variant2.getValue(param1.calculate(arg0, arg1), false, arg1);

		Object result2 = Variant2.getValue(param2.calculate(arg0, arg1), false, arg1);

		if ((result1 == null) || (result2 == null)) {
			throw new ReportError("函数GetCodeDesc()中存在无效的表达式");
		}
		String codeValue = result1.toString();
		String codeType = result2.toString();

		codeDesc = CodeTableLocator.getCodeDesc(codeType, codeValue, yab003);

		return codeDesc;
	}
}
