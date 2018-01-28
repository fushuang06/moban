package com.ssm.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.GoodsMapper;
import com.ssm.entity.Goods;
import com.ssm.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public ArrayList<Goods> selectAll() {
		return goodsMapper.selectAll();
	}

	@Override
	public Goods selectById(Goods goods) {
		return goodsMapper.selectById(goods);
	}

	@Override
	public int Save(Goods goods) {
		return goodsMapper.save(goods);
	}
	
}
