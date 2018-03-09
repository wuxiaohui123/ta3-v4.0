package com.yinhai.ta3.runqian.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

public class RunqianPrintFilter implements Filter {

	private ArrayList<String> includes;

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		String target = request.getRequestURI();
		target = target.lastIndexOf("?") > 0 ? target.substring(target.lastIndexOf("/") + 1, target.lastIndexOf("?") - target.lastIndexOf("/"))
				: target.substring(target.lastIndexOf("/") + 1);

		if ((includes.contains(target)) && (target.equals("pagedPrintServer"))) {
			RequestDispatcher rdsp = request.getRequestDispatcher(target);
			rdsp.forward(req, resp);
		} else if ((includes.contains(target)) && (target.equals("reportServlet"))) {
			chain.doFilter(new HTMLCharacterRequest(request), response);
		} else {
			chain.doFilter(req, resp);
		}
	}

	public RunqianPrintFilter() {
		includes = new ArrayList();
	}

	public void init(FilterConfig config) throws ServletException {
		includes.addAll(Arrays.asList(config.getInitParameter("includeServlets").split(",")));
	}

	class HTMLCharacterRequest extends HttpServletRequestWrapper {
		public HTMLCharacterRequest(HttpServletRequest request) {
			super(request);
		}

		public String getParameter(String name) {
			return RunqianPrintFilter.this.filter(super.getParameter(name));
		}

		public String[] getParameterValues(String name) {
			String[] values = super.getParameterValues(name);
			if ((values == null) || (values.length == 0))
				return values;
			for (int i = 0; i < values.length; i++) {
				String str = values[i];
				values[i] = RunqianPrintFilter.this.filter(str);
			}
			return values;
		}
	}

	private String filter(String value) {
		if (value == null) {
			return null;
		}
		char[] content = new char[value.length()];
		value.getChars(0, value.length(), content, 0);
		StringBuilder result = new StringBuilder(content.length + 50);
		for (int i = 0; i < content.length; i++) {
			switch (content[i]) {
			case '<':
				result.append("");
				break;
			case '>':
				result.append("");
				break;
			case '\'':
				result.append("");
				break;
			case '"':
				result.append("");
				break;
			default:
				result.append(content[i]);
			}
		}
		return result.toString();
	}

	public void destroy() {
	}
}
