/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.repository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Transactionlog;
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
public class TransactionRepository {
    @Autowired
    private SessionFactory sessionFactory;
    
    public String saveTransaction(Transactionlog transaction){
        
        transaction.setDatelog(today());
        sessionFactory.getCurrentSession().save(transaction);
        return "Success";
        
    }
    
    private Date today() {
        DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
        Date dateobj = new Date();
        return dateobj;
    }
}
