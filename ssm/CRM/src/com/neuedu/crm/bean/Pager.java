package com.neuedu.crm.bean;

import java.util.List;

/**
 * 使用泛型编程，实现带条件的分页查询
 * 
 * @author WYY
 *
 * @param <T>
 */
public class Pager<T> {

	private int currentPage = 1;// 第几页 - 默认值是第1页，不能小于1
	private int pageSize = 10;// 每页查几条 - 默认值是10条，不能小于1
	private int total;// 要分页数据的记录总数,如果没有数据则为0
	private T param;//使用泛型传递查询条件
	private List<T> results;//使用泛型接收查询接口
	private int prePage;
	private int nextPages;
	
	//排序使用
	private String sort;
	
	public Pager(int currentPage, int pageSize, int total, T param, List<T> results, int prePage, int nextPages,
			String sort) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.total = total;
		this.param = param;
		this.results = results;
		this.prePage = prePage;
		this.nextPages = nextPages;
		this.sort = sort;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public Pager() {
		super();
	}

	public Pager(int currentPage, int pageSize) {
		super();
		setCurrentPage(currentPage);
		setPageSize(pageSize);
	}
	
	public Pager(int total) {
		setTotal(total);
	}

	public int getTotal() {
		return total;
	}
	// 分页的总记录数
	public void setTotal(int total) {
		if (total >= 0) {
			this.total = total;
		}
	}

	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		if (currentPage > 1) {
			this.currentPage = currentPage;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if (pageSize > 1) {
			this.pageSize = pageSize;
		}
	}

	/**
	 * 开始查询的索引，即从第几条开始查
	 * 
	 * @return
	 */
	public int getStartIndex() {
		return (currentPage - 1) * pageSize;
	}
	
	/**
	 * 计算总页数
	 * 
	 * @return
	 */
	public int getPages() {
		//可以分成整页的取商；不能分成整页则需要  商+1  页
		int pages = total%pageSize==0?total/pageSize:total/pageSize+1;
		return pages;
	}
	
	public int getPrePage() {//上一页
		//当前页是第一页不能前翻，否则翻一页
		int prePage = currentPage==1?1:currentPage-1;
		return prePage;
	}
	
	public int getNextPages() {//下一页
		//当前页是最后一页不能后翻，否则翻一页
		int nextPage = currentPage==getPages()?getPages():currentPage+1;
		return nextPage;
	}

	public T getParam() {
		return param;
	}

	public void setParam(T param) {
		this.param = param;
	}

	public List<T> getResults() {
		return results;
	}

	public void setResults(List<T> results) {
		this.results = results;
	}
	

}
