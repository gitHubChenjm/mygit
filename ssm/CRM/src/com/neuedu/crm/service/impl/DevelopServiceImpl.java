package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Develop;
import com.neuedu.crm.bean.Sale;
import com.neuedu.crm.mapper.DevelopMapper;
import com.neuedu.crm.service.IDevelopService;

@Service
@Transactional // 事务管理
public class DevelopServiceImpl implements IDevelopService {
	
	@Autowired
	private DevelopMapper developMapper;

	@Override
	public List<Develop> findAll() {
		
		return developMapper.findAll();
	}

	@Override
	public Develop findById(Integer developId) {
		
		return developMapper.findById(developId);
	}


	@Override
	public int addDevelop(Develop develop) {
		
		return developMapper.add(develop);
	}

	@Override
	public int deleteById(Integer developId) {
		
		return developMapper.deleteById(developId);
	}

	@Override
	public int editDevelop(Develop develop) {
		
		return developMapper.edit(develop);
	}

	@Override
	public int editResult(Sale sale) {
		
		return developMapper.editResult(sale);
	}

	@Override
	public List<Develop> findBySaleId(Develop develop) {
		
		return developMapper.findBySaleId(develop);
	}

}
