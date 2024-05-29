package com.example.wb.service;

import com.example.wb.dao.UserDao;
import com.example.wb.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserDao userDao;

    public boolean isExist(String username){
        User user= getByName(username);
        return null!=user;
    }
    public User getByName(String username){
        return userDao.findByUsername(username);
    }
    public User get(String username, String password){
        return userDao.getByUsernameAndPassword(username, password);
    }

    public User register(User user) {
        return userDao.save(user);
    }

}
