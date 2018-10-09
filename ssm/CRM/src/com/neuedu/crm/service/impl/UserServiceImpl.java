package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.mapper.UserMapper;
import com.neuedu.crm.service.IUserService;

@Service
@Transactional  //事务管理
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> findAll() {
		// TODO 自动生成的方法存根
		return userMapper.findAll();
	}

	@Override
	public User findById(Integer userId) {
		// TODO 自动生成的方法存根
		return userMapper.findById(userId);
	}

	@Override
	public int editUser(User user) {
		// TODO 自动生成的方法存根
		return userMapper.editUser(user);
	}

	@Override
	public int addUser(User user) {
		// TODO 自动生成的方法存根
		return userMapper.addUser(user);
	}

	@Override
	public int deleteById(Integer userId) {
		// TODO 自动生成的方法存根
		return userMapper.deleteById(userId);
	}

	@Override
	public List<User> findByPager(Pager pager) {
		// TODO 自动生成的方法存根
		return userMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO 自动生成的方法存根
		return userMapper.countForPager(pager);
	}


	@Override
	public User findForLogin(User user) {
		
		return userMapper.findForLogin(user);
	}

	@Override
	public User loginByExample(User user) {
		
		return userMapper.loginByExample(user);
	}

	public User findAcount(String account) {
		return userMapper.findAcount(account);
	}
	
	public boolean changePW(User user) {
		userMapper.changePW(user);
		return true;
	}

}
