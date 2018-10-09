package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Authority;
import com.neuedu.crm.bean.Pager;

public interface IAuthorityService {
	public List<Authority> findAll();

	public Authority findById(Integer authorityId);

	public int editAuthority(Authority authority);

	public int addAuthority(Authority authority);

	public int deleteById(Integer authorityId);
	
	public List<Authority> findByExample(Authority authority);

	public List<Authority> findByPager(Pager pager);

	public int countForPager(Pager pager);
}
