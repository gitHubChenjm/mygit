package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.User;

public interface UserMapper {
	public List<User> findAll();
	
	public User findAcount(String account);
	
	public boolean changePW(User user);

	public List<User> findAllWithRole();
	
	public List<User> findAllWithAuthority();
	
	public User findForLogin(User user);

	public User findById(Integer userId);

	public int editUser(User user);

	public int addUser(User user);

	public int deleteById(Integer userId);
	
	public User loginByExample(User user);

	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param user
	 * @return
	 */
	public List<User> findByExample(User user);

	/**
	 * 批量查询
	 * 
	 * @param userIdList
	 * @return
	 */
	public List<User> findByUserIdList(List<Integer> userIdList);

	/**
	 * 批量删除
	 * 
	 * @param userIdArray
	 */
	public void deleteByUserIdList(Integer[] userIdArray);

	/**
	 * 批量修改
	 * 
	 * @param users
	 */
	public void editUsers(List<User> users);

	/**
	 * 批量新增
	 * 
	 * @param users
	 */
	public void addUsers(List<User> users);

	/**
	 * 分页查询
	 * 
	 * @return
	 */
	public List<User> findByPager(Pager pager);

	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}