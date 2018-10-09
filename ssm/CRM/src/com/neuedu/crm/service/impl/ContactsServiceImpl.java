package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Contacts;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.mapper.ContactsMapper;
import com.neuedu.crm.service.IContactsService;

@Service
@Transactional // 事务管理
public class ContactsServiceImpl implements IContactsService {
	
	@Autowired
	private ContactsMapper contactsMapper;

	@Override
	public List<Contacts> findAll() {
		// TODO Auto-generated method stub
		return contactsMapper.findAll();
	}

	@Override
	public Contacts findById(Integer contactsId) {
		// TODO Auto-generated method stub
		return contactsMapper.findById(contactsId);
	}

	@Override
	public int editContacts(Contacts contacts) {
		// TODO Auto-generated method stub
		return contactsMapper.editContacts(contacts);
	}

	@Override
	public int addContacts(Contacts contacts) {
		// TODO Auto-generated method stub
		return contactsMapper.addContacts(contacts);
	}

	@Override
	public int deleteById(Integer contactsId) {
		// TODO Auto-generated method stub
		return contactsMapper.deleteById(contactsId);
	}

	@Override
	public List<Contacts> findByPager(Pager pager) {
		// TODO Auto-generated method stub
		return contactsMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO Auto-generated method stub
		return contactsMapper.countForPager(pager);
	}

	@Override
	public List<Contacts> findByExample(Contacts contacts) {
		// TODO Auto-generated method stub
		return contactsMapper.findByExample(contacts);
	}

	@Override
	public int deleteByContactsList(Integer[] contactsArray) {
		// TODO Auto-generated method stub
		return contactsMapper.deleteByContactsList(contactsArray);
	}

}
