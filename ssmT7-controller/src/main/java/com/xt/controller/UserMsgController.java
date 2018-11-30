package com.xt.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.xt.api.IUserMsg;
import com.xt.common.JsonObject;
import com.xt.vo.User;

@Controller
public class UserMsgController {

	@Autowired
	private IUserMsg iUserMsg;
	
	@RequestMapping("login")
	public String getLogin(String userName,String userPwd,HttpSession session) {
		HashMap< String, Object> map = new HashMap<>();
		map.put("userName", userName);
		map.put("userPwd", userPwd);
		User user =	iUserMsg.selectUser(map);
		if(user!=null) {
			session.setAttribute("user", user);
			return "main";
		}else 
			return "redirect:login.jsp";
	}
	
	@ResponseBody
	@RequestMapping("pageInfo")
	public JsonObject<PageInfo<User>> userPage(Integer pageNumber,Integer pageSize) {
		JsonObject<PageInfo<User>> json = new JsonObject<PageInfo<User>>("OK", 200, iUserMsg.selectAllUser(pageNumber, pageSize))  ;
		return json;
	}
	
}
