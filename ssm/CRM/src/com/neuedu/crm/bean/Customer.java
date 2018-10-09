package com.neuedu.crm.bean;

import java.util.List;

public class Customer {
	private Integer customerId;

	private String name;

	private String contacts;

	private String tel;

	private User user;

	private WordBook custcategoryId;

	private WordBook creditId;

	private WordBook satisfiedId;

	private String address;

	private String postal;

	private String fax;

	private String url;

	private String legalPerson;

	private String license;

	private Double fund;

	private Double turnover;

	private String bank;

	private String bankNumber;

	private String stateTax;

	private String landTax;

	private WordBook custfromId;

	private Integer changes;

	private List<Communicate> communicates;

	private List<Loss> losss;

	private List<Orders> orders;

	private List<Service> services;

	public Customer() {
		super();
	}

	public Customer(Integer customerId) {
		super();
		this.customerId = customerId;
	}

	public Customer(Integer customerId, String name, String contacts, String tel, User user, WordBook custcategoryId,
			WordBook creditId, WordBook satisfiedId, String address, String postal, String fax, String url,
			String legalPerson, String license, Double fund, Double turnover, String bank, String bankNumber,
			String stateTax, String landTax, WordBook custfromId, Integer changes, List<Communicate> communicates) {
		super();
		this.customerId = customerId;
		this.name = name;
		this.contacts = contacts;
		this.tel = tel;
		this.user = user;
		this.custcategoryId = custcategoryId;
		this.creditId = creditId;
		this.satisfiedId = satisfiedId;
		this.address = address;
		this.postal = postal;
		this.fax = fax;
		this.url = url;
		this.legalPerson = legalPerson;
		setLicense(license);
		setFund(fund);
		setTurnover(turnover);
		this.bank = bank;
		this.bankNumber = bankNumber;
		setStateTax(stateTax);
		setLandTax(landTax);
		this.custfromId = custfromId;
		this.changes = changes;
		this.communicates = communicates;
	}

	public Customer(Integer customerId, String name, String contacts, String tel, User user, WordBook custcategoryId,
			WordBook creditId, WordBook satisfiedId, String address, String postal, String fax, String url,
			String legalPerson, String license, Double fund, Double turnover, String bank, String bankNumber,
			String stateTax, String landTax, WordBook custfromId, Integer changes, List<Communicate> communicates,
			List<Loss> losss) {
		super();
		this.customerId = customerId;
		this.name = name;
		this.contacts = contacts;
		this.tel = tel;
		this.user = user;
		this.custcategoryId = custcategoryId;
		this.creditId = creditId;
		this.satisfiedId = satisfiedId;
		this.address = address;
		this.postal = postal;
		this.fax = fax;
		this.url = url;
		this.legalPerson = legalPerson;
		setLicense(license);
		setFund(fund);
		setTurnover(turnover);
		this.bank = bank;
		this.bankNumber = bankNumber;
		setStateTax(stateTax);
		setLandTax(landTax);
		this.custfromId = custfromId;
		this.changes = changes;
		this.communicates = communicates;
		this.losss = losss;
	}

	public Customer(Integer customerId, String name, String contacts, String tel, User user, WordBook custcategoryId,
			WordBook creditId, WordBook satisfiedId, String address, String postal, String fax, String url,
			String legalPerson, String license, Double fund, Double turnover, String bank, String bankNumber,
			String stateTax, String landTax, WordBook custfromId, Integer changes, List<Communicate> communicates,
			List<Loss> losss, List<Orders> orders) {
		super();
		this.customerId = customerId;
		this.name = name;
		this.contacts = contacts;
		this.tel = tel;
		this.user = user;
		this.custcategoryId = custcategoryId;
		this.creditId = creditId;
		this.satisfiedId = satisfiedId;
		this.address = address;
		this.postal = postal;
		this.fax = fax;
		this.url = url;
		this.legalPerson = legalPerson;
		setLicense(license);
		setFund(fund);
		setTurnover(turnover);
		this.bank = bank;
		this.bankNumber = bankNumber;
		setStateTax(stateTax);
		setLandTax(landTax);
		this.custfromId = custfromId;
		this.changes = changes;
		this.communicates = communicates;
		this.losss = losss;
		this.orders = orders;
	}

	public Customer(Integer customerId, String name, String contacts, String tel, User user, WordBook custcategoryId,
			WordBook creditId, WordBook satisfiedId, String address, String postal, String fax, String url,
			String legalPerson, String license, Double fund, Double turnover, String bank, String bankNumber,
			String stateTax, String landTax, WordBook custfromId, Integer changes, List<Communicate> communicates,
			List<Loss> losss, List<Orders> orders, List<Service> services) {
		super();
		this.customerId = customerId;
		this.name = name;
		this.contacts = contacts;
		this.tel = tel;
		this.user = user;
		this.custcategoryId = custcategoryId;
		this.creditId = creditId;
		this.satisfiedId = satisfiedId;
		this.address = address;
		this.postal = postal;
		this.fax = fax;
		this.url = url;
		this.legalPerson = legalPerson;
		setLicense(license);
		setFund(fund);
		setTurnover(turnover);
		this.bank = bank;
		this.bankNumber = bankNumber;
		setStateTax(stateTax);
		setLandTax(landTax);
		this.custfromId = custfromId;
		this.changes = changes;
		this.communicates = communicates;
		this.losss = losss;
		this.orders = orders;
		this.services = services;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public WordBook getCustcategoryId() {
		return custcategoryId;
	}

	public void setCustcategoryId(WordBook custcategoryId) {
		this.custcategoryId = custcategoryId;
	}

	public WordBook getCreditId() {
		return creditId;
	}

	public void setCreditId(WordBook creditId) {
		this.creditId = creditId;
	}

	public WordBook getSatisfiedId() {
		return satisfiedId;
	}

	public void setSatisfiedId(WordBook satisfiedId) {
		this.satisfiedId = satisfiedId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostal() {
		return postal;
	}

	public void setPostal(String postal) {
		this.postal = postal;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getLegalPerson() {
		return legalPerson;
	}

	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}

	public String getLicense() {
		if(license==null) {
			return "";
		}else {
	     	return license;
		}
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public Double getFund() {
		if(fund==null) {
			return new Double(0.0);
		}else {
	     	return fund;
		}
	}

	public void setFund(Double fund) {
		this.fund = fund;
	}

	public Double getTurnover() {
		if(turnover==null) {
			return new Double(0.0);
		}else {
	     	return turnover;
		}
	}

	public void setTurnover(Double turnover) {
		this.turnover = turnover;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBankNumber() {
		return bankNumber;
	}

	public void setBankNumber(String bankNumber) {
		this.bankNumber = bankNumber;
	}

	public String getStateTax() {
		if(stateTax==null) {
			return "";
		}else {
	     	return stateTax;
		}
	}

	public void setStateTax(String stateTax) {
		this.stateTax = stateTax;
	}

	public String getLandTax() {
		if(landTax==null) {
			return "";
		}else {
	     	return landTax;
		}
	}

	public void setLandTax(String landTax) {
		this.landTax = landTax;
	}

	public WordBook getCustfromId() {
		return custfromId;
	}

	public void setCustfromId(WordBook custfromId) {
		this.custfromId = custfromId;
	}

	public Integer getChanges() {
		return changes;
	}

	public void setChanges(Integer changes) {
		this.changes = changes;
	}

	public List<Communicate> getCommunicates() {
		return communicates;
	}

	public void setCommunicates(List<Communicate> communicates) {
		this.communicates = communicates;
	}

	public List<Loss> getLosss() {
		return losss;
	}

	public void setLosss(List<Loss> losss) {
		this.losss = losss;
	}

	public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}

	public List<Service> getServices() {
		return services;
	}

	public void setServices(List<Service> services) {
		this.services = services;
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", name=" + name + ", contacts=" + contacts + ", tel=" + tel
				+ ", user=" + user + ", custcategoryId=" + custcategoryId + ", creditId=" + creditId + ", satisfiedId="
				+ satisfiedId + ", address=" + address + ", postal=" + postal + ", fax=" + fax + ", url=" + url
				+ ", legalPerson=" + legalPerson + ", license=" + license + ", fund=" + fund + ", turnover=" + turnover
				+ ", bank=" + bank + ", bankNumber=" + bankNumber + ", stateTax=" + stateTax + ", landTax=" + landTax
				+ ", custfromId=" + custfromId + ", changes=" + changes + ", communicates=" + communicates + ", losss="
				+ losss + ", orders=" + orders + ", services=" + services + "]";
	}

}