package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Log;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.ServiceVo;

public interface LogMapper {
	public boolean addLog(Log log);
	
	public int countForPager(Pager pager);
	
	public List<Log> findPagerByExample(Pager<Log> pager);
}
