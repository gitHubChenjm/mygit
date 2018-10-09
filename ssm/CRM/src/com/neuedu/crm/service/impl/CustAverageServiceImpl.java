package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.CustAverage;
import com.neuedu.crm.mapper.CustAverageMapper;
import com.neuedu.crm.service.ICustAverageService;

@Service
@Transactional
public class CustAverageServiceImpl implements ICustAverageService {
	@Autowired
	private CustAverageMapper custAverageMapper;
	@Override
	public List<CustAverage> findCustAverage(CustAverage custAverage) {
		return custAverageMapper.findCustAverage(custAverage);
	}
	
	/**
	 * 返回单个客户的购买记录
	 * @param custAverage
	 * @return
	 */
	public List<CustAverage> findCustOder(CustAverage custAverage){
		return custAverageMapper.findCustOder(custAverage);
	}
	
	/**
	 * 返回产品销售量
	 */
	public List<CustAverage> findProductSale(){
		return custAverageMapper.findProductSale();
	}
}
