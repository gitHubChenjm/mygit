package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Service;

public interface ServiceMapper {
	public List<Service> findAll();

	public List<Service> findAllWithCategory();

	public Service findById(Integer serviceId);

	public boolean insert(Service service);
	
	public int editService(Service service);

	public int addService(Service service);

	public int deleteById(Integer serviceId);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param service
	 * @return
	 */
	public List<Service> findByExample(Service service);

	/**
	 * 批量查询
	 * 
	 * @param serviceIdList
	 * @return
	 */
	public List<Service> findByServiceIdList(List<Integer> serviceIdList);

	/**
	 * 批量删除
	 * 
	 * @param serviceIdArray
	 */
	public void deleteByServiceIdList(Integer[] serviceIdArray);

	/**
	 * 批量修改
	 * 
	 * @param books
	 */
	public void editServices(List<Service> Services);

	/**
	 * 批量新增
	 * 
	 * @param books
	 */
	public void addServices(List<Service> Services);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<Service> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}