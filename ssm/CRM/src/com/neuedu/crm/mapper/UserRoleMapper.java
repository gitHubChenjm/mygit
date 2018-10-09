package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.UserRole;

public interface UserRoleMapper {
	public List<UserRole> findAll();

	public UserRole findById(Integer userId);

	public int editUserRole(UserRole userRole);

	public int addUserRole(UserRole userRole);

	public int deleteById(Integer userRoleId);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param userRole
	 * @return
	 */
	public List<UserRole> findByExample(UserRole userRole);

	/**
	 * 批量查询
	 * 
	 * @param userRoleIdList
	 * @return
	 */
	public List<UserRole> findByUserRoleIdList(List<Integer> userIdList);

	/**
	 * 批量删除
	 * 
	 * @param userRoleIdArray
	 */
	public void deleteByUserRoleIdList(Integer[] userRoleIdArray);

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

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<UserRole> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}