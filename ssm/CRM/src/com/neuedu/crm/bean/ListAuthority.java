package com.neuedu.crm.bean;

public class ListAuthority {
	private Integer id; //用户id
	private Integer roleId;
	private String roleName;
	private Integer authorityId;
	private Integer sort;
	private String name;//权限名字
	private String authorityMark;
	private String account;//用户名字
	private Integer navigation;//是否为导航栏

	
	public ListAuthority(Integer id, Integer roleId, String roleName, Integer authorityId, Integer sort, String name,
			String authorityMark, String account, Integer navigation) {
		super();
		this.id = id;
		this.roleId = roleId;
		this.roleName = roleName;
		this.authorityId = authorityId;
		this.sort = sort;
		this.name = name;
		this.authorityMark = authorityMark;
		this.account = account;
		this.navigation = navigation;
	}
	public Integer getNavigation() {
		return navigation;
	}
	public void setNavigation(Integer navigation) {
		this.navigation = navigation;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Integer getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(Integer authorityId) {
		this.authorityId = authorityId;
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
	public String getAuthorityMark() {
		return authorityMark;
	}
	public void setAuthorityMark(String authorityMark) {
		this.authorityMark = authorityMark;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public ListAuthority() {
		super();
	}
	@Override
	public String toString() {
		return "ListAuthority [id=" + id + ", roleId=" + roleId + ", roleName=" + roleName + ", authorityId="
				+ authorityId + ", sort=" + sort + ", name=" + name + ", authorityMark=" + authorityMark + ", account="
				+ account + "]";
	}
	
	
}
