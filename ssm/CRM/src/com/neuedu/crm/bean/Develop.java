package com.neuedu.crm.bean;

import java.util.Date;

public class Develop {
	private Integer developId;

	private Sale sale;

	private Date startDate;

	private Date endDate;

	private String content;

	private String result;

	public Develop() {
		super();
	}

	public Develop(Integer developId, Date startDate, Date endDate, String content, String result) {
		super();
		this.developId = developId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.content = content;
		this.result = result;
	}

	public Develop(Integer developId, Sale sale, Date startDate, Date endDate, String content, String result) {
		super();
		this.developId = developId;
		this.sale = sale;
		this.startDate = startDate;
		this.endDate = endDate;
		this.content = content;
		this.result = result;
	}

	public Integer getDevelopId() {
		return developId;
	}

	public void setDevelopId(Integer developId) {
		this.developId = developId;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "Develop [developId=" + developId + ", sale=" + sale + ", startDate=" + startDate + ", endDate="
				+ endDate + ", content=" + content + ", result=" + result + "]";
	}

}