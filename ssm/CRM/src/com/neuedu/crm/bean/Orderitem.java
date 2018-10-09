package com.neuedu.crm.bean;

public class Orderitem {
	private Integer orderitemId;

	private Orders order;

	private Product product;//产品编号

	private Integer count;

	private Double total;

	@Override
	public String toString() {
		return "Orderitem [orderitemId=" + orderitemId + ", order=" + order + ", product=" + product + ", count="
				+ count + ", total=" + total + "]";
	}

	public Orderitem() {
		super();
	}

	public Orderitem(Integer orderitemId, Orders order, Product product, Integer count, Double total) {
		super();
		this.orderitemId = orderitemId;
		this.order = order;
		this.product = product;
		this.count = count;
		this.total = total;
	}

	public Integer getOrderitemId() {
		return orderitemId;
	}

	public void setOrderitemId(Integer orderitemId) {
		this.orderitemId = orderitemId;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}
}