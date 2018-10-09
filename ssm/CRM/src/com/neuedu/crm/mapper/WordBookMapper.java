package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.WordBook;

public interface WordBookMapper {
	
	public List<WordBook> findAll();
	
	public List<WordBook> findAllCategory();

	public WordBook findById(int id);
	
	public List<WordBook> findWordBookByCategory(Integer category);
	
	/**
	 * 查找一个分类的分类信息
	 * @param category
	 * @return
	 */
	public WordBook findOneCategory(int category);
	
	/**
	 * 多条件分页查找记录总数
	 * @param pager
	 * @return
	 */
	public int countForPagerWithCond(Pager<WordBook> pager);
	
	/**
	 * 多条件分页查询
	 * @param pager
	 * @return
	 */
	public List<WordBook> findByPagerWithCond(Pager<WordBook> pager);
	
	/**
	 * 新增基础数据
	 * @param wordBook
	 * @return
	 */
	public int insert(WordBook wordBook);
	
	/**
	 * 新增数据分类
	 * @param wordBook
	 * @return
	 */
	public int insertCategory(WordBook wordBook);

	public int deleteById(int id);
	
	/**
	 * 删除一条分类信息标记
	 * @param category
	 * @return
	 */
	public int deleteCategory(int category);
	
	/**
	 * 删除该分类信息标志下的所有数据
	 * @param category
	 * @return
	 */
	public int deleteByCategory(int category);
	
	/**
	 * 修改基础数据信息
	 * @param wordBook
	 * @return
	 */
	public int update(WordBook wordBook);
	
	/**
	 * 修改分类信息标志
	 * @param wordBook
	 * @return
	 */
	public int updateCategory(WordBook wordBook);
	
	/**
	 * 修改该分类下的所有数据的分类名称(条目)
	 * @param wordBook
	 * @return
	 */
	public int updateByCategory(WordBook wordBook);

	
	
	
	
}