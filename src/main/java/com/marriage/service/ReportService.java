/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.service;

import com.marriage.repository.ReportRepository;
import java.util.List;
import model.Reported;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Faysal
 */
@Service
public class ReportService {

    @Autowired
    private ReportRepository reportRepository;

    public String saveReport(Reported reported) {
        reported.setChecked(0);
        return reportRepository.saveReport(reported);
    }

    public String UpdateReport(Reported reported) {
        return reportRepository.UpdateReport(reported);
    }

    public List<Reported> findbyAll() {
        return reportRepository.findbyAll();
    }

    public List<Reported> findbyuncheck() {
        return reportRepository.findbyuncheck();
    }

    public Reported findbyid(Integer id) {
        return reportRepository.findbyid(id);
    }
}
