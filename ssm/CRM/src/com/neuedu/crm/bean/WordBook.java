package com.neuedu.crm.bean;

import java.util.List;


public class WordBook {
	private Integer id;

	private Integer category;

	private String title;

	private String value;

	private String editable;

	private List<Customer> custcategoryIds;

	private List<Customer> creditIds;

	private List<Customer> satisfiedIds;

	private List<Customer> custfromIds;

	private List<Service> servicecategoryIds;

	private List<Service> statusIds;

	private List<Service> evaluateIds;

	public WordBook() {
		super();
	}

	public WordBook(Integer id) {
		super();
		this.id = id;
	}

	public WordBook(Integer id, Integer category, String title, String value, String editable) {
		super();
		this.id = id;
		this.category = category;
		this.title = title;
		this.value = value;
		this.editable = editable;
	}

	public WordBook(Integer id, Integer category, String title, String value, String editable,
			List<Customer> custcategoryIds) {
		super();
		this.id = id;
		this.category = category;
		this.title = title;
		this.value = value;
		this.editable = editable;
		this.custcategoryIds = custcategoryIds;
	}

	public WordBook(Integer id, Integer category, String title, String value, String editable,
			List<Customer> custcategoryIds, List<Customer> creditIds) {
		super();
		this.id = id;
		this.category = category;
		this.title = title;
		this.value = value;
		this.editable = editable;
		this.custcategoryIds = custcategoryIds;
		this.creditIds = creditIds;
	}

	public WordBook(Integer id, Integer category, String title, String value, String editable,
			List<Customer> custcategoryIds, List<Customer> creditIds, List<Customer> satisfiedIds) {
		super();
		this.id = id;
		this.category = category;
		this.title = title;
		this.value = value;
		this.editable = editable;
		this.custcategoryIds = custcategoryIds;
		this.creditIds = creditIds;
		this.satisfiedIds = satisfiedIds;
	}

	public WordBook(Integer id, Integer category, String title, String value, String editable,
			List<Customer> custcategoryIds, List<Customer> creditIds, List<Customer> satisfiedIds,
			List<Customer> custfromIds) {
		super();
		this.id = id;
		this.category = category;
		this.title = title;
		this.value = value;
		this.editable = editable;
		this.custcategoryIds = custcategoryIds;
		this.creditIds = creditIds;
		this.satisfiedIds = satisfiedIds;
		this.custfromIds = custfromIds;
	}

	public WordBook(Integer id, Integer category, String title, String value, String editable,
			List<Customer> custcategoryIds, List<Customer> creditIds, List<Customer> satisfiedIds,
			List<Customer> custfromIds, List<Service> servicecategoryIds, List<Service> statusIds,
			List<Service> evaluateIds) {
		super();
		this.id = id;
		this.category = category;
		this.title = title;
		this.value = value;
		this.editable = editable;
		this.custcategoryIds = custcategoryIds;
		this.creditIds = creditIds;
		this.satisfiedIds = satisfiedIds;
		this.custfromIds = custfromIds;
		this.servicecategoryIds = servicecategoryIds;
		this.statusIds = statusIds;
		this.evaluateIds = evaluateIds;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getEditable() {
		return editable;
	}

	public void setEditable(String editable) {
		this.editable = editable;
	}

	public List<Customer> getCustcategoryIds() {
		return custcategoryIds;
	}

	public void setCustcategoryIds(List<Customer> custcategoryIds) {
		this.custcategoryIds = custcategoryIds;
	}

	public List<Customer> getCreditIds() {
		return creditIds;
	}

	public void setCreditIds(List<Customer> creditIds) {
		this.creditIds = creditIds;
	}

	public List<Customer> getSatisfiedIds() {
		return satisfiedIds;
	}

	public void setSatisfiedIds(List<Customer> satisfiedIds) {
		this.satisfiedIds = satisfiedIds;
	}

	public List<Customer> getCustfromIds() {
		return custfromIds;
	}

	public void setCustfromIds(List<Customer> custfromIds) {
		this.custfromIds = custfromIds;
	}

	public List<Service> getServicecategoryIds() {
		return servicecategoryIds;
	}

	public void setServicecategoryIds(List<Service> servicecategoryIds) {
		this.servicecategoryIds = servicecategoryIds;
	}

	public List<Service> getStatusIds() {
		return statusIds;
	}

	public void setStatusIds(List<Service> statusIds) {
		this.statusIds = statusIds;
	}

	public List<Service> getEvaluateIds() {
		return evaluateIds;
	}

	public void setEvaluateIds(List<Service> evaluateIds) {
		this.evaluateIds = evaluateIds;
	}

	@Override
	public String toString() {
		return "Wordbook [id=" + id + ", category=" + category + ", title=" + title + ", value=" + value + ", editable="
				+ editable + ", custcategoryIds=" + custcategoryIds + ", creditIds=" + creditIds + ", satisfiedIds="
				+ satisfiedIds + ", custfromIds=" + custfromIds + ", servicecategoryIds=" + servicecategoryIds
				+ ", statusIds=" + statusIds + ", evaluateIds=" + evaluateIds + "]";
	}

}