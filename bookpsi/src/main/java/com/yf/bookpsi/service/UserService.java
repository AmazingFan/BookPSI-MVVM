package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.UserDAO;
import com.yf.bookpsi.pojo.Role;
import com.yf.bookpsi.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    UserDAO userDAO;
    @Autowired
    RoleService roleService;
    
    public User get(String userName, String password){
        return userDAO.getByUsernameAndPassword(userName,password);
    }

    public User findByUserName(String userName){
        return userDAO.findByUsername(userName);
    }

    public void addOrUpdate(User user){
        userDAO.save(user);
    }

    public List<User> list() {
        List<User> users =  userDAO.list();
        List<Role> roles;
        for (User user : users) {
            roles = roleService.listRolesByUser(user.getUsername());
            //user.setRoles(roles);
            user.setRoles(roles);
        }
        return users;
    }

    public void deleteById(int id){
        userDAO.deleteById((id));
    }
}
