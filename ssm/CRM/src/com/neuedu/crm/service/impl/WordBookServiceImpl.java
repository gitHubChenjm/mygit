package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.WordBook;
import com.neuedu.crm.mapper.WordbookMapper;
import com.neuedu.crm.service.IWordBookService;

@Service
@Transactional
public class WordBookServiceImpl implements IWordBookService {

	@Autowired
	private WordbookMapper wordBookMapper;
	
	
	public List<WordBook> findByCategory(Integer category) {
		
		return wordBookMapper.findWordBookByCategory(category);
	}

}
