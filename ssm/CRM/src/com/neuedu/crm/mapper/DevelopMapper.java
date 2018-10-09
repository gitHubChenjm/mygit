package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Develop;
import com.neuedu.crm.bean.Sale;

public interface DevelopMapper {
	
	public List<Develop> findAll();

	public Develop findById(Integer developId);
	
	public List<Develop> findBySaleId(Develop develop);

	public int edit(Develop develop);

	public int add(Develop develop);

	public int deleteById(Integer developId);
	
	public int editResult(Sale sale);

}