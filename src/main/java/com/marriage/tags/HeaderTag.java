/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marriage.tags;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

/**
 *
 * @author Faysal
 */
public class HeaderTag extends RequestContextAwareTag {

    private static final long serialVersionUID = 1L;

    @Override
    public void doFinally() {
        JspWriter out = pageContext.getOut();
        try {
            String jspPage = "tags/header.jsp";
            HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
            request.getRequestDispatcher(jspPage);
            pageContext.include(jspPage);
        } catch (Exception e) {
            try {
                out.print(e.getMessage());
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }

    @Override
    protected int doStartTagInternal() throws Exception {
        return 0;
    }

}