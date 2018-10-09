package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Service;

public interface IServiceService {
	public boolean addService(Service service);
	
	public List<Service> findAll();
	
	public boolean editService(Service service);
	
	public boolean deleteById(Integer serviceId);
	
	public Service findById(Integer serviceId);
	
	/**
	 * 批量删除
	 * 
	 * @param serviceIdArray
	 */
	public boolean deleteByServiceIdList(Integer[] serviceIdArray);
}
