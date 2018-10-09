package com.neuedu.crm.mapper;

import java.util.List;

import com.neuedu.crm.bean.Authority;
import com.neuedu.crm.bean.Pager;

public interface AuthorityMapper {
	public List<Authority> findAll();
	
	public Authority findById(Integer authorityId);
	
	public int editAuthority(Authority authority);
	
	public int addAuthority(Authority authority);
	
	public int deleteById(Integer authorityId);
	
	/**
	 * 测试多条件查询和模糊查询
	 * @param authority
	 * @return
	 */
	public List<Authority> findByExample(Authority authority);
	
	/**
	 * 批量查询
	 * @param authorityIdList
	 * @return
	 */
	public List<Authority> findByAuthorityIdList(List<Integer> authorityIdList);
	/**
	 * 批量删除
	 * @param authorityIdArray
	 */
    public void deleteByAuthorityIdList(String[] authorityIdArray);
    
    /**
     * 批量修改
     * @param authoritys
     */
    public void editAuthoritys(List<Authority> authoritys);
    
    /**
     * 批量新增
     * @param authoritys
     */
    public void addAuthoritys(List<Authority> authoritys);
    
    
    /**
     * 分页查询
     * @return
     */
	public List<Authority> findByPager(Pager pager);
	
	/**
	 * 与分页查询sql条件一致的统计查询
	 * 
	 * @param pager
	 * @return
	 */
	public int countForPager(Pager pager);
}