package com.neuedu.crm.bean;

import java.util.Date;
import java.util.List;

public class Log {
	String account;
	String tel;
	String action;
	String explains;
	Date date;
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getExplains() {
		return explains;
	}
	public void setExplains(String explains) {
		this.explains = explains;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Log(String account, String tel, String action, String explains, Date date) {
		super();
		this.account = account;
		this.tel = tel;
		this.action = action;
		this.explains = explains;
		this.date = date;
	}
	public Log() {
		super();
	}
	@Override
	public String toString() {
		return "Log [account=" + account + ", tel=" + tel + ", action=" + action + ", explains=" + explains + ", date="
				+ date + "]";
	}
	
}
