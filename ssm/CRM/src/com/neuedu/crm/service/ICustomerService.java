package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Customer;
import com.neuedu.crm.bean.Pager;

public interface ICustomerService {
	public List<Customer> findAll();

	public Customer findById(Integer customerId);

	public int editCustomer(Customer customer);

	public int addCustomer(Customer customer);

	public int addCustomers(List<Customer> customers);

	public int deleteById(Integer customerId);
	
	public int deleteByCustomerIdList(Integer[] customerIdArray);

	public List<Customer> findByExample(Customer customer);

	public List<Customer> findByPager(Pager pager);

	public int countForPager(Pager pager);
	
	public List<Customer> findPagerByExample(Pager<Customer> pager);
}
