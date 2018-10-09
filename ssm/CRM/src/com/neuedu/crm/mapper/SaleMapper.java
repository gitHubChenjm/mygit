package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Sale;

public interface SaleMapper {

	public List<Sale> findAll();

	public Sale findById(Integer saleId);

	public int editSale(Sale sale);

	public int addSale(Sale sale);

	public int deleteById(Integer saleId);
	
	public int updateStatus(Sale sale);
	
	/**
	 * 更改负责人
	 * @return
	 */
	public int updateDealUser(Sale sale);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param sale
	 * @return
	 */
	public List<Sale> findByExample(Sale sale);

	/**
	 * 批量查询
	 * 
	 * @param saleIdList
	 * @return
	 */
	public List<Sale> findBySaleIdList(List<Integer> saleIdList);

	/**
	 * 批量删除
	 * 
	 * @param saleIdArray
	 */
	public int deleteByIdList(int[] IdList);

	/**
	 * 批量修改
	 * 
	 * @param sales
	 */
	public void editSales(List<Sale> sales);

	/**
	 * 批量新增
	 * 
	 * @param sales
	 */
	public void addSales(List<Sale> sales);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<Sale> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}