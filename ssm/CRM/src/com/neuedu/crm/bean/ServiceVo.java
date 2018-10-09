package com.neuedu.crm.bean;

import java.util.Date;

public class ServiceVo {
	private Integer serviceId;
	private Integer servicecategoryId;
	private Integer serviceStyleId;
	private String summary;
	private String name;
	private String account;
	private String serviceCategory;
	private String serviceStyle;
	private Integer statusId;
	private Date startCreateDate;
	private Date endCreateDate;
	private String status;
	private Date createDate;
	private Integer dealId;
	
	public Integer getDealId() {
		return dealId;
	}
	public void setDealId(Integer dealId) {
		this.dealId = dealId;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	
	public Integer getServiceId() {
		return serviceId;
	}
	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}
	public Integer getServicecategoryId() {
		return servicecategoryId;
	}
	public void setServicecategoryId(Integer servicecategoryId) {
		this.servicecategoryId = servicecategoryId;
	}
	public Integer getServiceStyleId() {
		return serviceStyleId;
	}
	public void setServiceStyleId(Integer serviceStyleId) {
		this.serviceStyleId = serviceStyleId;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getServiceCategory() {
		return serviceCategory;
	}
	public void setServiceCategory(String serviceCategory) {
		this.serviceCategory = serviceCategory;
	}
	public String getServiceStyle() {
		return serviceStyle;
	}
	public void setServiceStyle(String serviceStyle) {
		this.serviceStyle = serviceStyle;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public Date getStartCreateDate() {
		return startCreateDate;
	}
	public void setStartCreateDate(Date startCreateDate) {
		this.startCreateDate = startCreateDate;
	}
	public Date getEndCreateDate() {
		return endCreateDate;
	}
	public void setEndCreateDate(Date endCreateDate) {
		this.endCreateDate = endCreateDate;
	}
	public ServiceVo() {
		super();
	}
	public ServiceVo(Integer serviceId, Integer servicecategoryId, Integer serviceStyleId, String summary, String name,
			String account, String serviceCategory, String serviceStyle, Integer statusId, Date startCreateDate,
			Date endCreateDate, String status, Date createDate, Integer dealId) {
		super();
		this.serviceId = serviceId;
		this.servicecategoryId = servicecategoryId;
		this.serviceStyleId = serviceStyleId;
		this.summary = summary;
		this.name = name;
		this.account = account;
		this.serviceCategory = serviceCategory;
		this.serviceStyle = serviceStyle;
		this.statusId = statusId;
		this.startCreateDate = startCreateDate;
		this.endCreateDate = endCreateDate;
		this.status = status;
		this.createDate = createDate;
		this.dealId = dealId;
	}
	@Override
	public String toString() {
		return "ServiceVo [serviceId=" + serviceId + ", servicecategoryId=" + servicecategoryId + ", serviceStyleId="
				+ serviceStyleId + ", summary=" + summary + ", name=" + name + ", account=" + account
				+ ", serviceCategory=" + serviceCategory + ", serviceStyle=" + serviceStyle + ", statusId=" + statusId
				+ ", startCreateDate=" + startCreateDate + ", endCreateDate=" + endCreateDate + ", status=" + status
				+ ", createDate=" + createDate + ", dealId=" + dealId + "]";
	}

}
