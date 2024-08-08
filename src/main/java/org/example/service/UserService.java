package org.example.service;

import org.example.pojo.User;

import java.util.List;

public interface UserService {
    List<User>findAllUsers();
    void edit(User user);
    void add(User user);
    void delete(int id);

    User findById(int id);
}
