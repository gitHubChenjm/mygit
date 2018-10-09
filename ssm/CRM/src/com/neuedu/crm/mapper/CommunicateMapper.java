package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Communicate;
import com.neuedu.crm.bean.Pager;

public interface CommunicateMapper {
	public List<Communicate> findAll();

	public Communicate findById(Integer communicateId);
	
	public Communicate findByCustomerId(Integer customerId);

	public int editCommunicate(Communicate communicate);

	public int addCommunicate(Communicate communicate);

	public int deleteById(Integer communicateId);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param communicate
	 * @return
	 */
	public List<Communicate> findByExample(Communicate communicate);

	/**
	 * 批量查询
	 * 
	 * @param communicateList
	 * @return
	 */
	public List<Communicate> findByCommunicateIdList(List<Integer> communicateList);

	/**
	 * 批量删除
	 * 
	 * @param communicateArray
	 */
	public int deleteByCommunicateList(Integer[] communicateArray);

	/**
	 * 批量修改
	 * 
	 * @param communicates
	 */
	public void editCommunicates(List<Communicate> communicates);

	/**
	 * 批量新增
	 * 
	 * @param communicates
	 */
	public void addCommunicates(List<Communicate> communicates);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<Communicate> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}