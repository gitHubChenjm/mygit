package com.neuedu.crm.bean;

import java.util.Date;
import java.util.List;

public class Sale {
	private Integer saleId;

	private String customerName;

	private String summary;

	private String source;

	private Double probability;

	private String contacts;

	private String tel;

	private String description;

	private User createId;

	private Date createDate;

	private Integer status;
	
	private User dealId;

	private Date assignDate;

	private Integer state;

	private List<Develop> develops;

	public Sale() {
		super();
	}

	public Sale(Integer saleId, String customerName, String summary, String source, Double probability, String contacts,
			String tel, String description, User createId, Date createDate, Integer status, User dealId,
			Date assignDate, Integer state) {
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
	}

	public Sale(Integer saleId, String customerName, String summary, String source, Double probability, String contacts,
			String tel, String description, User createId, Date createDate, Integer status, User dealId,
			Date assignDate, Integer state, List<Develop> develops) {
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
		this.develops = develops;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public User getDealId() {
		return dealId;
	}

	public void setDealId(User dealId) {
		this.dealId = dealId;
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

	@Override
	public String toString() {
		return "Sale [saleId=" + saleId + ", customerName=" + customerName + ", summary=" + summary + ", source="
				+ source + ", probability=" + probability + ", contacts=" + contacts + ", tel=" + tel + ", description="
				+ description + ", createId=" + createId + ", createDate=" + createDate + ", status=" + status
				+ ", dealId=" + dealId + ", assignDate=" + assignDate + ", state=" + state + ", develops=" + develops
				+ "]";
	}

}