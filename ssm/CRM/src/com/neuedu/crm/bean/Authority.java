/**
 * Authority表用于存放整个系统的各个使用权限
 * @author WYY
 * @version 1.0 2018-07-26
 */
package com.neuedu.crm.bean;

import java.util.List;

public class Authority {
	/**
	 * 权限表字段
	 */
	private Integer authorityId;

	private String authorityMark;
	
	private Integer sort;
	
	private String name;

	private List<RoleAuthority> roleauthoritys;

	/**
	 * toString方法，用于打印数据作为调试信息显示
	 */
	@Override
	public String toString() {
		return "Authority [authorityId=" + authorityId + ", authorityMark=" + authorityMark + ", sort=" + sort
				+ ", name=" + name + ", roleauthoritys=" + roleauthoritys + "]";
	}

	/**
	 * getter方法和setter方法
	 */
	public Integer getAuthorityId() {
		return authorityId;
	}

	public void setAuthorityId(Integer authorityId) {
		this.authorityId = authorityId;
	}

	public String getAuthorityMark() {
		return authorityMark;
	}

	public void setAuthorityMark(String authorityMark) {
		this.authorityMark = authorityMark;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<RoleAuthority> getRoleauthoritys() {
		return roleauthoritys;
	}

	public void setRoleauthoritys(List<RoleAuthority> roleauthoritys) {
		this.roleauthoritys = roleauthoritys;
	}

	/**
	 * 构造方法
	 */
	
	public Authority(Integer authorityId, String authorityMark, List<RoleAuthority> roleauthoritys) {
		super();
		this.authorityId = authorityId;
		this.authorityMark = authorityMark;
		this.roleauthoritys = roleauthoritys;
	}

	public Authority(Integer authorityId, String authorityMark) {
		super();
		this.authorityId = authorityId;
		this.authorityMark = authorityMark;
	}

	public Authority(Integer authorityId, String authorityMark, Integer sort, String name) {
		super();
		this.authorityId = authorityId;
		this.authorityMark = authorityMark;
		this.sort = sort;
		this.name = name;
	}

	public Authority(Integer authorityId, String authorityMark, Integer sort, String name,
			List<RoleAuthority> roleauthoritys) {
		super();
		this.authorityId = authorityId;
		this.authorityMark = authorityMark;
		this.sort = sort;
		this.name = name;
		this.roleauthoritys = roleauthoritys;
	}

	//无参构造方法
	public Authority() {
		super();
	}

}