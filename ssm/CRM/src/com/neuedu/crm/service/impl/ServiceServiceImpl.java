package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Service;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.mapper.ServiceMapper;
import com.neuedu.crm.service.IServiceService;
import com.neuedu.crm.service.IUserService;

@org.springframework.stereotype.Service
@Transactional
public class ServiceServiceImpl implements IServiceService {

	@Autowired
	private ServiceMapper serviceMapper;
	
	public boolean addService(Service service) {
		serviceMapper.addService(service);
		return true;
	}

	@Override
	public List<Service> findAll() {
		
		return serviceMapper.findAll();
	}

	@Override
	public boolean editService(Service service) {
		serviceMapper.editService(service);
		return true;
	}

	public boolean deleteById(Integer serviceId) {
		serviceMapper.deleteById(serviceId);
		return true;
	}

	@Override
	public Service findById(Integer serviceId) {
		
		return serviceMapper.findById(serviceId);
	}
	
	/**
	 * 批量删除
	 * 
	 * @param serviceIdArray
	 */
	public boolean deleteByServiceIdList(Integer[] serviceIdArray) {
		serviceMapper.deleteByServiceIdList(serviceIdArray);
		return true;
	}

}
