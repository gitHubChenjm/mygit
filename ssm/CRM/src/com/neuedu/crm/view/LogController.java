package com.neuedu.crm.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.neuedu.crm.bean.Log;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.ServiceVo;
import com.neuedu.crm.service.ILogService;

@Controller
@RequestMapping("/log")
public class LogController {
	@Autowired
	private ILogService logService;
	
	@RequestMapping("/listLog")
	@ResponseBody
	public String listLog(Model model,Log log,Integer pageNo,Integer pageSize) {
		if(pageNo == null) {
			pageNo = 1;
		}
		if(pageSize == null) {
			pageSize = 1;
		}
		
		//分页的页码和大小
		Pager pager = new Pager(pageNo, pageSize);
		
		
		//设置页面的example
		pager.setParam(log);

		//获取sql语句的总数
		Integer total = logService.countForPager(pager);
		
		pager.setTotal(total);
		
		//执行查询
		List<Log> list = logService.findPagerByExample(pager);
		
		model.addAttribute("pager", pager);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("list", list);
		
		return new Gson().toJson(map);
		
	}
}
