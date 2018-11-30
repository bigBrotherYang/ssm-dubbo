<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="static/dist/bootstrap-table.css">

<script src="static/jquery-3.2.1.min.js"></script>
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="static/dist/bootstrap-table.js" ></script>
<script src="static/dist/locale/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
	$(function(){
		$('#table').bootstrapTable({
	         url: 'pageInfo',
	         method: 'get',                      //请求方式（*）
	            //toolbar: '#toolbar',                //工具按钮用哪个容器
	            contentType: "application/x-www-form-urlencoded",
	            striped: true,                      //是否显示行间隔色
	            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	            pagination: true,                   //是否显示分页（*）
	           	queryParams:queryParam,//传递参数（*）
	            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
	            pageNumber: 1,                       //初始化加载第一页，默认第一页
	            pageSize: 10,                       //每页的记录行数（*）
	            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
	            showRefresh: true,                  //是否显示刷新按钮
	            clickToSelect: true,                //是否启用点击选中行
	            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	            uniqueId: "userId",                     //每一行的唯一标识，一般为主键列
	            responseHandler: responseHandler,
	         columns: [{
	 			checkbox:"true",
				field : "box"
			},{
	           field: 'userName',
	           title: '用户名'
	           }, {
	           field: 'nickName',
	           title: '昵称'
	           }, {
	           field: 'createDate',
	           title: '创建时间'
	           },{
	           field: 'lastUpdateDate',
	           title: '修改时间'
	           },{
	           field: 'userPwd',
	           title: '密码'
	           },{field: 'tool',title: '操作', align: 'center',
	               formatter:function(value,row,index){
	                   var element = 
	                   "<a class='edit'  href='javascript:editTest("+row.userId+")'   >编辑</a> "+ 
	                   "<a class='delet' javascript:delTest("+row.userId+")'>删除</a> ";
	                   return element;  
	               } 
	            },]
	       });
		
		function queryParam(params){
	    	var param = {
	    			limit : this.limit, // 页面大小
	    	        offset : this.offset, // 页码
	    	        pageNumber : this.pageNumber,
	    	        pageSize : this.pageSize
	    	};
	    	return param;
	    }
		function responseHandler(res) { 
		    if (res) {
		        return {
		            "rows" : res.result.list,
		            "total" : res.result.total
		        };
		    } else {
		        return {
		            "rows" : [],
		            "total" : 0
		        };
		    }
		}
	})
		
	function editTest(id){
		alert(id);
	}
	function addUser(){
		 var param = $("#addform").serializeArray();
		 $.ajax({
			 url:"addUser",
			 type:"post",
			 dataType:"json",
			 data:param,
			 success:function(data){
				 if(data.status==200){
					 $("#table").bootstrapTable('refresh');
					 $("#addModal").modal('hide');
					 alert("添加成功")
				 }
			 }
		 })
	}
	
	function editModal(){
		
		//获取选中行的数据
		var rows = $("#table").bootstrapTable('getSelections');
		if(rows.length>1){
			alert("选中一行修改数据");
			return;
		}
		var v = rows[0];
		$("#eid").val(v.userId);
		$("#euserName").val(v.userName);
		$("#enickName").val(v.nickName);
		$("#ecreateDate").val(v.createDate);
		$("#elastDate").val(v.lastUpdateDate);
		$("#euserpwd").val(v.userPwd);
		$("#updModal").modal("show");
	}
	function updateUser(){
		 var param = $("#updform").serializeArray();
		 $.ajax({
			 url:"updateUser",
			 type:"post",
			 dataType:"json",
			 data:param,
			 success:function(data){
				 if(data.status==200){
					 $("#table").bootstrapTable('refresh');
					 $("#updModal").modal('hide');
					 alert("修改成功")
				 }
			 }
		 })
	}
</script>
</head>
<body>
<div class="modal fade" id="addModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加用户</h4>
      </div>
      <div class="modal-body">
      	<form  id="addform">
         	 用户 	<input type="text" id="userName" name="userName"><br>
           	昵称 <input type="text" id="nickName" name="nickName"><br>
           	创建时间	<input type="text" id="createDate" name="createDate"><br>
           修改时间<input type="text" id="lastDate" name="lastUpdateDate"><br>
          密码 	<input type="text" id="userpwd" name="userPwd"><br>
      	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" onclick="addUser()" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<!-- 修改 -->
	
	<div class="modal fade" id="updModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改用户</h4>
      </div>
      <div class="modal-body">
      	<form  id="updform">
         	 <input type="hidden" id="eid" name="userId"><br>
         	 用户 	<input type="text" id="euserName" name="userName"><br>
           	昵称 <input type="text" id="enickName" name="nickName"><br>
           	创建时间	<input type="text" id="ecreateDate" name="createDate"><br>
           修改时间<input type="text" id="elastDate" name="lastUpdateDate"><br>
          密码 	<input type="text" id="euserpwd" name="userPwd"><br>
      	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" onclick="updateUser()" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
	
	
   <div class="container">
   <div class="container">
		<button class="btn btn-default" id="addUser" data-toggle="modal" data-target="#addModal" type="button">add</button>
		<button class="btn btn-default" id="updUser" onclick="editModal()" type="button">Button</button>
		<button class="btn btn-default" id="del" type="button">Button</button>
	</div>
   		<table id="table"></table>
   </div>
</body>
</html>