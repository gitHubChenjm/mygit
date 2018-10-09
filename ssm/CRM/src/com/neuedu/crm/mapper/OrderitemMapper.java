package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Orderitem;
import com.neuedu.crm.bean.Pager;

public interface OrderitemMapper {
	public List<Orderitem> findAll();

	public Orderitem findById(Integer orderitemId);
	
	public List<Orderitem> findByOrderId(Integer orderId);

	public int editOrderitem(Orderitem orderitem);

	public int addOrderitem(Orderitem orderitem);

	public int deleteById(Integer orderitemId);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param orderitems
	 * @return
	 */
	public List<Orderitem> findByExample(Orderitem orderitems);

	/**
	 * 批量查询
	 * 
	 * @param orderitemIdList
	 * @return
	 */
	public List<Orderitem> findByOrderitemIdList(List<Integer> orderitemIdList);

	/**
	 * 批量删除
	 * 
	 * @param orderitemIdArray
	 */
	public void deleteByOrderitemIdList(Integer[] orderitemIdArray);

	/**
	 * 批量修改
	 * 
	 * @param orderitems
	 */
	public void editOrderitems(List<Orderitem> orderitems);

	/**
	 * 批量新增
	 * 
	 * @param orderitems
	 */
	public void addOrderitems(List<Orderitem> orderitems);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<Orderitem> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}