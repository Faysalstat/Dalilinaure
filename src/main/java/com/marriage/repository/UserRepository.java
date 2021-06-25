/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.repository;

import java.util.ArrayList;
import java.util.List;
import model.User;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Faysal
 */
@Repository
@Transactional
public class UserRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public User saveUser(User user) {
        sessionFactory.getCurrentSession().save(user);
        return user;
    }

    public User updateUser(User user) {
        sessionFactory.getCurrentSession().merge(user);
        System.out.println(user);
        return user;
    }

    public User findbyUsername(String username) {
        String sql = "Select u from User u where u.username= :username";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("username", username);
        List<User> list = query.list();
        return list.get(0);
    }

    public User findByEmailIdIgnoreCase(String email) {
        String sql = "Select u from User u where u.email= :email";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("email", email);
        List<User> list = query.list();
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }
    public User findByEmailIdAndUserNameIgnoreCase(String email,String username) {
        String sql = "Select u from User u where u.email= :email and u.username = :username";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("email", email);
        query.setParameter("username", username);
        List<User> list = query.list();
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    public String checkUsername(String username) {
        String sql = "Select u from User u where u.username= :username";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("username", username);
        List<User> list = query.list();
        if (list.size() == 0) {
            return "{\"status\":\"Username is good!\"}";
        }
        return "{\"status\":\"Username Exists\"}";
    }

}
