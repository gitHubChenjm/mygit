package com.neuedu.crm.bean;

import java.util.Date;

public class Communicate {
	private Integer communicateId;

	private Customer customer;

	private Date dates;

	private String address;

	private String general;

	private String remark;

	private String detail;

	private String file;
	
	private Date startCreateDate;
	
	private Date endCreateDate;
	
	public Communicate() {
		super();
	}

	public Communicate(Integer communicateId, Date dates, String address, String general, String remark, String detail,
			String file) {
		super();
		this.communicateId = communicateId;
		this.dates = dates;
		this.address = address;
		this.general = general;
		setRemark(remark);
		setDetail(detail);
		setFile(file);
	}

	public Communicate(Integer communicateId, Customer customer, Date dates, String address, String general,
			String remark, String detail, String file) {
		super();
		this.communicateId = communicateId;
		this.customer = customer;
		this.dates = dates;
		this.address = address;
		this.general = general;
		setRemark(remark);
		setDetail(detail);
		setFile(file);
	}

	public Communicate(Integer communicateId, Customer customer, Date dates, String address, String general,
			String remark, String detail, String file, Date startCreateDate, Date endCreateDate) {
		super();
		this.communicateId = communicateId;
		this.customer = customer;
		this.dates = dates;
		this.address = address;
		this.general = general;
		this.remark = remark;
		this.detail = detail;
		this.file = file;
		this.startCreateDate = startCreateDate;
		this.endCreateDate = endCreateDate;
	}

	public Integer getCommunicateId() {
		return communicateId;
	}

	public void setCommunicateId(Integer communicateId) {
		this.communicateId = communicateId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getDates() {
		return dates;
	}

	public void setDates(Date dates) {
		this.dates = dates;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGeneral() {
		return general;
	}

	public void setGeneral(String general) {
		this.general = general;
	}

	public String getRemark() {
		if(remark==null) {
			return "";
		}else {
	     	return remark;
		}
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getDetail() {
		if(detail==null) {
			return "";
		}else {
	     	return detail;
		}
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getFile() {
		if(file==null) {
			return "";
		}else {
	     	return file;
		}
	}

	public void setFile(String file) {
		this.file = file;
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

	@Override
	public String toString() {
		return "Communicate [communicateId=" + communicateId + ", customer=" + customer + ", dates=" + dates
				+ ", address=" + address + ", general=" + general + ", remark=" + remark + ", detail=" + detail
				+ ", file=" + file + "]";
	}

}