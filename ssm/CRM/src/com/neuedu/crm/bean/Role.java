package com.neuedu.crm.bean;

import java.util.List;

public class Role {
	private Integer roleId;

	private String roleName;

	private List<RoleAuthority> roleauthoritys;

	private List<UserRole> userroles;

	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + ", roleauthoritys=" + roleauthoritys
				+ ", userroles=" + userroles + "]";
	}

	public Role() {
		super();
	}

	public Role(Integer roleId, String roleName) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
	}

	public Role(Integer roleId, String roleName, List<RoleAuthority> roleauthoritys) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleauthoritys = roleauthoritys;
	}

	public Role(Integer roleId, String roleName, List<RoleAuthority> roleauthoritys, List<UserRole> userroles) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleauthoritys = roleauthoritys;
		this.userroles = userroles;
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

	public List<RoleAuthority> getRoleauthoritys() {
		return roleauthoritys;
	}

	public void setRoleauthoritys(List<RoleAuthority> roleauthoritys) {
		this.roleauthoritys = roleauthoritys;
	}

	public List<UserRole> getUserroles() {
		return userroles;
	}

	public void setUserroles(List<UserRole> userroles) {
		this.userroles = userroles;
	}

}