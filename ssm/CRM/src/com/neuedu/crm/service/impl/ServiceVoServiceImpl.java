package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Service;
import com.neuedu.crm.bean.ServiceVo;
import com.neuedu.crm.mapper.ServiceVoMapper;
import com.neuedu.crm.service.IServiceService;
import com.neuedu.crm.service.IServiceVoService;
@org.springframework.stereotype.Service
@Transactional
public class ServiceVoServiceImpl implements IServiceVoService {

	@Autowired
	private ServiceVoMapper serviceVoMapper;
	
	@Override
	public int countForPager(Pager pager) {
		
		return serviceVoMapper.countForPager(pager);
	}

	@Override
	public List<ServiceVo> findPagerByExample(Pager<ServiceVo> pager) {
		
		return serviceVoMapper.findPagerByExample(pager);
	}

}
