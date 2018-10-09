package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Orderitem;
import com.neuedu.crm.bean.Pager;

public interface IOrderitemService {
	public List<Orderitem> findAll();
	
	public Orderitem findById(Integer orderitemId);
	
	public List<Orderitem>findByOrderId(Integer orderId);

	public int editOrderitem(Orderitem orderitem);

	public int addOrderitem(Orderitem orderitem);

	public int deleteById(Integer orderitemId);
	
	public List<Orderitem> findByExample(Orderitem orderitems);
	
	public List<Orderitem> findByPager(Pager pager);
	
	public int countForPager(Pager pager);
}
