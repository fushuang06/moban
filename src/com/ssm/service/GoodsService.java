package com.ssm.service;

import java.util.ArrayList;

import com.ssm.entity.Goods;

public interface GoodsService {
	ArrayList<Goods> selectAll();
	Goods selectById(Goods goods);
	int Save(Goods goods);
}
