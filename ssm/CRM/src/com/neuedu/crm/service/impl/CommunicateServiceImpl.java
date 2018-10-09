package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Communicate;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.mapper.CommunicateMapper;
import com.neuedu.crm.service.ICommunicateService;

@Service
@Transactional // 事务管理
public class CommunicateServiceImpl implements ICommunicateService {
	
	@Autowired
	private CommunicateMapper communicateMapper;

	@Override
	public List<Communicate> findAll() {
		// TODO Auto-generated method stub
		return communicateMapper.findAll();
	}

	@Override
	public Communicate findById(Integer communicateId) {
		// TODO Auto-generated method stub
		return communicateMapper.findById(communicateId);
	}

	@Override
	public Communicate findByCustomerId(Integer customerId) {
		// TODO Auto-generated method stub
		return communicateMapper.findByCustomerId(customerId);
	}

	@Override
	public int editCommunicate(Communicate communicate) {
		// TODO Auto-generated method stub
		return communicateMapper.editCommunicate(communicate);
	}

	@Override
	public int addCommunicate(Communicate communicate) {
		// TODO Auto-generated method stub
		return communicateMapper.addCommunicate(communicate);
	}

	@Override
	public int deleteById(Integer communicateId) {
		// TODO Auto-generated method stub
		return communicateMapper.deleteById(communicateId);
	}

	@Override
	public List<Communicate> findByPager(Pager pager) {
		// TODO Auto-generated method stub
		return communicateMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO Auto-generated method stub
		return communicateMapper.countForPager(pager);
	}

	@Override
	public List<Communicate> findByExample(Communicate communicate) {
		// TODO Auto-generated method stub
		return communicateMapper.findByExample(communicate);
	}

	@Override
	public int deleteByCommunicateList(Integer[] communicateArray) {
		// TODO Auto-generated method stub
		return communicateMapper.deleteByCommunicateList(communicateArray);
	}

}
