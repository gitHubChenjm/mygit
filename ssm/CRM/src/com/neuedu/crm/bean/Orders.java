package com.neuedu.crm.bean;

import java.util.Date;
import java.util.List;
//orders
public class Orders {
	private Integer orderId;

	private Customer customer;

	private String address;

	private Date date;

	private String state;
	
	private Date startCreateDate;
	
	private Date endCreateDate;

	private List<Orderitem> orderitems;

	public Orders() {
		super();
	}

	public Orders(Integer orderId, String address, Date date, String state) {
		super();
		this.orderId = orderId;
		this.address = address;
		this.date = date;
		this.state = state;
	}

	public Orders(Integer orderId, Customer customer, String address, Date date, String state) {
		super();
		this.orderId = orderId;
		this.customer = customer;
		this.address = address;
		this.date = date;
		this.state = state;
	}

	public Orders(Integer orderId, Customer customer, String address, Date date, String state,
			List<Orderitem> orderitems) {
		super();
		this.orderId = orderId;
		this.customer = customer;
		this.address = address;
		this.date = date;
		this.state = state;
		this.orderitems = orderitems;
	}

	public Orders(Integer orderId, Customer customer, String address, Date date, String state, Date startCreateDate,
			Date endCreateDate, List<Orderitem> orderitems) {
		super();
		this.orderId = orderId;
		this.customer = customer;
		this.address = address;
		this.date = date;
		this.state = state;
		this.startCreateDate = startCreateDate;
		this.endCreateDate = endCreateDate;
		this.orderitems = orderitems;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public List<Orderitem> getOrderitems() {
		return orderitems;
	}

	public void setOrderitems(List<Orderitem> orderitems) {
		this.orderitems = orderitems;
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
		return "Orders [orderId=" + orderId + ", customer=" + customer + ", address=" + address + ", date=" + date
				+ ", state=" + state + ", startCreateDate=" + startCreateDate + ", endCreateDate=" + endCreateDate
				+ ", orderitems=" + orderitems + "]";
	}

}