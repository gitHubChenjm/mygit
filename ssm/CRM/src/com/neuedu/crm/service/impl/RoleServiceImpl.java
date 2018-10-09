package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Role;
import com.neuedu.crm.mapper.RoleMapper;
import com.neuedu.crm.service.IRoleService;

@Service
@Transactional // 事务管理
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Override
	public List<Role> findAll() {
		// TODO Auto-generated method stub
		return roleMapper.findAll();
	}

	@Override
	public Role findById(Integer roleId) {
		// TODO Auto-generated method stub
		return roleMapper.findById(roleId);
	}

	@Override
	public int editRole(Role book) {
		// TODO Auto-generated method stub
		return roleMapper.editRole(book);
	}

	@Override
	public int addRole(Role book) {
		// TODO Auto-generated method stub
		return roleMapper.addRole(book);
	}

	@Override
	public int deleteById(Integer roleId) {
		// TODO Auto-generated method stub
		return roleMapper.deleteById(roleId);
	}

	@Override
	public List<Role> findByPager(Pager pager) {
		// TODO Auto-generated method stub
		return roleMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO Auto-generated method stub
		return roleMapper.countForPager(pager);
	}

	@Override
	public List<Role> findByExample(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.findByExample(role);
	}

}
