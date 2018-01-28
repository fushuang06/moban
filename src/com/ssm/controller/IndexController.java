package com.ssm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Goods;
import com.ssm.service.GoodsService;

@Controller
public class IndexController {
	@Autowired
	private GoodsService goodsServiceImpl;
	
	@RequestMapping("/selectAll")
	public @ResponseBody Map selectAll(HttpServletResponse resp ,
			@RequestParam(required=true,defaultValue="1")int page,
			@RequestParam(required=false,defaultValue="3")int per) {
		resp.setContentType("application/json;charset=utf-8");
		PageHelper.startPage(page,per);
		ArrayList<Goods> goodss = goodsServiceImpl.selectAll();
		PageInfo<Goods> pageGoods = new PageInfo<Goods>(goodss);
		System.out.println(pageGoods);
		System.out.println(goodss);
		Map map = new HashMap();
		map.put("pageGoods", pageGoods);
		if(goodss!=null && pageGoods!=null) {
			return map;
		}
		return null;
	}
	
	@RequestMapping("/selectById")
	public @ResponseBody Goods selectById(HttpServletResponse resp,Goods goods) {
		resp.setContentType("application/json;charset=utf-8");
		Goods goodss = goodsServiceImpl.selectById(goods);
		if(goodss!=null) {
			return goodss;
		}
		return null;
	}
	
	@RequestMapping("/save")
	public @ResponseBody int save(HttpServletResponse resp,Goods goods) {
		resp.setContentType("applecation/json;charset=utf-8");
		int row = goodsServiceImpl.Save(goods);
		if(row==1) {
			return row;
		}
		return 0;
	}
}
