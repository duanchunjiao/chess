package com.cyf.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cyf.bean.User;

import java.io.IOException;

//ִ��˳�����ȳ�ʼ��init(),Ȼ��doFilter���������destroy()
public class UserFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("==================================����ʼ���û���������");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");  //��ȡ��ǰ�û�
        if (currentUser != null && currentUser.getUserLevelId() == 1) {  //���currentUser�ж��Ƿ��¼���Ƿ�Ϊ�û�
            filterChain.doFilter(servletRequest, servletResponse);  //�û��ѵ�¼�������
        } else {
            response.sendRedirect("/bookstore/login.jsp");  //δ��¼����û��Ȩ�޽��в���
        }
    }

    @Override
    public void destroy() {
        System.out.println("==================================�������û���������");
    }
}
