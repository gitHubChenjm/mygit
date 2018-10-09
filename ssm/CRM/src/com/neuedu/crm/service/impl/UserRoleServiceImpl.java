package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.UserRole;
import com.neuedu.crm.mapper.UserRoleMapper;
import com.neuedu.crm.service.IUserRoleService;

@Service
@Transactional // 事务管理
public class UserRoleServiceImpl implements IUserRoleService {

	@Autowired
	private UserRoleMapper userRoleMapper;

	@Override
	public List<UserRole> findAll() {
		// TODO Auto-generated method stub
		return userRoleMapper.findAll();
	}

	@Override
	public UserRole findById(Integer userRoleId) {
		// TODO Auto-generated method stub
		return userRoleMapper.findById(userRoleId);
	}

	@Override
	public int editUserRole(UserRole userRole) {
		// TODO Auto-generated method stub
		return userRoleMapper.editUserRole(userRole);
	}

	@Override
	public int addUserRole(UserRole userRole) {
		// TODO Auto-generated method stub
		return userRoleMapper.addUserRole(userRole);
	}

	@Override
	public int deleteById(Integer userRoleId) {
		// TODO Auto-generated method stub
		return userRoleMapper.deleteById(userRoleId);
	}

	@Override
	public List<UserRole> findByPager(Pager pager) {
		// TODO Auto-generated method stub
		return userRoleMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO Auto-generated method stub
		return userRoleMapper.countForPager(pager);
	}

	@Override
	public List<UserRole> findByExample(UserRole userRole) {
		// TODO Auto-generated method stub
		return userRoleMapper.findByExample(userRole);
	}
	
	/**
	 * 批量查询
	 * 
	 * @param userRoleIdList
	 * @return
	 */
	public List<UserRole> findByUserRoleIdList(List<Integer> userIdList){
		return userRoleMapper.findByUserRoleIdList(userIdList);
	}
	/**
	 * 批量修改
	 * 
	 * @param userRoles
	 */
	public void editUserRoles(List<UserRole> userRoles) {
		userRoleMapper.editUserRoles(userRoles);
	}
	
	/**
	 * 批量新增
	 * 
	 * @param userRoles
	 */
	public void addUserRoles(List<UserRole> userRoles) {
		userRoleMapper.addUserRoles(userRoles);
	}
}
