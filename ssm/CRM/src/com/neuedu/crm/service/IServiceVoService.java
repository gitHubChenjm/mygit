package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.ServiceVo;

public interface IServiceVoService {
	/**
	 * 分页 计数用的
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
	public List<ServiceVo> findPagerByExample(Pager<ServiceVo> pager);
}
