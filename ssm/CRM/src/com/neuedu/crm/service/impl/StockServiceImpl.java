package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Stock;
import com.neuedu.crm.mapper.StockMapper;
import com.neuedu.crm.service.IStockService;

@Service
@Transactional // 事务管理
public class StockServiceImpl implements IStockService {
	
	@Autowired
	private StockMapper stockMapper;

	@Override
	public List<Stock> findAll() {
		// TODO Auto-generated method stub
		return stockMapper.findAll();
	}

	@Override
	public Stock findById(Integer stockId) {
		// TODO Auto-generated method stub
		return stockMapper.findById(stockId);
	}

	@Override
	public int editStock(Stock stock) {
		// TODO Auto-generated method stub
		return stockMapper.editStock(stock);
	}

	@Override
	public int addStock(Stock stock) {
		// TODO Auto-generated method stub
		return stockMapper.addStock(stock);
	}

	@Override
	public int deleteById(Integer stockId) {
		// TODO Auto-generated method stub
		return stockMapper.deleteById(stockId);
	}

	@Override
	public List<Stock> findByPager(Pager pager) {
		// TODO Auto-generated method stub
		return stockMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		// TODO Auto-generated method stub
		return stockMapper.countForPager(pager);
	}

	@Override
	public List<Stock> findByExample(Stock Stock) {
		// TODO Auto-generated method stub
		return stockMapper.findByExample(Stock);
	}

}
