package com.yinhai.ta3.runqian.servlet;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.runqian.base4.util.ArgumentTokenizer;
import com.runqian.base4.util.Escape;
import com.yinhai.sysframework.service.ServiceLocator;
import com.yinhai.ta3.runqian.service.SavePrintSetupService;

public class TaPrintSetupServlet extends HttpServlet {

	private boolean saveScale = false;
	private SavePrintSetupService service = (SavePrintSetupService) ServiceLocator.getService("savePrintSetupService");

	public void init() throws ServletException {
		String scale = getServletConfig().getInitParameter("saveDisplayScale");
		saveScale = "yes".equalsIgnoreCase(scale);
	}

	public void service(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			pw = response.getWriter();
			String action = request.getParameter("action");
			String key = request.getParameter("key");
			if ("write".equalsIgnoreCase(action)) {
				String width = request.getParameter("width");
				String height = request.getParameter("height");
				String x = request.getParameter("x");
				String y = request.getParameter("y");
				String w = request.getParameter("w");
				String h = request.getParameter("h");
				String orientation = request.getParameter("orientation");
				String printerName = request.getParameter("printerName");
				String a = request.getParameter("a");
				String scale = request.getParameter("scale");
				String setup = width + "|" + height + "|" + x + "|" + y + "|" + w + "|" + h + "|" + orientation + "|" + printerName + "|" + a + "|"
						+ scale;

				service.savePrintSetup(key, setup);
				pw.println("ok");
			} else {
				String setup = service.getPrintSetup(key);
				if (setup != null) {
					ArgumentTokenizer at = new ArgumentTokenizer(setup, '|');

					pw.println("width=" + at.nextToken());
					pw.println("height=" + at.nextToken());
					pw.println("x=" + at.nextToken());
					pw.println("y=" + at.nextToken());
					pw.println("w=" + at.nextToken());
					pw.println("h=" + at.nextToken());
					pw.println("orientation=" + at.nextToken());
					pw.println("printerName=" + Escape.add(at.nextToken()));
					if (at.hasMoreTokens())
						pw.println("a=" + at.nextToken());
					if (at.hasMoreTokens()) {
						String scale = at.nextToken();
						if (saveScale)
							pw.println("scale=" + scale);
					}
					pw.println("setup=yes");
				} else {
					pw.println("setup=no");
				}
			}
			pw.flush();
		} catch (Exception e) {
			e.printStackTrace();
			if (pw != null)
				pw.println("setup=no");
		} finally {
			if (pw != null) {
				pw.close();
			}
		}
	}
}
