package com.yinhai.ta3.runqian.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class ReportResource implements Serializable {

	private String raqfilename;
	private ReportResource reportResource;
	private String raqname;
	private String raqtype;
	private byte[] raqfile;
	private String uploador;
	private Date uploadtime;
	private Long subrow;
	private Long subcell;
	private String raqdatasource;
	private String raqparam;
	private String orgid;
	private Set reportResources = new HashSet(0);
	private Set reportMenuReference = new HashSet(0);

	public ReportResource() {
	}

	public ReportResource(String raqfilename, String raqname, String raqtype, String uploador, Date uploadtime) {
		this.raqfilename = raqfilename;
		this.raqname = raqname;
		this.raqtype = raqtype;
		this.uploador = uploador;
		this.uploadtime = uploadtime;
	}

	public ReportResource(String raqfilename, String raqtype, byte[] raqfile) {
		this.raqfilename = raqfilename;
		this.raqtype = raqtype;
		this.raqfile = raqfile;
	}

	public ReportResource(String raqtype, byte[] raqfile, String raqname) {
		this.raqname = raqname;
		this.raqtype = raqtype;
		this.raqfile = raqfile;
	}

	public ReportResource(ReportResource reportResource, String raqname, String raqtype, byte[] raqfile, String uploador, Date uploadtime,
			Long subrow, Long subcell, String raqdatasource, String raqparam, String orgid, Set reportResources, Set reportMenuReference) {
		this.reportResource = reportResource;
		this.raqname = raqname;
		this.raqtype = raqtype;
		this.raqfile = raqfile;
		this.uploador = uploador;
		this.uploadtime = uploadtime;
		this.subrow = subrow;
		this.subcell = subcell;
		this.raqdatasource = raqdatasource;
		this.raqparam = raqparam;
		this.orgid = orgid;
		this.reportResources = reportResources;
		this.reportMenuReference = reportMenuReference;
	}

	public String getRaqfilename() {
		return raqfilename;
	}

	public void setRaqfilename(String raqfilename) {
		this.raqfilename = raqfilename;
	}

	public ReportResource getReportResource() {
		return reportResource;
	}

	public void setReportResource(ReportResource reportResource) {
		this.reportResource = reportResource;
	}

	public String getRaqname() {
		return raqname;
	}

	public void setRaqname(String raqname) {
		this.raqname = raqname;
	}

	public String getRaqtype() {
		return raqtype;
	}

	public void setRaqtype(String raqtype) {
		this.raqtype = raqtype;
	}

	public byte[] getRaqfile() {
		return raqfile;
	}

	public void setRaqfile(byte[] raqfile) {
		this.raqfile = raqfile;
	}

	public String getUploador() {
		return uploador;
	}

	public void setUploador(String uploador) {
		this.uploador = uploador;
	}

	public Date getUploadtime() {
		return uploadtime;
	}

	public void setUploadtime(Date uploadtime) {
		this.uploadtime = uploadtime;
	}

	public Long getSubrow() {
		return subrow;
	}

	public void setSubrow(Long subrow) {
		this.subrow = subrow;
	}

	public Long getSubcell() {
		return subcell;
	}

	public void setSubcell(Long subcell) {
		this.subcell = subcell;
	}

	public String getRaqdatasource() {
		return raqdatasource;
	}

	public void setRaqdatasource(String raqdatasource) {
		this.raqdatasource = raqdatasource;
	}

	public String getRaqparam() {
		return raqparam;
	}

	public void setRaqparam(String raqparam) {
		this.raqparam = raqparam;
	}

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public Set getReportResources() {
		return reportResources;
	}

	public void setReportResources(Set reportResources) {
		this.reportResources = reportResources;
	}

	public Set getReportMenuReference() {
		return reportMenuReference;
	}

	public void setReportMenuReference(Set reportMenuReference) {
		this.reportMenuReference = reportMenuReference;
	}
}
