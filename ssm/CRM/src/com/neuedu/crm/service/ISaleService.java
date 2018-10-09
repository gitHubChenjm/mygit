package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Sale;
import com.neuedu.crm.bean.SaleVo;
import com.neuedu.crm.bean.User;

public interface ISaleService {

	public int addSale(Sale sale);
	
	public int deleteSaleByExample(Sale example);	//实际上通过id来删
	
	public int deleteSaleByExamples(List<Sale> exampleList);
	
	public int modifyByExample(Sale example);
	
	public int changeDealUser(Sale sale);
	
	public List<Sale> findByExampleWithConf(Sale example);
	
	public List<SaleVo> findAll();
	
	public SaleVo findById(int saleId);
	
	/**
	 * 多条件分页模糊查询
	 * @param pager
	 * @return
	 */
	public List<SaleVo> findByPagerWithCond(Pager<SaleVo> pager);
	
	/**
	 * 多条件分页模糊查询，按指派时间倒序排列
	 * @param pager
	 * @return
	 */
	public List<SaleVo> findByPagerWithCondAssign(Pager<SaleVo> pager);
	
	public int countForPagerWithCond(Pager<SaleVo> pager);
	
	//查询所有客户经理
	public List<User> findAllCustomerManager();
	
	/**
	 * 通过Id数组批量删除
	 */
	public int deleteByIdList(int[] IdList);
	
	/**
	 * 通过用户编号查找角色
	 */
	public int findRoleById(int userid);
	
		
}
