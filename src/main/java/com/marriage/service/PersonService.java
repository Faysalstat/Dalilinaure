/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.service;

import com.marriage.repository.PersonRepository;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;
import model.Person;
import model.SearchModel;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class PersonService {

    @Autowired
    PersonRepository personRepository;

    public Person saveAllPerson(Person person) {
        return personRepository.saveAllPerson(person);
    }

    public Person UpdatePerson(Person person) {
        return personRepository.UpdatePerson(person);
    }

    public Person findbyid(Integer id) {
        return personRepository.findbyid(id);
    }

    public List<Person> findbySex(String sex) {
        return personRepository.findbySex(sex);
    }

    public List<Person> findbyImageapproval() {
        return personRepository.findbyImageapproval();
    }

    public List<Person> findbyBioapproval() {
        return personRepository.findbyBioapproval();
    }

    public Person findbyUserid(Integer id) {
        return personRepository.findbyUserid(id);
    }

    public List<Person> findlatest(Integer id) {

//        have to fetch only latest users
        return personRepository.findallexceptuser(id);
    }

    public Person findbyUserName(String name) {
        return personRepository.findbyUserName(name);
    }

    public int calculateAge(String date) {
        String[] spliteddate = date.split("-");
        LocalDate now = LocalDate.now();
        int birthyear = Integer.parseInt(spliteddate[0]);
        int thisyear = now.getYear();
        return (thisyear - birthyear);
    }

    public List<Person> findbySexAndModel(String sex, SearchModel searchModel) {
        return personRepository.findbySexAndModel(sex, searchModel);

    }

}
