package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.CustAverage;

public interface CustAverageMapper {
	/**
	 * 返回所有客户的贡献度，即购买的金钱
	 * @param custAverage
	 * @return
	 */
	public List<CustAverage> findCustAverage(CustAverage custAverage);
	
	/**
	 * 返回单个客户的购买记录
	 * @param custAverage
	 * @return
	 */
	public List<CustAverage> findCustOder(CustAverage custAverage);
	
	/**
	 * 返回产品销售量
	 */
	public List<CustAverage> findProductSale();
}
