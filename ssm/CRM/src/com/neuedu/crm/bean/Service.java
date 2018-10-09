package com.neuedu.crm.bean;

import java.util.Date;

public class Service {
	private Integer serviceId;

	private WordBook servicecategoryId;

	private WordBook serviceStyle;

	private String summary;

	private Customer customer;

	private String request;

	private User createId;

	private Date createDate;

	private WordBook statusId;

	private User principalId;

	private Date principalDate;

	private String dealContent;

	private User dealId;

	private Date dealDate;

	private String result;

	private WordBook evaluateId;

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public WordBook getServicecategoryId() {
		return servicecategoryId;
	}

	public void setServicecategoryId(WordBook servicecategoryId) {
		this.servicecategoryId = servicecategoryId;
	}

	public WordBook getServiceStyle() {
		return serviceStyle;
	}

	public void setServiceStyle(WordBook serviceStyle) {
		this.serviceStyle = serviceStyle;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public User getCreateId() {
		return createId;
	}

	public void setCreateId(User createId) {
		this.createId = createId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public WordBook getStatusId() {
		return statusId;
	}

	public void setStatusId(WordBook statusId) {
		this.statusId = statusId;
	}

	public User getPrincipalId() {
		return principalId;
	}

	public void setPrincipalId(User principalId) {
		this.principalId = principalId;
	}

	public Date getPrincipalDate() {
		return principalDate;
	}

	public void setPrincipalDate(Date principalDate) {
		this.principalDate = principalDate;
	}

	public String getDealContent() {
		return dealContent;
	}

	public void setDealContent(String dealContent) {
		this.dealContent = dealContent;
	}

	public User getDealId() {
		return dealId;
	}

	public void setDealId(User dealId) {
		this.dealId = dealId;
	}

	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public WordBook getEvaluateId() {
		return evaluateId;
	}

	public void setEvaluateId(WordBook evaluateId) {
		this.evaluateId = evaluateId;
	}

	public Service(Integer serviceId, WordBook servicecategoryId, WordBook serviceStyle, String summary,
			Customer customer, String request, User createId, Date createDate, WordBook statusId, User principalId,
			Date principalDate, String dealContent, User dealId, Date dealDate, String result, WordBook evaluateId) {
		super();
		this.serviceId = serviceId;
		this.servicecategoryId = servicecategoryId;
		this.serviceStyle = serviceStyle;
		this.summary = summary;
		this.customer = customer;
		this.request = request;
		this.createId = createId;
		this.createDate = createDate;
		this.statusId = statusId;
		this.principalId = principalId;
		this.principalDate = principalDate;
		this.dealContent = dealContent;
		this.dealId = dealId;
		this.dealDate = dealDate;
		this.result = result;
		this.evaluateId = evaluateId;
	}

	public Service() {
		super();
	}

	@Override
	public String toString() {
		return "Service [serviceId=" + serviceId + ", servicecategoryId=" + servicecategoryId + ", serviceStyle="
				+ serviceStyle + ", summary=" + summary + ", customer=" + customer + ", request=" + request
				+ ", createId=" + createId + ", createDate=" + createDate + ", statusId=" + statusId + ", principalId="
				+ principalId + ", principalDate=" + principalDate + ", dealContent=" + dealContent + ", dealId="
				+ dealId + ", dealDate=" + dealDate + ", result=" + result + ", evaluateId=" + evaluateId + "]";
	}


}