package com.cyf.servlet.user;

import com.cyf.bean.User;
import com.cyf.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/user/updateUser")
public class UpdateUserServlet  extends HttpServlet {


    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        //this.doPost(req, resp);
    	req.getRequestDispatcher("user-update.jsp").forward(req,resp);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("GB18030");
        int userId = Integer.parseInt(req.getParameter("userId"));
        String userName = req.getParameter("userName");
        String userPassword = req.getParameter("userPassword");
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        currentUser.setUserId((userId));
        currentUser.setUserName(userName);
        currentUser.setUserPassword(userPassword);
        UserDao userdao = new UserDao();
        boolean flag = userdao.updateUser(currentUser);
        if (flag == true){
        	session.setAttribute("message","�޸ĳɹ��������µ�¼");
            session.removeAttribute("currentUser");  //ɾ����ǰ�û�����
            resp.sendRedirect("http://localhost:8080/bookstore/login.jsp");
        }
        else {
            req.setAttribute("message","�޸�ʧ��");
            req.getRequestDispatcher("user-update.jsp").forward(req,resp);
        }
    }
}
