package com.neuedu.crm.bean;

import java.util.Date;

public class CustAverage {
	private Integer customerId;
	private String CusName;
	private Integer OrderId;
	private Integer OrderItemId;
	private Integer count;
	private Integer total;
	private Date startDate;
	private Date endDate;
	private String name;//产品名字
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public String getCusName() {
		return CusName;
	}
	public void setCusName(String cusName) {
		CusName = cusName;
	}
	public Integer getOrderId() {
		return OrderId;
	}
	public void setOrderId(Integer orderId) {
		OrderId = orderId;
	}
	public Integer getOrderItemId() {
		return OrderItemId;
	}
	public void setOrderItemId(Integer orderItemId) {
		OrderItemId = orderItemId;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}


	public CustAverage(Integer customerId, String cusName, Integer orderId, Integer orderItemId, Integer count,
			Integer total, Date startDate, Date endDate) {
		super();
		this.customerId = customerId;
		CusName = cusName;
		OrderId = orderId;
		OrderItemId = orderItemId;
		this.count = count;
		this.total = total;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public CustAverage() {
		super();
	}
	@Override
	public String toString() {
		return "CustAverage [customerId=" + customerId + ", CusName=" + CusName + ", OrderId=" + OrderId
				+ ", OrderItemId=" + OrderItemId + ", count=" + count + ", total=" + total + ", startDate=" + startDate
				+ ", endDate=" + endDate + "]";
	}
	
}
