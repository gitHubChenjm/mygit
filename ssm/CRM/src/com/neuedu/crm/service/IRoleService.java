package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Role;

public interface IRoleService {
	public List<Role> findAll();

	public Role findById(Integer roleId);

	public int editRole(Role book);

	public int addRole(Role book);

	public int deleteById(Integer roleId);
	
	public List<Role> findByExample(Role role);
	
	public List<Role> findByPager(Pager pager);

	public int countForPager(Pager pager);
}
