package com.ssm.dao;

import java.util.ArrayList;

import com.ssm.entity.Goods;

public interface GoodsMapper {
	ArrayList<Goods> selectAll();
	Goods selectById(Goods goods);
	int save(Goods goods);
}
