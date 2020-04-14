package com.cyf.servlet;

import com.cyf.bean.User;
import com.cyf.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        this.doPost(req, resp);
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("GB18030");
        String userName = req.getParameter("userName");  //��ȡ�����û���
        String userPassword = req.getParameter("userPassword");  //��ȡ��������
        int userType = Integer.parseInt(req.getParameter("userType"));  //��Stringת��Ϊint
        UserDao userDao = new UserDao();
        User user = userDao.login(userName, userPassword);  //��¼��֤
        if (user == null) {  //δע������˺Ż��������
            req.setAttribute("message", "�˺Ż������������������");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);  //ת��
        } else {
            if (userType == 0) {
                if (user.getUserLevelId() == 0) {
                    HttpSession session = req.getSession();
                    session.setAttribute("currentUser", user);  //�ѵ�ǰ�û����session,1.������ 2.��ӡ����ǰ�û�
                    resp.sendRedirect("admin/OrderAdminServlet");
//                    req.getRequestDispatcher("/admin/manage.jsp").forward(req, resp);
                } else {
                	  req.setAttribute("message", "��ʹ�ù���ԱȨ�޵�¼");  //�ѵ�ǰ�û����session,1.������ 2.��ӡ����ǰ�û�
                      req.getRequestDispatcher("login.jsp").forward(req, resp);
                    return;
                }
            }
            if (userType == 1) {
                if (user.getUserLevelId() == 1){
                    HttpSession session = req.getSession();
                    session.setAttribute("currentUser", user);  //�ѵ�ǰ�û����session
                    resp.sendRedirect("index.jsp");
//                    req.getRequestDispatcher("index.jsp").forward(req, resp);
                }else {
                	  req.setAttribute("message", "��ʹ���û�Ȩ�޵�¼");  //�ѵ�ǰ�û����session,1.������ 2.��ӡ����ǰ�û�
                      req.getRequestDispatcher("login.jsp").forward(req, resp);
                    return;
                }
            }
        }
    }
}