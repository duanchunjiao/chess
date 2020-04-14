package com.cyf.servlet.user;

import com.cyf.bean.Book;
import com.cyf.bean.Cart;
import com.cyf.dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/user/addCart")
public class AddCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("GB18030");
        Integer bookId = Integer.parseInt(req.getParameter("bookId"));
        Integer number = Integer.parseInt(req.getParameter("number"));
        double totalPrice = 0;
        int numbersum=0;
        BookDao bookDao = new BookDao();
        Book book = bookDao.getBook(bookId);
        HttpSession session = req.getSession();
        List<Cart> cartList =(List<Cart>) session.getAttribute("cartList");  //��ȡsession��cartList���Ե�ֵ
        if (cartList == null) {  //���ﳵΪ��
            cartList = new ArrayList<>();
            Cart cart = new Cart();  //�½����ﳵ����
            cart.setBook(book);
            cart.setNumber(number);
            cartList.add(cart);
        } else {
            boolean flag = false;
            for (Cart temp : cartList) {  //����cartList
                if (temp.getBook().getBookId() == book.getBookId()) {
                    flag = true;
                    temp.setNumber(temp.getNumber() + number);  //���¹��ﳵ��ͬ��Ŀ���Ĺ�������
                }
            }
            if (!flag) {
                Cart cart = new Cart();  //�����ﳵ��û�е�ͼ��
                cart.setBook(book);
                cart.setNumber(number);
                cartList.add(cart);
            }
            for (Cart cart : cartList) {
                totalPrice += cart.getBook().getBookSprice() * cart.getNumber();  //���½���۸�
                numbersum += cart.getNumber();  //��������
            }
        }
        session.setAttribute("numbersum", numbersum);
        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("cartList", cartList);  //����session��cartList���Ե�ֵΪcartList
        resp.sendRedirect("http://localhost:8080/bookstore/index.jsp");  //�ض���
    }
}
