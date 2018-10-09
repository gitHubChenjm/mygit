package com.neuedu.crm.bean;

public class Contacts {
	private Integer contactsId;

	private Customer customer;//客户编号

	private String name;

	private String gender;

	private String job;

	private String jobTel;

	private String calls;

	private String phone;

	private String remark;

	public Contacts() {
		super();
	}

	public Contacts(Integer contactsId, Customer customer, String name, String gender, String job, String jobTel,
			String calls, String phone, String remark) {
		super();
		this.contactsId = contactsId;
		this.customer = customer;
		this.name = name;
		this.gender = gender;
		this.job = job;
		this.jobTel = jobTel;
		setcalls(calls);
		this.phone = phone;
		setRemark(remark);
	}

	public Contacts(Integer contactsId, String name, String gender, String job, String jobTel, String calls, String phone,
			String remark) {
		super();
		this.contactsId = contactsId;
		this.name = name;
		this.gender = gender;
		this.job = job;
		this.jobTel = jobTel;
		setcalls(calls);
		this.phone = phone;
		setRemark(remark);
	}

	public Integer getContactsId() {
		return contactsId;
	}

	public void setContactsId(Integer contactsId) {
		this.contactsId = contactsId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getJobTel() {
		return jobTel;
	}

	public void setJobTel(String jobTel) {
		this.jobTel = jobTel;
	}

	public String getcalls() {
		if(calls==null) {
			return "";
		}else {
	     	return calls;
		}
	}

	public void setcalls(String calls) {
		this.calls = calls;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	@Override
	public String toString() {
		return "Contacts [contactsId=" + contactsId + ", customer=" + customer + ", name=" + name + ", gender=" + gender
				+ ", job=" + job + ", jobTel=" + jobTel + ", calls=" + calls + ", phone=" + phone + ", remark=" + remark
				+ "]";
	}

}