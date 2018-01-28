<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<input type="button" id="selectAll" onclick="selectAll(1,4)" value="查看所有商品"/>

<form>
	<input type="text" id="gi" name="goodsId"/>
	<input type="button" value="根据id查询" onclick="selectById()">
</form>

<form>
	Id:<input type="text" name="goodsId" id="gd"><br>
	Name:<input type="text" name="goodsName" id="gn"><br>
	Price:<input type="text" name="goodsPrice" id="gp"><br>
	<input type="button" value="添加" onclick="save()">
</form>

<table>
	<thead>
		<tr>
			<td>goodsId</td>
			<td>goodsName</td>
			<td>goodsPrice</td>
		</tr>
	</thead>
	<tbody></tbody>
</table>

<div id="box"></div>
	<a href="#" onclick="toPrePage()">上一頁</a>
	<a href="#" onclick="toNextPage()">下一頁</a>
	
<script src="js/jquery-3.2.1.min.js"></script>
<script>
	var pageGoods="";
	function selectAll(page,per){
		var sel = $("#selectAll");
		$.ajax({
			"url":"selectAll?page="+page+"&per="+per,
			"type":"post",
			"success":function(data){
				pageGoods = data.pageGoods;
				var goods = pageGoods.list;
					$("tbody").empty();
				$.each(goods,function(i,e){
					var $_tr = $("<tr></tr>");
					var $_td1 = $("<td id='goodsId'></td>");
					$_td1.html(e.goodsId);
					var $_td2 = $("<td id='goodsName'></td>");
					$_td2.html(e.goodsName);
					var $_td3 = $("<td id='goodsPrice'></td>");
					$_td3.html(e.goodsPrice);
					$_tr.append($_td1).append($_td2).append($_td3);
					
					$("tbody").append($_tr); 
				});
			}
		});
	}
	function toPrePage(){
		if(pageGoods.hasPreviousPage==true){
			selectAll(pageGoods.prePage,4);
		}
	}
	function toNextPage(){
		if(pageGoods.hasNextPage==true){
			selectAll(pageGoods.nextPage,4);
		}
	}
	
	function selectById(){
		var goodsId = $("#gi");
		var goodsIdValue = goodsId.val();
		alert(goodsId);
		alert(goodsId.val());
		$.ajax({
			"url":"selectById",
			"type":"post",
			"data":{goodsId:goodsIdValue},
			"success":function(data){
				$("#box").empty();
				$("#box").html(data.goodsId+","+data.goodsName+","+data.goodsPrice);
			}
		})
	}
	
	function save(){
		var goodsId = $("#gd");
		var goodsName = $("#gn");
		var goodsPrice = $("#gp");
		
		$.ajax({
			"url":"save",
			"type":"post",
			"data":{
				goodsId:goodsId.val(),
				goodsName:goodsName.val(),
				goodsPrice:goodsPrice.val()
			},
			"success":function(data){
				$("box").empty();
				$("#box").html("插入成功");
			}
		})
	}
</script>
</body>
</html>