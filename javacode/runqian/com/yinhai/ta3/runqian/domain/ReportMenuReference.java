package com.yinhai.ta3.runqian.domain;

import java.io.Serializable;

public class ReportMenuReference implements Serializable {

	private Long id;
	private ReportResource reportResource;
	private Long menuid;
	private Double limited;
	private Double scaleexp;
	private String isgroup;
	private String needsaveasexcel;
	private String needsaveasexcel2007;
	private String needsaveaspdf;
	private String needsaveasword;
	private String needsaveastext;
	private String needprint;

	public ReportMenuReference() {
	}

	public ReportMenuReference(ReportResource reportResource, Long menuid, Double limited, Double scaleexp, String isgroup, String needsaveasexcel,
			String needsaveasexcel2007, String needsaveaspdf, String needsaveasword, String needsaveastext, String needprint) {
		this.reportResource = reportResource;
		this.menuid = menuid;
		this.limited = limited;
		this.scaleexp = scaleexp;
		this.isgroup = isgroup;
		this.needsaveasexcel = needsaveasexcel;
		this.needsaveasexcel2007 = needsaveasexcel2007;
		this.needsaveaspdf = needsaveaspdf;
		this.needsaveasword = needsaveasword;
		this.needsaveastext = needsaveastext;
		this.needprint = needprint;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ReportResource getReportResource() {
		return reportResource;
	}

	public void setReportResource(ReportResource reportResource) {
		this.reportResource = reportResource;
	}

	public Long getMenuid() {
		return menuid;
	}

	public void setMenuid(Long menuid) {
		this.menuid = menuid;
	}

	public Double getLimited() {
		return limited;
	}

	public void setLimited(Double limited) {
		this.limited = limited;
	}

	public Double getScaleexp() {
		return scaleexp;
	}

	public void setScaleexp(Double scaleexp) {
		this.scaleexp = scaleexp;
	}

	public String getIsgroup() {
		return isgroup;
	}

	public void setIsgroup(String isgroup) {
		this.isgroup = isgroup;
	}

	public String getNeedsaveasexcel() {
		return needsaveasexcel;
	}

	public void setNeedsaveasexcel(String needsaveasexcel) {
		this.needsaveasexcel = needsaveasexcel;
	}

	public String getNeedsaveasexcel2007() {
		return needsaveasexcel2007;
	}

	public void setNeedsaveasexcel2007(String needsaveasexcel2007) {
		this.needsaveasexcel2007 = needsaveasexcel2007;
	}

	public String getNeedsaveaspdf() {
		return needsaveaspdf;
	}

	public void setNeedsaveaspdf(String needsaveaspdf) {
		this.needsaveaspdf = needsaveaspdf;
	}

	public String getNeedsaveasword() {
		return needsaveasword;
	}

	public void setNeedsaveasword(String needsaveasword) {
		this.needsaveasword = needsaveasword;
	}

	public String getNeedsaveastext() {
		return needsaveastext;
	}

	public void setNeedsaveastext(String needsaveastext) {
		this.needsaveastext = needsaveastext;
	}

	public String getNeedprint() {
		return needprint;
	}

	public void setNeedprint(String needprint) {
		this.needprint = needprint;
	}
}
