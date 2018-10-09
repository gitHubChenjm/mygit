package com.neuedu.crm.bean;

import java.io.Serializable;
import java.util.List;

public class User implements Serializable{
	private Integer id;
	
	private String account;
	
	private String tel;

	private String head;

	private String password;

	private List<Customer> customers;

	private List<Loss> losss;

	private List<Sale> createIds;

	private List<Sale> dealIds;

	private List<Service> screateIds;

	private List<Service> principalIds;

	private List<Service> sdealIds;

	private List<UserRole> userroles;

	public User() {
		super();
	}

	public User(Integer id) {
		super();
		this.id = id;
	}

	public User(String account, String password) {
		super();
		this.account = account;
		this.password = password;
	}

	public User(Integer id, String account, String tel, String head, String password) {
		super();
		this.id = id;
		this.account = account;
		this.tel = tel;
		this.head = head;
		this.password = password;
	}

	public User(Integer id, String account, String tel, String head, String password, List<Customer> customers) {
		super();
		this.id = id;
		this.account = account;
		this.tel = tel;
		this.head = head;
		this.password = password;
		this.customers = customers;
	}

	public User(Integer id, String account, String tel, String head, String password, List<Customer> customers,
			List<Loss> losss) {
		super();
		this.id = id;
		this.account = account;
		this.tel = tel;
		this.head = head;
		this.password = password;
		this.customers = customers;
		this.losss = losss;
	}

	public User(Integer id, String account, String tel, String head, String password, List<Customer> customers,
			List<Loss> losss, List<Sale> createIds) {
		super();
		this.id = id;
		this.account = account;
		this.tel = tel;
		this.head = head;
		this.password = password;
		this.customers = customers;
		this.losss = losss;
		this.createIds = createIds;
	}

	public User(Integer id, String account, String tel, String head, String password, List<Customer> customers,
			List<Loss> losss, List<Sale> createIds, List<Sale> dealIds) {
		super();
		this.id = id;
		this.account = account;
		this.tel = tel;
		this.head = head;
		this.password = password;
		this.customers = customers;
		this.losss = losss;
		this.createIds = createIds;
		this.dealIds = dealIds;
	}

	public User(Integer id, String account, String tel, String head, String password, List<Customer> customers,
			List<Loss> losss, List<Sale> createIds, List<Sale> dealIds, List<Service> screateIds,
			List<Service> principalIds, List<Service> sdealIds) {
		super();
		this.id = id;
		this.account = account;
		this.tel = tel;
		this.head = head;
		this.password = password;
		this.customers = customers;
		this.losss = losss;
		this.createIds = createIds;
		this.dealIds = dealIds;
		this.screateIds = screateIds;
		this.principalIds = principalIds;
		this.sdealIds = sdealIds;
	}

	public User(Integer id, String account, String tel, String head, String password, List<Customer> customers,
			List<Loss> losss, List<Sale> createIds, List<Sale> dealIds, List<Service> screateIds,
			List<Service> principalIds, List<Service> sdealIds, List<UserRole> userroles) {
		super();
		this.id = id;
		this.account = account;
		this.tel = tel;
		this.head = head;
		this.password = password;
		this.customers = customers;
		this.losss = losss;
		this.createIds = createIds;
		this.dealIds = dealIds;
		this.screateIds = screateIds;
		this.principalIds = principalIds;
		this.sdealIds = sdealIds;
		this.userroles = userroles;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public List<Loss> getLosss() {
		return losss;
	}

	public void setLosss(List<Loss> losss) {
		this.losss = losss;
	}

	public List<Sale> getCreateIds() {
		return createIds;
	}

	public void setCreateIds(List<Sale> createIds) {
		this.createIds = createIds;
	}

	public List<Sale> getDealIds() {
		return dealIds;
	}

	public void setDealIds(List<Sale> dealIds) {
		this.dealIds = dealIds;
	}

	public List<Service> getScreateIds() {
		return screateIds;
	}

	public void setScreateIds(List<Service> screateIds) {
		this.screateIds = screateIds;
	}

	public List<Service> getPrincipalIds() {
		return principalIds;
	}

	public void setPrincipalIds(List<Service> principalIds) {
		this.principalIds = principalIds;
	}

	public List<Service> getSdealIds() {
		return sdealIds;
	}

	public void setSdealIds(List<Service> sdealIds) {
		this.sdealIds = sdealIds;
	}

	public List<UserRole> getUserroles() {
		return userroles;
	}

	public void setUserroles(List<UserRole> userroles) {
		this.userroles = userroles;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", account=" + account + ", tel=" + tel + ", head=" + head + ", password=" + password
				+ ", customers=" + customers + ", losss=" + losss + ", createIds=" + createIds + ", dealIds=" + dealIds
				+ ", screateIds=" + screateIds + ", principalIds=" + principalIds + ", sdealIds=" + sdealIds
				+ ", userroles=" + userroles + "]";
	}

}