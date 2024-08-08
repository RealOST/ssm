package org.example.mapper;

import org.apache.ibatis.annotations.*;
import org.example.pojo.User;

import java.util.List;

@Mapper
public interface UserMapper {
    @Select("select *from ssm.user  ")
    List<User> findUser();
    @Update("update ssm.user set name=#{name},age=#{age},sex=#{sex} where id=#{id}")
    void update(User user);
    @Delete("delete from ssm.user where id=#{id}")
    void delete(int id);
    @Insert("INSERT INTO ssm.user(name, age, sex) VALUES(#{name}, #{age}, #{sex})")
    void insert(User user);
    @Select("select *from ssm.user where id=#{id} ")
    User findById(int id);
}
