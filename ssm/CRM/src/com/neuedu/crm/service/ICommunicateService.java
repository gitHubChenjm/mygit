package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Communicate;
import com.neuedu.crm.bean.Pager;

public interface ICommunicateService {
	public List<Communicate> findAll();

	public Communicate findById(Integer communicateId);

	public Communicate findByCustomerId(Integer customerId);
	
	public List<Communicate> findByExample(Communicate communicate);

	public int editCommunicate(Communicate communicate);

	public int addCommunicate(Communicate communicate);

	public int deleteById(Integer communicateId);
	
	public int deleteByCommunicateList(Integer[] communicateArray);

	public List<Communicate> findByPager(Pager pager);

	public int countForPager(Pager pager);
}
