package com.cyf.bean;

public class Book {
	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookName=" + bookName + ", bookSprice=" + bookSprice + ", bookAuthor="
				+ bookAuthor + ", bookCount=" + bookCount + ", booktype=" + booktype + ", bookremark=" + bookremark
				+ ", img=" + img + "]";
	}

	private Integer bookId;  //���
    private String bookName;  //����
    private double bookSprice;  //�۸�
    private String bookAuthor;  //����
    private Integer bookCount;  //����
    private String booktype;//����
    private String bookremark;//���
	private String img;//ͼƬ
    
    public String getBooktype() {
		return booktype;
	}
    


	public void setBooktype(String booktype) {
		this.booktype = booktype;
	}

	public String getBookremark() {
		return bookremark;
	}

	public void setBookremark(String bookremark) {
		this.bookremark = bookremark;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public double getBookSprice() {
        return bookSprice;
    }

    public void setBookSprice(double bookSprice) {
        this.bookSprice = bookSprice;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public Integer getBookCount() {
        return bookCount;
    }

    public void setBookCount(Integer bookCount) {
        this.bookCount = bookCount;
    }

}
