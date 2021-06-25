/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.repository;

import java.util.List;
import model.Passwordresettoken;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Faysal
 */
@Repository
@Transactional
public class ConfirmationTokenRepository {
    @Autowired
    private SessionFactory sessionFactory;

    public Passwordresettoken saveToken(Passwordresettoken passwordresettoken) {
        sessionFactory.getCurrentSession().save(passwordresettoken);
        return passwordresettoken;
    }

    public Passwordresettoken findByConfirmationToken(String token) {
        String sql = "select t from Passwordresettoken t where t.token= :token";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("token", token);
        List<Passwordresettoken> list = query.list();
//        passwordresettoken
        return list.get(0);
    }
}
