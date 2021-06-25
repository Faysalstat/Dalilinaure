/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.service;

import com.marriage.repository.FriendRepository;
import java.util.List;
import model.Friendlist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class FriendService {

    @Autowired
    FriendRepository friendRepository;

    public List<Friendlist> getList(Integer id) {
        return friendRepository.getList(id);
    }
    
    public List<Friendlist> getFriendRequestList(Integer id) {
        return friendRepository.getList(id);
    }

    public Friendlist requestfriendship(Friendlist Friendlist) {
        return friendRepository.requestfriendship(Friendlist);
    }
    
    public Friendlist acceptFriendship(Friendlist Friendlist) {
        
        
        return friendRepository.acceptFriendship(Friendlist);
    }
    public Friendlist rejectFriendship(Friendlist Friendlist) {
        return friendRepository.rejectFriendship(Friendlist);
    }

    public Friendlist getFriendship(Integer userid,Integer profileid){
        Friendlist friendlship = friendRepository.getFriendship(userid,profileid);
        return friendlship;
    }
}
