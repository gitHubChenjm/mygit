package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Sale;
import com.neuedu.crm.bean.SaleVo;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.mapper.SaleMapper;
import com.neuedu.crm.mapper.SaleVoMapper;
import com.neuedu.crm.service.ISaleService;

@Service
@Transactional
public class SaleServiceImpl implements ISaleService {

	@Autowired
	private SaleMapper saleMapper;
	
	@Autowired
	private SaleVoMapper saleVoMapper;
	
	@Override
	public int addSale(Sale sale) {
		
		return saleMapper.addSale(sale);
	}

	@Override
	public int deleteSaleByExample(Sale example) {
		
		return saleMapper.deleteById(example.getSaleId());
	}

	@Override
	public int deleteSaleByExamples(List<Sale> exampleList) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int modifyByExample(Sale example) {
		
		return saleMapper.editSale(example);
	}

	@Override
	public int changeDealUser(Sale sale) {
		
		int result = saleMapper.updateDealUser(sale);
		if (result == 1) {
			int result2 = saleMapper.updateStatus(sale);
			if (result2 == 1) {
				return 1;
			}
		}
		return 0;
	}

	@Override
	public List<Sale> findByExampleWithConf(Sale example) {
		
		return saleMapper.findByExample(example);
	}

	@Override
	public SaleVo findById(int saleId) {
		
		return saleVoMapper.findSaleVoById(saleId);
	}

	@Override
	public List<SaleVo> findAll() {
		
		return saleVoMapper.findAllSaleVo();
	}

	@Override
	public List<SaleVo> findByPagerWithCond(Pager<SaleVo> pager) {
		
		return saleVoMapper.findByPagerWithCond(pager);
	}

	@Override
	public int countForPagerWithCond(Pager<SaleVo> pager) {
		
		return saleVoMapper.countForPagerWithCond(pager);
	}

	@Override
	public List<User> findAllCustomerManager() {
		
		return saleVoMapper.findAllCustomerManager();
	}

	@Override
	public int deleteByIdList(int[] IdList) {
		
		return saleMapper.deleteByIdList(IdList);
	}

	@Override
	public int findRoleById(int userid) {
		
		return saleVoMapper.findRoleById(userid);
	}

	@Override
	public List<SaleVo> findByPagerWithCondAssign(Pager<SaleVo> pager) {
		
		return saleVoMapper.findByPagerWithCondAssign(pager);
	}

}

