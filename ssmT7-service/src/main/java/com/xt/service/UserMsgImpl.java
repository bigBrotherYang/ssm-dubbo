package com.xt.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xt.api.IUserMsg;
import com.xt.dao.UserMapper;
import com.xt.vo.User;

@Service
public class UserMsgImpl implements IUserMsg {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User selectUser(HashMap<String, Object> map) {
		 
		return userMapper.selectUser(map);
	}

	@Override
	public PageInfo<User> selectAllUser(Integer pageNumber,Integer pageSize) {
		 PageHelper.startPage(pageNumber, pageSize);
		 PageInfo<User> p = new PageInfo<>(userMapper.selecAllUses());
		return p;
	}

	 

}
