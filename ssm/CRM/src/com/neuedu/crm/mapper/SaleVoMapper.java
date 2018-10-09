/**
 * author DongLq 2018年7月9日
 */
package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.SaleVo;
import com.neuedu.crm.bean.User;


public interface SaleVoMapper {
	
	public List<SaleVo> findAllSaleVo();
	
	public SaleVo findSaleVoById(int saleId);
	
	public List<SaleVo> findByPagerWithCond(Pager<SaleVo> pager);
	
	/**
	 * 分页查询，按指派时间倒序排列
	 * @param pager
	 * @return
	 */
	public List<SaleVo> findByPagerWithCondAssign(Pager<SaleVo> pager);
	
	public int countForPagerWithCond(Pager<SaleVo> pager);
	
	//查询所有客户经理
	public List<User> findAllCustomerManager();
	
	/**
	 * 通过用户编号查找角色
	 */
	public int findRoleById(int userid);
}
