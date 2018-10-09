package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Loss;
import com.neuedu.crm.bean.Pager;

public interface ILossService {
	public List<Loss> findAll();
	
	public Loss findById(Integer lossId);

	public int editLoss(Loss loss);

	public int addLoss(Loss loss);

	public int deleteById(Integer lossId);
	
	public List<Loss> findByExample(Loss loss);
	
	public List<Loss> findByPager(Pager pager);

	public int countForPager(Pager pager);
}
