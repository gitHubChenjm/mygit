package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.RoleAuthority;

public interface IRoleAuthorityService {
	public List<RoleAuthority> findAll();

	public RoleAuthority findById(Integer roleAuthorityId);

	public int editRoleAuthority(RoleAuthority roleAuthority);

	public int addRoleAuthority(RoleAuthority roleAuthority);

	public int deleteById(Integer roleAuthorityId);
	
	public List<RoleAuthority> findByExample(RoleAuthority roleAuthorityId);
	
	public List<RoleAuthority> findByPager(Pager pager);

	public int countForPager(Pager pager);
}
