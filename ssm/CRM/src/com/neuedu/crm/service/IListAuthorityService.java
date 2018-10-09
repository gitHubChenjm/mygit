package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.ListAuthority;
import com.neuedu.crm.bean.Pager;

public interface IListAuthorityService {
	public List<ListAuthority> findAllCustomerDeal();
	
	/**
	 * 根据传入的对象查询
	 * @param listAuthority
	 * @return
	 */
	public List<ListAuthority> findByExample(ListAuthority listAuthority);
	
	/**
	 * 查询对象，带分页
	 * @param listAuthority
	 * @return
	 */
	public List<ListAuthority> findBypagerExample(Pager pager);
	
	/**
	 * 分页前的查询数据条数
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
	
	/**
	 * 根据id集查询
	 * @param userIdList
	 * @return
	 */
	public List<ListAuthority> findByIdList(List<Integer> userIdList);
}
