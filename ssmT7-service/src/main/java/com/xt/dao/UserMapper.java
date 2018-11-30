package com.xt.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.xt.vo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User selectUser(HashMap<String, Object> obj);
    
    @Select("select * from tbuser")
    @Results({
    	@Result(id=true,column="user_id",property="userId"),
    	@Result(column="user_name",property="userName"),
    	@Result(column="nick_name",property="nickName"),
    	@Result(column="create_date",property="createDate"),
    	@Result(column="last_update_date",property="lastUpdateDate"),
    	@Result(column="user_pwd",property="userPwd"),
    })
	public List<User> selecAllUses();
}