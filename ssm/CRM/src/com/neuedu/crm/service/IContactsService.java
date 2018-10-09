package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Contacts;
import com.neuedu.crm.bean.Pager;

public interface IContactsService {
	public List<Contacts> findAll();

	public Contacts findById(Integer contactsId);
	
	public int editContacts(Contacts contacts);
	
	public int addContacts(Contacts contacts);
	
	public int deleteById(Integer contactsId);
	
	public int deleteByContactsList(Integer[] contactsArray);
	
	public List<Contacts> findByExample(Contacts contacts);
	
	public List<Contacts> findByPager(Pager pager);

	public int countForPager(Pager pager);
}
