/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.service;

import com.marriage.repository.UserRepository;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public User saveUser(User user) {
        user.setStatus("pending");
        user.setSubtype("trial");
        user.setDojoin(today());
        return userRepository.saveUser(user);
    }
    public User updateUser(User user) {
        return userRepository.updateUser(user);
    }
    
    public String checkUsername(String username) {
    return userRepository.checkUsername(username);
    }
    
     public User findbyUsername(String username) {
        return userRepository.findbyUsername(username);
     }
  
     public User findByEmailIdIgnoreCase(String email) {
      return userRepository.findByEmailIdIgnoreCase(email);
     }
     public User findByEmailIdAndUserNameIgnoreCase(String email,String username) {
         return userRepository.findByEmailIdAndUserNameIgnoreCase(email,username);
     }
     
     private Date today() {
        DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
        Date dateobj = new Date();
        return dateobj;
    }
    
}
