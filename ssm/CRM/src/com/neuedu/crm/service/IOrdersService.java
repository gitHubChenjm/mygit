package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Orders;
import com.neuedu.crm.bean.Pager;

public interface IOrdersService {
	public List<Orders> findAll();

	public Orders findById(Integer orderId);

	public int editOrder(Orders orders);

	public int addOrder(Orders orders);

	public int deleteById(Integer orderId);
	
	public List<Orders> findByExample(Orders order);
	
	public List<Orders> findByPager(Pager pager);
	
	public int countForPager(Pager pager);
}
