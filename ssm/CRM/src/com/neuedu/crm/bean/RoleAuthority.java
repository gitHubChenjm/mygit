package com.neuedu.crm.bean;

public class RoleAuthority {

	private Authority authority;

	private Role role;

	public RoleAuthority() {
		super();
	}

	public RoleAuthority(Authority authority, Role role) {
		super();
		this.authority = authority;
		this.role = role;
	}

	public Authority getAuthority() {
		return authority;
	}

	public void setAuthority(Authority authority) {
		this.authority = authority;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "RoleAuthority [authority=" + authority + ", role=" + role + "]";
	}

}