package com.xt.api;

import java.util.HashMap;

import com.github.pagehelper.PageInfo;
import com.xt.vo.User;

public interface IUserMsg {

	User selectUser(HashMap<String,Object> map);
	
	PageInfo<User> selectAllUser(Integer pageNumber,Integer pageSize);
	
}
