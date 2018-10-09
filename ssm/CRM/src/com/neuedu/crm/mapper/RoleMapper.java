package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Role;

public interface RoleMapper {
	public List<Role> findAll();

	public Role findById(Integer roleId);

	public int editRole(Role book);

	public int addRole(Role book);

	public int deleteById(Integer roleId);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param role
	 * @return
	 */
	public List<Role> findByExample(Role role);

	/**
	 * 批量查询
	 * 
	 * @param roleIdList
	 * @return
	 */
	public List<Role> findByRoleIdList(List<Integer> roleIdList);

	/**
	 * 批量删除
	 * 
	 * @param roleIdArray
	 */
	public void deleteByRoleIdList(Integer[] roleIdArray);

	/**
	 * 批量修改
	 * 
	 * @param roles
	 */
	public void editRoles(List<Role> roles);

	/**
	 * 批量新增
	 * 
	 * @param roles
	 */
	public void addRoles(List<Role> roles);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<Role> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}