package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Orders;
import com.neuedu.crm.bean.Pager;

public interface OrdersMapper {
	public List<Orders> findAll();

	public Orders findById(Integer orderId);

	public int editOrder(Orders orders);

	public int addOrder(Orders orders);

	public int deleteById(Integer orderId);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param order
	 * @return
	 */
	public List<Orders> findByExample(Orders order);

	/**
	 * 批量查询
	 * 
	 * @param orderIdList
	 * @return
	 */
	public List<Orders> findByOrderIdList(List<Integer> orderIdList);

	/**
	 * 批量删除
	 * 
	 * @param orderIdArray
	 */
	public void deleteByOrderIdList(Integer[] orderIdArray);

	/**
	 * 批量修改
	 * 
	 * @param orders
	 */
	public void editOrders(List<Orders> orders);

	/**
	 * 批量新增
	 * 
	 * @param orders
	 */
	public void addOrders(List<Orders> orders);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<Orders> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}