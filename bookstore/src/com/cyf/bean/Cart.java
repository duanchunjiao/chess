package com.cyf.bean;

public class Cart {
	 	@Override
	public String toString() {
		return "Cart [book=" + book + ", number=" + number + "]";
	}

		private Book book;  //��
	    private Integer number; // ��������
	    public Book getBook() {
	        return book;
	    }

	    public void setBook(Book book) {
	        this.book = book;
	    }

	    public Integer getNumber() {
	        return number;
	    }

	    public void setNumber(Integer number) {
	        this.number = number;
	    }

}
