package com.neuedu.crm.bean;

import java.util.Date;

import java.util.List;

public class SaleVo {
	
	private Integer saleId;

	private String customerName;

	private String summary;

	private String source;

	private Double probability;

	private String contacts;

	private String tel;

	private String description;

	private Integer createId;

	private Date createDate;

	private Integer status;
	
	private Integer dealId;

	private Date assignDate;

	private Integer state;
	
	private String createMan;
	
	private String dealMan;
	
	private Date earlyDate;
	
	private Date lateDate;

	private List<Develop> develops;

	public SaleVo() {
		super();
	}

	public SaleVo(Integer saleId, String customerName, String summary, String source, Double probability,
			String contacts, String tel, String description, Integer createId, Date createDate, Integer status,
			Integer dealId, Date assignDate, Integer state, String createMan, String dealMan, Date earlyDate,
			Date lateDate) {
		super();
		this.saleId = saleId;
		this.customerName = customerName;
		this.summary = summary;
		this.source = source;
		this.probability = probability;
		this.contacts = contacts;
		this.tel = tel;
		this.description = description;
		this.createId = createId;
		this.createDate = createDate;
		this.status = status;
		this.dealId = dealId;
		this.assignDate = assignDate;
		this.state = state;
		this.createMan = createMan;
		this.dealMan = dealMan;
		this.earlyDate = earlyDate;
		this.lateDate = lateDate;
	}

	public String getCreateMan() {
		return createMan;
	}

	public void setCreateMan(String createMan) {
		this.createMan = createMan;
	}

	public String getDealMan() {
		return dealMan;
	}

	public void setDealMan(String dealMan) {
		this.dealMan = dealMan;
	}

	public Integer getSaleId() {
		return saleId;
	}

	public void setSaleId(Integer saleId) {
		this.saleId = saleId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Double getProbability() {
		return probability;
	}

	public void setProbability(Double probability) {
		this.probability = probability;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(Date assignDate) {
		this.assignDate = assignDate;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public List<Develop> getDevelops() {
		return develops;
	}

	public void setDevelops(List<Develop> develops) {
		this.develops = develops;
	}

	public Integer getCreateId() {
		return createId;
	}

	public void setCreateId(Integer createId) {
		this.createId = createId;
	}

	public Integer getDealId() {
		return dealId;
	}

	public void setDealId(Integer dealId) {
		this.dealId = dealId;
	}
	
	public Date getEarlyDate() {
		return earlyDate;
	}

	public void setEarlyDate(Date earlyDate) {
		this.earlyDate = earlyDate;
	}

	public Date getLateDate() {
		return lateDate;
	}

	public void setLateDate(Date lateDate) {
		this.lateDate = lateDate;
	}

	@Override
	public String toString() {
		return "SaleVo [saleId=" + saleId + ", customerName=" + customerName + ", summary=" + summary + ", source="
				+ source + ", probability=" + probability + ", contacts=" + contacts + ", tel=" + tel + ", description="
				+ description + ", createId=" + createId + ", createDate=" + createDate + ", status=" + status
				+ ", dealId=" + dealId + ", assignDate=" + assignDate + ", state=" + state + ", createMan=" + createMan
				+ ", dealMan=" + dealMan + ", earlyDate=" + earlyDate + ", lateDate=" + lateDate + ", develops="
				+ develops + "]";
	}


}