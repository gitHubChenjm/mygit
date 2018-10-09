package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.User;

public interface IUserService {
	public List<User> findAll();
	
	public User findAcount(String account);
	
	public boolean changePW(User user);
	
	public User findById(Integer userId);
	
	public User findForLogin(User user);

	public int editUser(User user);

	public int addUser(User user);

	public int deleteById(Integer userId);
	
	public User loginByExample(User user);
	
	public List<User> findByPager(Pager pager);

	public int countForPager(Pager pager);
}
