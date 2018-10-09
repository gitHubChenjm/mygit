package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Customer;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.mapper.CustomerMapper;
import com.neuedu.crm.service.ICustomerService;

@Service
@Transactional // 事务管理
public class CustomerServiceImpl implements ICustomerService {

	@Autowired
	private CustomerMapper customerMapper;

	@Override
	public List<Customer> findAll() {
		// TODO 自动生成的方法存根
		return customerMapper.findAll();
	}

	@Override
	public Customer findById(Integer customerId) {
		// TODO 自动生成的方法存根
		return customerMapper.findById(customerId);
	}

	@Override
	public int editCustomer(Customer customer) {
		// TODO 自动生成的方法存根
		return customerMapper.editCustomer(customer);
	}

	@Override
	public int addCustomer(Customer customer) {
		// TODO 自动生成的方法存根
		return customerMapper.addCustomer(customer);
	}

	@Override
	public int deleteById(Integer customerId) {
		// TODO 自动生成的方法存根
		return customerMapper.deleteById(customerId);
	}

	@Override
	public List<Customer> findByExample(Customer customer) {
		// TODO 自动生成的方法存根
		return customerMapper.findByExample(customer);
	}

	@Override
	public List<Customer> findByPager(Pager pager) {
		// TODO 自动生成的方法存根
		return customerMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO 自动生成的方法存根
		return customerMapper.countForPager(pager);
	}

	@Override
	public List<Customer> findPagerByExample(Pager<Customer> pager) {
		// TODO 自动生成的方法存根
		return customerMapper.findPagerByExample(pager);
	}

	@Override
	public int deleteByCustomerIdList(Integer[] customerIdArray) {
		// TODO Auto-generated method stub
		return customerMapper.deleteByCustomerIdList(customerIdArray);
	}

	@Override
	public int addCustomers(List<Customer> customers) {
		// TODO Auto-generated method stub
		return customerMapper.addCustomers(customers);
	}

}
