package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.UserRole;

public interface IUserRoleService {
	public List<UserRole> findAll();

	public UserRole findById(Integer userRoleId);

	public int editUserRole(UserRole userRole);

	public int addUserRole(UserRole userRole);

	public int deleteById(Integer userRoleId);
	
	public List<UserRole> findByExample(UserRole userRole);
	
	public List<UserRole> findByPager(Pager pager);

	public int countForPager(Pager pager);
	
	/**
	 * 批量查询
	 * 
	 * @param userRoleIdList
	 * @return
	 */
	public List<UserRole> findByUserRoleIdList(List<Integer> userIdList);
	
	/**
	 * 批量修改
	 * 
	 * @param userRoles
	 */
	public void editUserRoles(List<UserRole> userRoles);
	
	/**
	 * 批量新增
	 * 
	 * @param userRoles
	 */
	public void addUserRoles(List<UserRole> userRoles);
}
