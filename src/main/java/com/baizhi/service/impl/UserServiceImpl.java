package com.baizhi.service.impl;

import com.baizhi.dao.IUserDAO;
import com.baizhi.entities.User;
import com.baizhi.exceptions.UserNameAndPasswordException;
import com.baizhi.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDAO userDAO;

    @Override
    public void registUser(User user) {
        userDAO.registUser(user);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public User queryByName(String name) {
        User user = userDAO.queryByName(name);
        return user;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public User queryById(Integer id) {
        User user = userDAO.queryById(id);
        return user;
    }

    @Override
    public void deleteByIds(Integer[] ids) {
        for (int i = 0; i < ids.length; i++) {
            userDAO.deleteById(ids[i]);
        }
    }

    @Override
    public User updateUser(User user) {
        userDAO.updateUser(user);
        User user2 = userDAO.queryById(user.getId());
        return user2;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<User> queryByPage(Integer pageNow, Integer pageSize, String column, Object value) {
        List<User> users = userDAO.queryByPage(pageNow, pageSize, column, value);
        return users;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public User login(User user) {
        User user1 = userDAO.queryByName(user.getName());
        if (user1 == null) {
            throw new UserNameAndPasswordException("用户不存在");
        }
        if (!user1.getPassword().equals(user.getPassword())) {
            throw new UserNameAndPasswordException("密码错误--请重新输入");
        } else {
            return user1;
        }
    }
}
