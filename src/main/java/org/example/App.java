package org.example;


import org.example.pojo.User;
import org.example.mapper.UserMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class App {

    public static void main(String[] args) {
        ApplicationContext app = new ClassPathXmlApplicationContext("application.xml");
        UserMapper userMapper = (UserMapper) app.getBean(UserMapper.class);
        List<User> user = userMapper.findUser();
        System.out.println(user);
    }
}
