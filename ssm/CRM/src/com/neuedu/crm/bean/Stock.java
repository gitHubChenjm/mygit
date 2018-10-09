package com.neuedu.crm.bean;

public class Stock {
	private Integer stockId;

	private String depository;

	private String stockPosition;

	private Integer count;

	private String remark;

	@Override
	public String toString() {
		return "Stock [stockId=" + stockId + ", depository=" + depository + ", stockPosition=" + stockPosition
				+ ", count=" + count + ", remark=" + remark + "]";
	}

	public Stock() {
		super();
	}

	public Stock(Integer stockId, String depository, String stockPosition, Integer count, String remark) {
		super();
		this.stockId = stockId;
		this.depository = depository;
		this.stockPosition = stockPosition;
		this.count = count;
		this.remark = remark;
	}

	public Integer getStockId() {
		return stockId;
	}

	public void setStockId(Integer stockId) {
		this.stockId = stockId;
	}

	public String getDepository() {
		return depository;
	}

	public void setDepository(String depository) {
		this.depository = depository;
	}

	public String getStockPosition() {
		return stockPosition;
	}

	public void setStockPosition(String stockPosition) {
		this.stockPosition = stockPosition;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}