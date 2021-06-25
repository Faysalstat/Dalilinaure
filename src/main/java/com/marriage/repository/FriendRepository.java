/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.repository;

import java.util.ArrayList;
import java.util.List;
import model.Friendlist;
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
public class FriendRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public List<Friendlist> getList(Integer id) {
         List<Friendlist> list = new ArrayList();
        try {
            String sql = "select f from Friendlist f where f.personByFriendId1.id= :id ";
            Query query = sessionFactory.getCurrentSession().createQuery(sql);
            query.setParameter("id", id);
            list = query.list();
        } catch (Exception e) {
          
        }

        return list;
    }

    public List<Friendlist> getFriendRequestList(Integer id) {
        String sql = "select f from Friendlist f where f.personByFriendId1.id= :id and f.status='pending' ";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Friendlist> list = query.list();
        return list;
    }

    public Friendlist requestfriendship(Friendlist Friendlist) {
        sessionFactory.getCurrentSession().save(Friendlist);
        System.out.println(Friendlist);
        return Friendlist;
    }

    public Friendlist acceptFriendship(Friendlist Friendlist) {
        sessionFactory.getCurrentSession().merge(Friendlist);
        System.out.println(Friendlist);
        return Friendlist;
    }

    public Friendlist rejectFriendship(Friendlist Friendlist) {
        sessionFactory.getCurrentSession().delete(Friendlist);
        System.out.println(Friendlist);
        return Friendlist;
    }

    public Friendlist getFriendship(Integer uid, Integer pid) {
        Friendlist friendship = new Friendlist();
        String sql = "select f from Friendlist f where "
                + "f.personByFriendId1.id= :uid and f.personByFriendId2.id= :pid ";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("uid", uid);
        query.setParameter("pid", pid);
        List<Friendlist> list = query.list();
        if (list.size() == 0) {
            friendship.setStatus("notfriend");
        } else {
            friendship = list.get(0);
        }
        return friendship;
    }
}
