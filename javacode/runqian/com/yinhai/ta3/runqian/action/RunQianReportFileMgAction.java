package com.yinhai.ta3.runqian.action;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.util.StringUtil;
import com.yinhai.ta3.runqian.domain.ReportResource;
import com.yinhai.ta3.runqian.service.RunQianReportFileMgService;
import com.yinhai.webframework.BaseAction;

public class RunQianReportFileMgAction extends BaseAction {

	private RunQianReportFileMgService runQianReportFileMgService = (RunQianReportFileMgService) getService("runQianReportFileMgService");
	private File theFile;
	private String theFileFileName;
	private String theFileContentType;

	public String execute() throws Exception {
		return SUCCESS;
	}

	public String queryBB() throws Exception {
		List objList = runQianReportFileMgService.queryBB(getDto());
		setList("rqbbGrid", objList);
		return JSON;
	}

	public String addBB() throws Exception {
		ParamDTO dto = getDto();
		String filename = getDto().getAsString("filename");
		String yab109 = getDto().getAsString("yab109");
		if (!"com".equals(yab109)) {
			yab109 = getDto().getUserInfo().getDepartId();
		}
		if ((theFileContentType.equals("application/octet-stream")) && (filename.endsWith(".raq"))) {
			filename = filename.substring(filename.lastIndexOf("\\") + 1, filename.lastIndexOf("."));

			String uploador = getDto().getUserInfo().getUserId();
			Timestamp uploadTime = runQianReportFileMgService.getSysTimestamp();
			Map<String, Object> map = new HashMap();
			map.put("uploador", uploador);
			map.put("uploadTime", uploadTime);
			map.put("filename", filename);
			map.put("orgId", yab109);
			InputStream ins = new FileInputStream(theFile.getPath());
			map.put("filecontent", ins);
			String msg = runQianReportFileMgService.insertBB(map, dto);
			if (StringUtil.isNotEmpty(msg)) {
				setSuccess(false);
				setMsg(msg);
			} else {
				setMsg("提交成功！");
			}
			String flag = dto.getAsString("flag");
			if ("a1".equals(flag)) {
				setShowObj("raqpid");
				setData("parentraqfilename", dto.getAsString("parentraqfilename"));
				setReadOnly("raqtype");
				setData("raqtype", "2");
				setData("raqname", dto.getAsString("raqname") + "子报表");
			} else if ("a2".equals(flag)) {
				setData("raqtype", "1");
				setData("parentraqfilename", "");
			}
		} else {
			setSuccess(false);
			setMsg("请选择文件格式为.raq为后缀的文件！");
		}
		return "edit";
	}

	public String editBB() throws Exception {
		ParamDTO dto = getDto();
		String filename = dto.getAsString("filename");
		String selectedfile = dto.getAsString("selectedfile");
		String yab109 = getDto().getAsString("yab109");
		if (!"com".equals(yab109)) {
			yab109 = getDto().getUserInfo().getDepartId();
		}
		String uploador = dto.getUserInfo().getUserId();
		Timestamp uploadTime = runQianReportFileMgService.getSysTimestamp();
		dto.put("yab109", yab109);
		dto.put("uploador", uploador);
		dto.put("uploadTime", uploadTime);
		if (StringUtil.isNotEmpty(filename)) {
			if ((theFileContentType.equals("application/octet-stream")) && (filename.endsWith(".raq"))) {
				filename = filename.substring(filename.lastIndexOf("\\") + 1, filename.lastIndexOf("."));

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("uploador", uploador);
				map.put("uploadTime", uploadTime);
				map.put("filename", filename);
				InputStream ins = new FileInputStream(theFile.getPath());
				map.put("filecontent", ins);
				map.put("yab109", yab109);
				String msg = runQianReportFileMgService.updateBB(map, dto);
				if (StringUtil.isNotEmpty(msg)) {
					setSuccess(false);
					setMsg(msg);
				} else {
					setMsg("修改成功！");
				}
				String flag = dto.getAsString("flag");
				setShowObj("updateBtn,raqfilename,raqfileBox");
				setHideObj("saveBtn,file_id");
				setData("selectedfile", selectedfile);
				setData("raqname", dto.getAsString("raqname"));
				setData("raqfilename", dto.getAsString("raqfilename"));
				setData("raqtype", dto.getAsString("raqtype"));
				setReadOnly("raqtype");
				if ("u1".equals(flag)) {
					setShowObj("parentraqfilename,subrow,subcell");
					setData("subcell", dto.getAsString("subcell"));
					setData("subrow", dto.getAsString("subrow"));
					setData("parentraqfilename", dto.getAsString("parentraqfilename"));
				} else if ("u2".equals(flag)) {
					setData("parentraqfilename", "");
				}
				return "edit";
			}
			setSuccess(false);
			setMsg("请选择文件格式为.raq为后缀的文件！");
		} else {
			String msg = runQianReportFileMgService.updateBB(null, dto);
			if (StringUtil.isNotEmpty(msg)) {
				setSuccess(false);
				setMsg(msg);
			} else {
				setMsg("修改成功！");
			}
			String flag = dto.getAsString("flag");
			setShowObj("updateBtn,raqfilename,raqfileBox");
			setHideObj("saveBtn,file_id");
			setData("selectedfile", selectedfile);
			setData("raqname", dto.getAsString("raqname"));
			setData("raqfilename", dto.getAsString("raqfilename"));
			setData("raqtype", dto.getAsString("raqtype"));
			setReadOnly("raqtype");
			if ("u1".equals(flag)) {
				setShowObj("parentraqfilename,subrow,subcell");
				setData("subcell", dto.getAsString("subcell"));
				setData("subrow", dto.getAsString("subrow"));
				setData("parentraqfilename", dto.getAsString("parentraqfilename"));
			} else if ("u2".equals(flag)) {
				setData("parentraqfilename", "");
			}
			return "edit";
		}
		return "edit";
	}

	public String deleteBB() throws Exception {
		ParamDTO dto = getDto();
		String yab109 = getDto().getUserInfo().getDepartId();
		dto.put("yab109", yab109);
		dto.put("rqbbList", getSelected("rqbbGrid"));
		runQianReportFileMgService.deleteBB(dto);
		setMsg("删除成功！");
		return JSON;
	}

	public String downloadBB() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		ParamDTO dto = getDto();
		String raqfilename = dto.getAsString("raqfilename");
		if (StringUtil.isNotEmpty(raqfilename)) {
			List l = runQianReportFileMgService.getRaqFile(raqfilename);
			if ((l != null) && (l.size() == 1)) {
				ReportResource r = (ReportResource) l.get(0);
				if (r.getRaqfile() != null) {
					byte[] b = r.getRaqfile();
					response.setContentType("application/octet-stream");
					response.setHeader("Content-Disposition", "attachment; filename=" + new String(raqfilename.getBytes("GB2312"), "ISO8859-1")
							+ ".raq");
					DataOutputStream out = new DataOutputStream(response.getOutputStream());
					out.write(b);
					out.flush();
					out.close();
				}
			}
		}

		return null;
	}

	public String toViewAdd() throws Exception {
		ParamDTO dto = getDto();
		String flag = dto.getAsString("flag");
		setData("flag", flag);
		if (StringUtil.isNotEmpty(flag)) {
			setData("raqname", URLDecoder.decode(dto.getAsString("raqname"), "utf-8"));
			if (flag.startsWith("a")) {
				if ("a1".equals(flag)) {
					setShowObj("parentraqfilename");
					setHideObj("yab109");
					setData("parentraqfilename", dto.getAsString("raqfilename"));
					setReadOnly("raqtype");
					setData("raqtype", "2");
					setData("raqname", URLDecoder.decode(dto.getAsString("raqname"), "utf-8") + "子报表");
				} else if ("a2".equals(flag)) {
					setData("raqtype", "1");
					setData("parentraqfilename", "");
				}
			} else if (flag.startsWith("u")) {
				String selectedfile = dto.getAsString("selectedfile");
				setShowObj("updateBtn,raqfilename,raqfileBox");
				setHideObj("saveBtn,file_id");
				setData("selectedfile", selectedfile + ".raq");
				setData("raqfilename", dto.getAsString("raqfilename"));
				setData("raqtype", dto.getAsString("raqtype"));
				setReadOnly("raqtype");
				if ("u1".equals(flag)) {
					setShowObj("parentraqfilename");
					setData("parentraqfilename", dto.getAsString("parentraqfilename"));
				} else if ("u2".equals(flag)) {
					setData("parentraqfilename", "");
					if ("com".equals(dto.getAsString("yab109"))) {
						setData("yab109", "com");
					}
				}
			}
		}
		return "edit";
	}

	public File getTheFile() {
		return theFile;
	}

	public void setTheFile(File theFile) {
		this.theFile = theFile;
	}

	public String getTheFileFileName() {
		return theFileFileName;
	}

	public void setTheFileFileName(String theFileFileName) {
		this.theFileFileName = theFileFileName;
	}

	public String getTheFileContentType() {
		return theFileContentType;
	}

	public void setTheFileContentType(String theFileContentType) {
		this.theFileContentType = theFileContentType;
	}
}
