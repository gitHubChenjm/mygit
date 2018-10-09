package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Stock;

public interface IStockService {
	public List<Stock> findAll();

	public Stock findById(Integer stockId);

	public int editStock(Stock stock);

	public int addStock(Stock stock);

	public int deleteById(Integer stockId);
	
	public List<Stock> findByExample(Stock Stock);
	
	public List<Stock> findByPager(Pager pager);
	
	public int countForPager(Pager pager);
}
