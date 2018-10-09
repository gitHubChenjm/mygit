package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.WordBook;

public interface IWordBookService {
	
	/**
	 * 查询所有基础数据
	 * @return
	 */
	public List<WordBook> findAll();
	
	/**
	 * 查询所有数据分类
	 * @return
	 */
	public List<WordBook> findAllCategory();
	
	/**
	 * 根据数据编号查找
	 * @param id
	 * @return
	 */
	public WordBook findById(int id);

	/**
	 * 根据分类查找数据
	 * @param category
	 * @return
	 */
	public List<WordBook> findWordBookByCategory(Integer category);
	
	/**
	 * 查找一个分类的信息
	 * @param category
	 * @return
	 */
	public WordBook findOneCategory(int category);
	
	/**
	 * 多条件分页查询
	 * @param pager
	 * @return
	 */
	public List<WordBook> findListByPager(Pager<WordBook> pager);
	
	/**
	 * 新增数据
	 * @param wordBook
	 * @return
	 */
	public int add(WordBook wordBook);
	
	/**
	 * 新增分类信息
	 * @param wordBook
	 * @return
	 */
	public int addCategory(WordBook wordBook);

	/**
	 * 根据编号删除一条数据
	 * @param id
	 * @return
	 */
	public int deleteById(int id);
	
	/**
	 * 删除该数据分类下的所有数据
	 * @param category
	 * @return
	 */
	public int deleteCategoryInfo(int category);
	
	/**
	 * 修改一条基础数据
	 * @param wordBook
	 * @return
	 */
	public int edit(WordBook wordBook);
	
	/**
	 * 修改该分类下所有数据的分类名称(条目)
	 * @param wordBook
	 * @return
	 */
	public int updateCategoryInfo(WordBook wordBook);


}
