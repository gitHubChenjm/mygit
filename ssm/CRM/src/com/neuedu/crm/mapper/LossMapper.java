package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Loss;
import com.neuedu.crm.bean.Pager;

public interface LossMapper {
	public List<Loss> findAll();

	public Loss findById(Integer lossId);

	public int editLoss(Loss loss);

	public int addLoss(Loss loss);

	public int deleteById(Integer lossId);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param loss
	 * @return
	 */
	public List<Loss> findByExample(Loss loss);

	/**
	 * 批量查询
	 * 
	 * @param lossIdList
	 * @return
	 */
	public List<Loss> findByLossIdListList(List<Integer> lossIdList);

	/**
	 * 批量删除
	 * 
	 * @param lossIdArray
	 */
	public void deleteByLossIdList(Integer[] lossIdArray);

	/**
	 * 批量修改
	 * 
	 * @param losss
	 */
	public void editLosss(List<Loss> losss);

	/**
	 * 批量新增
	 * 
	 * @param losss
	 */
	public void addLosss(List<Loss> losss);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<Loss> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}