package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Orders;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.mapper.OrdersMapper;
import com.neuedu.crm.service.IOrdersService;

@Service
@Transactional // 事务管理
public class OrderServiceImpl implements IOrdersService {

	@Autowired
	private OrdersMapper ordersMapper;

	@Override
	public List<Orders> findAll() {
		// TODO Auto-generated method stub
		return ordersMapper.findAll();
	}

	@Override
	public Orders findById(Integer orderId) {
		// TODO Auto-generated method stub
		return ordersMapper.findById(orderId);
	}

	@Override
	public int editOrder(Orders orders) {
		// TODO Auto-generated method stub
		return ordersMapper.editOrder(orders);
	}

	@Override
	public int addOrder(Orders orders) {
		// TODO Auto-generated method stub
		return ordersMapper.addOrder(orders);
	}

	@Override
	public int deleteById(Integer orderId) {
		// TODO Auto-generated method stub
		return ordersMapper.deleteById(orderId);
	}

	@Override
	public List<Orders> findByPager(Pager pager) {
		// TODO Auto-generated method stub
		return ordersMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO Auto-generated method stub
		return ordersMapper.countForPager(pager);
	}

	@Override
	public List<Orders> findByExample(Orders order) {
		// TODO Auto-generated method stub
		return ordersMapper.findByExample(order);
	}

}
