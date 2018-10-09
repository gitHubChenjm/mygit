package com.neuedu.crm.bean;

import java.util.Date;

public class Loss {
	private Integer lossId;

	private Customer customer;

	private User user;

	private Date orderdate;
	
	private Date confirmdate;

	private String measure;

	private String reason;

	private String state;
	
	private Date startCreateDate;
	
	private Date endCreateDate;

	public Loss() {
		super();
	}

	public Loss(Integer lossId, Date orderdate, Date confirmdate, String measure, String reason, String state) {
		super();
		this.lossId = lossId;
		this.orderdate = orderdate;
		this.confirmdate = confirmdate;
		setMeasure(measure);
		setReason(reason);
		setState(state);
	}

	public Loss(Integer lossId, Customer customer, User user, Date orderdate, Date confirmdate, String measure,
			String reason, String state) {
		super();
		this.lossId = lossId;
		this.customer = customer;
		this.user = user;
		this.orderdate = orderdate;
		this.confirmdate = confirmdate;
		setMeasure(measure);
		setReason(reason);
		setState(state);
	}

	public Loss(Integer lossId, Customer customer, User user, Date orderdate, Date confirmdate, String measure,
			String reason, String state, Date startCreateDate, Date endCreateDate) {
		super();
		this.lossId = lossId;
		this.customer = customer;
		this.user = user;
		this.orderdate = orderdate;
		this.confirmdate = confirmdate;
		setMeasure(measure);
		setReason(reason);
		setState(state);
		this.startCreateDate = startCreateDate;
		this.endCreateDate = endCreateDate;
	}

	public Integer getLossId() {
		return lossId;
	}

	public void setLossId(Integer lossId) {
		this.lossId = lossId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public Date getConfirmdate() {
		return confirmdate;
	}

	public void setConfirmdate(Date confirmdate) {
		this.confirmdate = confirmdate;
	}

	public String getMeasure() {
		if(measure==null) {
			return "";
		}else {
	     	return measure;
		}
	}

	public void setMeasure(String measure) {
		this.measure = measure;
	}

	public String getReason() {
		if(reason==null) {
			return "";
		}else {
	     	return reason;
		}
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getState() {
		if(state==null) {
			return "";
		}else {
	     	return state;
		}
	}

	public void setState(String state) {
		this.state = state;
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
		return "Loss [lossId=" + lossId + ", customer=" + customer + ", user=" + user + ", orderdate=" + orderdate
				+ ", confirmdate=" + confirmdate + ", measure=" + measure + ", reason=" + reason + ", state=" + state
				+ ", startCreateDate=" + startCreateDate + ", endCreateDate=" + endCreateDate + "]";
	}

}