package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.RoleAuthority;

public interface RoleAuthorityMapper {
	public List<RoleAuthority> findAll();

	public List<RoleAuthority> findAllWithCategory();

	public RoleAuthority findById(Integer roleAuthorityId);

	public int editRoleAuthority(RoleAuthority roleAuthority);

	public int addRoleAuthority(RoleAuthority roleAuthority);

	public int deleteById(Integer roleAuthorityId);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param roleAuthorityId
	 * @return
	 */
	public List<RoleAuthority> findByExample(RoleAuthority roleAuthorityId);

	/**
	 * 批量查询
	 * 
	 * @param roleAuthorityIdList
	 * @return
	 */
	public List<RoleAuthority> findByRoleAuthorityIdList(List<Integer> roleAuthorityIdList);

	/**
	 * 批量删除
	 * 
	 * @param roleAuthorityIdArray
	 */
	public void deleteByRoleAuthorityIdList(Integer[] roleAuthorityIdArray);

	/**
	 * 批量修改
	 * 
	 * @param roleAuthoritys
	 */
	public void editRoleAuthoritys(List<RoleAuthority> roleAuthoritys);

	/**
	 * 批量新增
	 * 
	 * @param roleAuthoritys
	 */
	public void addRoleAuthoritys(List<RoleAuthority> roleAuthoritys);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<RoleAuthority> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}