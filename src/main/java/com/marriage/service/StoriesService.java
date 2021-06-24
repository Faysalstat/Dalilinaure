/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.service;

import com.marriage.repository.StoriesRepository;
import java.util.List;
import model.Stories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class StoriesService {
    
    
    @Autowired
    private StoriesRepository storiesRepository;
    
    public String saveStory(Stories story) {
        return storiesRepository.saveStory(story);
    }
    public String UpdateStory(Stories story) {
        return storiesRepository.UpdateStory(story);
    }
    
    public Stories getStoryById(Integer id) {
    return storiesRepository.getStoryById(id);
    }
    
    public List<Stories> getAll() {
     return storiesRepository.getAll();
    }
}
