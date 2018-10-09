package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Contacts;
import com.neuedu.crm.bean.Pager;

public interface ContactsMapper {
	public List<Contacts> findAll();

	public Contacts findById(Integer contactsId);
	
	public int editContacts(Contacts contacts);
	
	public int addContacts(Contacts contacts);
	
	public int deleteById(Integer contactsId);
	
	/**
	 * 测试多条件查询和模糊查询
	 * 
	 * @param contacts
	 * @return
	 */
	public List<Contacts> findByExample(Contacts contacts);
	
	/**
	 * 批量查询
	 * @param contactsList
	 * @return
	 */
	public List<Contacts> findByContactsList(List<Integer> contactsList);
	/**
	 * 批量删除
	 * @param contactsArray
	 */
    public int deleteByContactsList(Integer[] contactsArray);
    
    /**
     * 批量修改
     * @param contactss
     */
    public void editContactss(List<Contacts> contactss);
    
    /**
     * 批量新增
     * @param contactss
     */
    public void addContactss(List<Contacts> contactss);
    
    
    /**
     * 分页查询
     * @return
     */
	public List<Contacts> findByPager(Pager pager);
	
	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}