<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
   
  <link rel="stylesheet" href="static/ui/dist/css/AdminLTE.min.css">
 
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<title>Insert title here</title>
</head>
<body  class="hold-transition login-page">

<div class="login-box">
  <div class="login-logo">
    <a href="#"><b>Admin</b>LTE</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>
    <form action="login" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="userName" placeholder="账号">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="userPwd" placeholder="密码">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
            <!--  -->
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">登入</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <!-- /.social-auth-links -->
    <a href="#">忘记密码</a><br>
    <a href="#" class="text-center">注册</a>
  </div>
  <!-- /.login-box-body -->
</div>
	<!-- <form action="login" method="post">
		<input type="text" name="userName">
		<input type="text" name="userPwd">
		<input type="submit">
	</form> -->
</body>
<!-- jQuery 2.2.3 -->
<script src="static/jquery-3.2.1.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</html>