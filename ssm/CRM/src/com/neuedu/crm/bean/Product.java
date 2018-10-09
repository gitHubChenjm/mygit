package com.neuedu.crm.bean;

import java.util.List;

public class Product {
	private Integer productId;  //产品编号

	private String name;  //产品名字

	private String type;  //产品型号

	private String grade; //等级、批次

	private String unit;  //单位

	private Double price; //单价

	private String remark; //备注

	private List<Orderitem> orderitems;

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", name=" + name + ", type=" + type + ", grade=" + grade + ", unit="
				+ unit + ", price=" + price + ", remark=" + remark + ", orderitems=" + orderitems + "]";
	}

	public Product() {
		super();
	}

	public Product(Integer productId, String name, String type, String grade, String unit, Double price,
			String remark) {
		super();
		this.productId = productId;
		this.name = name;
		this.type = type;
		this.grade = grade;
		this.unit = unit;
		this.price = price;
		this.remark = remark;
	}

	public Product(Integer productId, String name, String type, String grade, String unit, Double price, String remark,
			List<Orderitem> orderitems) {
		super();
		this.productId = productId;
		this.name = name;
		this.type = type;
		this.grade = grade;
		this.unit = unit;
		this.price = price;
		this.remark = remark;
		this.orderitems = orderitems;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<Orderitem> getOrderitems() {
		return orderitems;
	}

	public void setOrderitems(List<Orderitem> orderitems) {
		this.orderitems = orderitems;
	}

}