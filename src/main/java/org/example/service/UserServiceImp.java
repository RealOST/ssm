package org.example.service;

import org.example.pojo.User;
import org.example.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImp implements UserService{
    @Autowired
    UserMapper userMapper;
    @Override
    public List<User> findAllUsers() {
        List<User> users = userMapper.findUser();
        return users;
    }

    @Override
    public void edit(User user) {
        userMapper.update(user);
    }

    @Override
    public void add(User user) {
userMapper.insert(user);
    }

    @Override
    public void delete(int id) {
userMapper.delete(id);
    }

    @Override
    public User findById(int id) {
        User user = userMapper.findById(id);
        return user;
    }
}
