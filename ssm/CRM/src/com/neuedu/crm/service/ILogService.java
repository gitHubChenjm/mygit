package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Log;
import com.neuedu.crm.bean.Pager;

public interface ILogService {
	public boolean addLog(Log log);
	
	public int countForPager(Pager pager);
	
	public List<Log> findPagerByExample(Pager<Log> pager);
}
