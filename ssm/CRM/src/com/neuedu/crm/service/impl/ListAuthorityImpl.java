package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.ListAuthority;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.mapper.ListAuthorityMapper;
import com.neuedu.crm.service.IListAuthorityService;
@Service
@Transactional
public class ListAuthorityImpl implements IListAuthorityService {
	
	@Autowired
	private ListAuthorityMapper listAuthorityMapper;
	@Override
	public List<ListAuthority> findAllCustomerDeal() {
	
		return listAuthorityMapper.findAllCustomerDeal();
	}

	
	/**
	 * 根据传入的对象查询
	 * @param listAuthority
	 * @return
	 */
	public List<ListAuthority> findByExample(ListAuthority listAuthority){
		return listAuthorityMapper.findByExample(listAuthority);
	}
	
	/**
	 * 查询对象，带分页
	 * @param listAuthority
	 * @return
	 */
	public List<ListAuthority> findBypagerExample(Pager pager){
		return listAuthorityMapper.findBypagerExample(pager);
	}
	
	/**
	 * 分页前的查询数据条数
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager) {
		return listAuthorityMapper.countForPager(pager);
	}
	
	/**
	 * 根据id集查询
	 * @param userIdList
	 * @return
	 */
	public List<ListAuthority> findByIdList(List<Integer> userIdList){
		return listAuthorityMapper.findByIdList(userIdList);
	}
}
