package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Orderitem;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.mapper.OrderitemMapper;
import com.neuedu.crm.service.IOrderitemService;

@Service
@Transactional // 事务管理
public class OrderitemServiceImpl implements IOrderitemService {

	@Autowired
	private OrderitemMapper orderitemMapper;

	@Override
	public List<Orderitem> findAll() {
		// TODO Auto-generated method stub
		return orderitemMapper.findAll();
	}

	@Override
	public Orderitem findById(Integer orderitemId) {
		// TODO Auto-generated method stub
		return orderitemMapper.findById(orderitemId);
	}

	@Override
	public int editOrderitem(Orderitem orderitem) {
		// TODO Auto-generated method stub
		return orderitemMapper.editOrderitem(orderitem);
	}

	@Override
	public int addOrderitem(Orderitem orderitem) {
		// TODO Auto-generated method stub
		return orderitemMapper.addOrderitem(orderitem);
	}

	@Override
	public int deleteById(Integer orderitemId) {
		// TODO Auto-generated method stub
		return orderitemMapper.deleteById(orderitemId);
	}

	@Override
	public List<Orderitem> findByPager(Pager pager) {
		// TODO Auto-generated method stub
		return orderitemMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO Auto-generated method stub
		return orderitemMapper.countForPager(pager);
	}

	@Override
	public List<Orderitem> findByExample(Orderitem orderitems) {
		// TODO Auto-generated method stub
		return orderitemMapper.findByExample(orderitems);
	}

	@Override
	public List<Orderitem> findByOrderId(Integer orderId) {
		// TODO Auto-generated method stub
		return orderitemMapper.findByOrderId(orderId);
	}

}
