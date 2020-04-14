package com.cyf.bean;

import java.util.List;

public class Page {

	//��ǰ�ڼ�ҳ
	private int pageNo;
	
	//��ǰҳ�� List
	private List<Book> list;
	
	//ÿҳ��ʾ��������¼
	private int pageSize = 8;
	
	//���ж�������¼
	private long totalItemNumber;

	//����������Ҫ�� pageNo ���г�ʼ��
	public Page(int pageNo) {
		super();
		this.pageNo = pageNo;
	}
	
	//У��ҳ���Ƿ�Ϸ�
	public int getPageNo() {
		if(pageNo < 0)
			pageNo = 1;
		
		if(pageNo > getTotalPageNumber()){
			pageNo = getTotalPageNumber();
		}
		
		return pageNo;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setList(List<Book> list) {
		this.list = list;
	}
	
	public List<Book> getList() {
		return list;
	}
	
	//��ȡ��ҳ��
	public int getTotalPageNumber(){
		
		int totalPageNumber = (int)totalItemNumber / pageSize;
		
		if(totalItemNumber % pageSize != 0){
			totalPageNumber++;
		}
		
		return totalPageNumber;
	}
	
	public void setTotalItemNumber(long totalItemNumber) {
		this.totalItemNumber = totalItemNumber;
	}
	
	public long getStartRow() {
		return (pageNo-1)*pageSize+1;
	}
	
	public long getEndRow() {
		
		return pageNo==getTotalPageNumber()? totalItemNumber : pageNo*pageSize;
	}
	
	public long getTotalItemNumber() {
		return totalItemNumber;
	}

	public boolean isHasNext(){
		if(getPageNo() < getTotalPageNumber()){
			return true;
		}
		
		return false;
	}
	
	public boolean isHasPrev(){
		if(getPageNo() > 1){
			return true;
		}
		
		return false;
	}
	
	public int getPrevPage(){
		if(isHasPrev()){
			return getPageNo() - 1;
		}
		
		return getPageNo();
	}
	
	public int getNextPage(){
		if(isHasNext()){
			return getPageNo() + 1;
		}
		
		return getPageNo();
	}

	@Override
	public String toString() {
		return "Page [pageNo=" + pageNo + ", list=" + list + ", pageSize=" + pageSize + ", totalItemNumber="
				+ totalItemNumber + "]";
	}
}