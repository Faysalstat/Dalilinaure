/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.service;

import com.marriage.repository.ConfirmationTokenRepository;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import model.Passwordresettoken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class ConfirmationTokenService {

    @Autowired
    ConfirmationTokenRepository confirmationTokenRepository;

    public Passwordresettoken saveToken(Passwordresettoken passwordresettoken) {
        passwordresettoken.setToken(UUID.randomUUID().toString());
        passwordresettoken.setExpiryDate(today());
        return confirmationTokenRepository.saveToken(passwordresettoken);
    }

    public Passwordresettoken findByConfirmationToken(String token) {
        return confirmationTokenRepository.findByConfirmationToken(token);
    }
    private Date today() {
        DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
        Date dateobj = new Date();
        return dateobj;
    }

}
