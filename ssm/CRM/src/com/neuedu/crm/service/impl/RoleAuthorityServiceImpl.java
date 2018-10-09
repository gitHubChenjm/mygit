package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.RoleAuthority;
import com.neuedu.crm.mapper.RoleAuthorityMapper;
import com.neuedu.crm.service.IRoleAuthorityService;

@Service
@Transactional // 事务管理
public class RoleAuthorityServiceImpl implements IRoleAuthorityService {

	@Autowired
	private RoleAuthorityMapper roleAuthorityMapper;

	@Override
	public List<RoleAuthority> findAll() {
		// TODO Auto-generated method stub
		return roleAuthorityMapper.findAll();
	}

	@Override
	public RoleAuthority findById(Integer roleAuthorityId) {
		// TODO Auto-generated method stub
		return roleAuthorityMapper.findById(roleAuthorityId);
	}

	@Override
	public int editRoleAuthority(RoleAuthority roleAuthority) {
		// TODO Auto-generated method stub
		return roleAuthorityMapper.editRoleAuthority(roleAuthority);
	}

	@Override
	public int addRoleAuthority(RoleAuthority roleAuthority) {
		// TODO Auto-generated method stub
		return roleAuthorityMapper.addRoleAuthority(roleAuthority);
	}

	@Override
	public int deleteById(Integer roleAuthorityId) {
		// TODO Auto-generated method stub
		return roleAuthorityMapper.deleteById(roleAuthorityId);
	}

	@Override
	public List<RoleAuthority> findByPager(Pager pager) {
		// TODO Auto-generated method stub
		return roleAuthorityMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO Auto-generated method stub
		return roleAuthorityMapper.countForPager(pager);
	}

	@Override
	public List<RoleAuthority> findByExample(RoleAuthority roleAuthorityId) {
		// TODO Auto-generated method stub
		return roleAuthorityMapper.findByExample(roleAuthorityId);
	}

}
