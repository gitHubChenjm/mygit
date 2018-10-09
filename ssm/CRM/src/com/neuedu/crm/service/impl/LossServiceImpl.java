package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Loss;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.mapper.LossMapper;
import com.neuedu.crm.service.ILossService;

@Service
@Transactional // 事务管理
public class LossServiceImpl implements ILossService {

	@Autowired
	private LossMapper lossMapper;

	@Override
	public List<Loss> findAll() {
		// TODO Auto-generated method stub
		return lossMapper.findAll();
	}

	@Override
	public Loss findById(Integer lossId) {
		// TODO Auto-generated method stub
		return lossMapper.findById(lossId);
	}

	@Override
	public int editLoss(Loss loss) {
		// TODO Auto-generated method stub
		return lossMapper.editLoss(loss);
	}

	@Override
	public int addLoss(Loss loss) {
		// TODO Auto-generated method stub
		return lossMapper.addLoss(loss);
	}

	@Override
	public int deleteById(Integer lossId) {
		// TODO Auto-generated method stub
		return lossMapper.deleteById(lossId);
	}

	@Override
	public List<Loss> findByPager(Pager pager) {
		// TODO Auto-generated method stub
		return lossMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO Auto-generated method stub
		return lossMapper.countForPager(pager);
	}

	@Override
	public List<Loss> findByExample(Loss loss) {
		// TODO Auto-generated method stub
		return lossMapper.findByExample(loss);
	}

}
