/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.repository;

import java.util.ArrayList;
import java.util.List;
import model.Person;
import model.SearchModel;
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
public class PersonRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public Person saveAllPerson(Person person) {
        sessionFactory.getCurrentSession().save(person);
        System.out.println(person);
        return person;
    }

    public Person UpdatePerson(Person person) {
        sessionFactory.getCurrentSession().merge(person);
        System.out.println(person.getImage());
        return person;
    }

    public Person findbyid(Integer id) {
        String sql = "Select p from Person p where p.id= :id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Person> list = query.list();
        return list.get(0);
    }
    
    public List<Person> findbyImageapproval() {
        String sql = "Select p from Person p where p.imageapproval= 'false'";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        List<Person> list = query.list();
        return list;
    }
    
    public List<Person> findbyBioapproval() {
        String sql = "Select p from Person p where p.bioapproval= 'false'";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        List<Person> list = query.list();
        return list;
    }
    
    public Person findbybioapproval(Integer id) {
        String sql = "Select p from Person p where p.id= :id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Person> list = query.list();
        return list.get(0);
    }

    public List<Person> findbySex(String sex) {

        String sql = "Select p from Person p where p.sex= :sex";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        if (sex.equals("Male")) {
            query.setParameter("sex", "Female");
        } else {
            query.setParameter("sex", "Male");
        }

        List<Person> list = query.list();
        return list;
    }

    public Person findbyUserid(Integer id) {
        String sql = "Select p from Person p where p.user.id= :id";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Person> list = query.list();
        return list.get(0);
    }
    public Person findbyUserName(String name) {
        String sql = "Select p from Person p where p.user.username= :name";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("name",name);
        List<Person> list = query.list();
        return list.get(0);
    }

    public List<Person> findallexceptuser(Integer id) {
        String sql = "Select p from Person p WHERE NOT p.user.id= :id order by p.id desc";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        List<Person> list = query.list();
        return list;
    }

    public List<Person> customSearchList() {
        List<Person> list = new ArrayList();
        String sql = "Select p from Person p where p.user.id  :id";
        return list;
    }

    public List<Person> findbySexAndModel(String sex, SearchModel searchModel) {
        String sql = "Select p from Person p where p.sex= :sex and p.age >= :min and p.age <= :max and "
                + "p.education >= :education and p.physique= :physique and p.religion= :religion and p.height=:height";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        if (sex.equals("Male")) {
            query.setParameter("sex", "Female");
        } else {
            query.setParameter("sex", "Male");
        }
        query.setParameter("min",searchModel.getMinage());
        query.setParameter("max", searchModel.getMaxage());
        query.setParameter("education", searchModel.getEducation());
        query.setParameter("physique", searchModel.getPhysics());
        query.setParameter("height", searchModel.getHeight());
        query.setParameter("religion", searchModel.getReligion());

        List<Person> list = query.list();
        return list;
    }
}
