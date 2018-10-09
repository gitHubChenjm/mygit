package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Develop;
import com.neuedu.crm.bean.Sale;

public interface IDevelopService {
	
	public List<Develop> findAll();

	public Develop findById(Integer developId);
	
	public List<Develop> findBySaleId(Develop develop);

	public int editDevelop(Develop develop);

	public int addDevelop(Develop develop);

	public int deleteById(Integer developId);
	
	/**
	 * 开发成功或者失败
	 * @param sale
	 * @return
	 */
	public int editResult(Sale sale);
}
