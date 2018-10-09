package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Authority;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.mapper.AuthorityMapper;
import com.neuedu.crm.service.IAuthorityService;

@Service
@Transactional // 事务管理
public class AuthorityServiceImpl implements IAuthorityService {

	@Autowired
	private AuthorityMapper authorityMapper;

	@Override
	public List<Authority> findAll() {
		// TODO Auto-generated method stub
		return authorityMapper.findAll();
	}

	@Override
	public Authority findById(Integer authorityId) {
		// TODO Auto-generated method stub
		return authorityMapper.findById(authorityId);
	}

	@Override
	public int editAuthority(Authority authority) {
		// TODO Auto-generated method stub
		return authorityMapper.editAuthority(authority);
	}

	@Override
	public int addAuthority(Authority authority) {
		// TODO Auto-generated method stub
		return authorityMapper.addAuthority(authority);
	}

	@Override
	public int deleteById(Integer authorityId) {
		// TODO Auto-generated method stub
		return authorityMapper.deleteById(authorityId);
	}

	@Override
	public List<Authority> findByPager(Pager pager) {
		// TODO Auto-generated method stub
		return authorityMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO Auto-generated method stub
		return authorityMapper.countForPager(pager);
	}

	@Override
	public List<Authority> findByExample(Authority authority) {
		// TODO Auto-generated method stub
		return authorityMapper.findByExample(authority);
	}

}
