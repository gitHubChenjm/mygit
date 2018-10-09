package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Product;

public interface ProductMapper {
	public List<Product> findAll();

	public Product findById(Integer productId);

	public int editProduct(Product product);

	public int addProduct(Product product);

	public int deleteById(Integer productId);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param product
	 * @return
	 */
	public List<Product> findByExample(Product product);

	/**
	 * 批量查询
	 * 
	 * @param productIdList
	 * @return
	 */
	public List<Product> findByProductIdList(List<Integer> productIdList);

	/**
	 * 批量删除
	 * 
	 * @param productIdArray
	 */
	public void deleteByProductIdList(Integer[] productIdArray);

	/**
	 * 批量修改
	 * 
	 * @param products
	 */
	public void editProducts(List<Product> products);

	/**
	 * 批量新增
	 * 
	 * @param products
	 */
	public void addProducts(List<Product> products);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<Product> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}