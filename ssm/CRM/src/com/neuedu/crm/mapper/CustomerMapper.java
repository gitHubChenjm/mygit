package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Customer;
import com.neuedu.crm.bean.Pager;

public interface CustomerMapper {
	public List<Customer> findAll();

	public Customer findById(Integer customerId);

	public int editCustomer(Customer customer);

	public int addCustomer(Customer customer);

	public int deleteById(Integer customerId);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param customer
	 * @return
	 */
	public List<Customer> findByExample(Customer customer);

	/**
	 * 批量查询
	 * 
	 * @param customerIdList
	 * @return
	 */
	public List<Customer> findByCustomerIdList(List<Integer> customerIdList);

	/**
	 * 批量删除
	 * 
	 * @param customerIdArray
	 */
	public int deleteByCustomerIdList(Integer[] customerIdArray);

	/**
	 * 批量修改
	 * 
	 * @param customers
	 */
	public void editCustomers(List<Customer> customers);

	/**
	 * 批量新增
	 * 
	 * @param customers
	 */
	public int addCustomers(List<Customer> customers);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<Customer> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
	
	public List<Customer> findPagerByExample(Pager<Customer> pager);
}