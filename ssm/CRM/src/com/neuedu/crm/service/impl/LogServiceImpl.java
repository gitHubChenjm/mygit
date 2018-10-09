package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Log;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.mapper.LogMapper;
import com.neuedu.crm.service.ILogService;

@Service
@Transactional
public class LogServiceImpl implements ILogService {

	@Autowired
	private LogMapper logMapper;
	@Override
	public boolean addLog(Log log) {
		logMapper.addLog(log);
		return true;
	}

	public int countForPager(Pager pager) {
		return logMapper.countForPager(pager);
	}
	
	public List<Log> findPagerByExample(Pager<Log> pager){
		return logMapper.findPagerByExample(pager);
	}

}
