package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Stock;

public interface StockMapper {
	public List<Stock> findAll();

	public Stock findById(Integer stockId);

	public int editStock(Stock stock);

	public int addStock(Stock stock);

	public int deleteById(Integer stockId);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param book
	 * @return
	 */
	public List<Stock> findByExample(Stock Stock);

	/**
	 * 批量查询
	 * 
	 * @param stockIdList
	 * @return
	 */
	public List<Stock> findByStockIdList(List<Integer> stockIdList);

	/**
	 * 批量删除
	 * 
	 * @param stockIdArray
	 */
	public void deleteByStockIdList(Integer[] stockIdArray);

	/**
	 * 批量修改
	 * 
	 * @param stocks
	 */
	public void editStocks(List<Stock> stocks);

	/**
	 * 批量新增
	 * 
	 * @param stocks
	 */
	public void addStocks(List<Stock> stocks);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<Stock> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}