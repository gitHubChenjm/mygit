package com.neuedu.crm.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.print.attribute.standard.RequestingUserName;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.WordBook;
import com.neuedu.crm.service.IWordBookService;

@Controller
@RequestMapping("/wordbook")
public class WordBookController {
	private Logger logger = Logger.getLogger(WordBookController.class);
	
	@Autowired
	private IWordBookService wordBookService;
	
	/**
	 * 多条件分页搜索
	 * @param pager
	 * @param wordBook
	 * @return
	 */
	@RequestMapping(value="/list",produces="application/json;charset=utf-8")
	@ResponseBody
	public String findList(Pager<WordBook> pager,WordBook wordBook) {
		
		logger.info(pager.toString());
		logger.info(wordBook.toString());
		pager.setParam(wordBook);
		List<WordBook> list = wordBookService.findListByPager(pager);
		for (WordBook wordBook2 : list) {
			logger.info(wordBook2.toString());
		}
		int page = pager.getCurrentPage();
		int total = pager.getTotal();
		int pages = pager.getPages();
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("page", page);
		map.put("pages", pages);
		map.put("total", total);
		return new Gson().toJson(map);
	}
	
	/**
	 * 查询所有数据分类
	 * @return
	 */
	@RequestMapping(value="/categorys",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getCategorys() {
		
		List<WordBook> list = wordBookService.findAllCategory();
		for (WordBook wordBook : list) {
			logger.info(wordBook);
		}
		return new Gson().toJson(list);
	}
	
	/**
	 * 新增一条基础数据
	 * @param wordBook
	 * @return
	 */
	@RequestMapping(value="/addData",produces="application/json;charset=utf-8")
	@ResponseBody
	public String addData(WordBook wordBook) {
		
		logger.info(wordBook);
		WordBook wordBook2 = wordBookService.findOneCategory(wordBook.getCategory());
		wordBook.setTitle(wordBook2.getTitle());
		wordBook.setEditable(wordBook2.getEditable());
		logger.info(wordBook2);
		logger.info(wordBook);
		int result = wordBookService.add(wordBook);
		if (result == 1) {
			return "{code:0}";
		}
		return "{code:1}";
	}
	
	/**
	 * 查询一条基础数据信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getData",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getById(int id) {
		
		logger.info(id);
		WordBook wordBook = wordBookService.findById(id);
		logger.info(wordBook);
		return new Gson().toJson(wordBook);
	}
	
	/**
	 * 查询一个分类的信息
	 * @param category
	 * @return
	 */
	@RequestMapping(value="/getCate",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getOneCategory(int category) {
		
		logger.info(category);
		WordBook wordBook = wordBookService.findOneCategory(category);
		logger.info(wordBook);
		return new Gson().toJson(wordBook);
	}
	
	/**
	 * 修改基础数据信息
	 * @param wordBook
	 * @return
	 */
	@RequestMapping(value="/editData",produces="application/json;charset=utf-8")
	@ResponseBody
	public String editData(WordBook wordBook) {
		
		logger.info(wordBook);
		if ("可编辑".equals(wordBook.getEditable())) {
			wordBook.setEditable("1");
		}else {
			wordBook.setEditable("0");
		}
		int result = wordBookService.edit(wordBook);
		if (result == 1) {
			return "{code:0}";
		}
		return "{code:1}";
	}
	
	/**
	 * 删除一行数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/deleteData",produces="application/json;charset=utf-8")
	@ResponseBody
	public String deleteData(int id) {
		
		logger.info(id);
		int result = 0;
		try {
			result = wordBookService.deleteById(id);
		} catch (Exception e) {
			logger.info("存在外键约束");
			result = 2;
		}
		if (result == 1) {
			return "{code:0}";
		}else if (result == 2) {
			return "{msg:'删除失败,该数据正在被其它数据引用'}";
		}
		return "{msg:'删除失败'}";
	}
	
	@RequestMapping(value="/addCate",produces="application/json;charset=utf-8")
	@ResponseBody
	public String addCategory(WordBook wordBook) {
		
		logger.info(wordBook);
		List<WordBook> list  = wordBookService.findAllCategory();
		Random random = new Random();
		int value = random.nextInt(65534)+1;
		//循环判断随机生成的分类编号是否与已存在的分类编号重复
		while(true) {
			int flag = 0;
			for (WordBook wordBook2 : list) {
				if (wordBook2.getValue().equals(value+"")) {
					flag = 1;
				}
			}
			if (flag == 1) {
				value = random.nextInt(65534)+1;
				continue;
			}else {
				wordBook.setValue(value+"");
				break;
			}
		}
		int result = wordBookService.addCategory(wordBook);
		if (result == 1) {
			return "{code:0}";
		}
		return "{msg:'新增分类失败!请重试'}";
	}
	
	@RequestMapping(value="/deleteCate",produces="application/json;charset=utf-8")
	@ResponseBody
	public String deleteCategory(int category) {
		
		logger.info(category);
		int result = wordBookService.deleteCategoryInfo(category);
		if (result == 1) {
			return "{code:0}";
		}else if (result == 2) {
			return "{msg:'删除失败!该数据正在被使用'}";
		}
		return "{msg:'删除失败!请重试'}";
	}
	
	@RequestMapping(value="/editCate",produces="application/json;charset=utf-8")
	@ResponseBody
	public String editCate(WordBook wordBook) {
		
		logger.info(wordBook);
		int result = wordBookService.updateCategoryInfo(wordBook);
		if (result == 1) {
			return "{code:0}";
		}
		return "{msg:'修改失败!请重试'}";
	}
	
	
	
	
	
	
	
	
	
	
	
}
