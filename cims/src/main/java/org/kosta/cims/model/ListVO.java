package org.kosta.cims.model;

import java.util.List;

/**
 * 리스트(list.jsp) 화면에서 보여줄 게시물 리스트를 저장하고<br>
 * 페이징 정보 객체를 저장하는 클래스
 * 
 * @author KOSTA-00-KANGSA
 *
 */
public class ListVO {
	private List<Object> list;
	private PagingBean pagingBean;
	private PagingBean2 pagingBean2;

	public ListVO() {
		super();
	}

	public PagingBean2 getPagingBean2() {
		return pagingBean2;
	}

	public void setPagingBean2(PagingBean2 pagingBean2) {
		this.pagingBean2 = pagingBean2;
	}

	public ListVO(List<Object> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public ListVO(List<Object> list, PagingBean2 pagingBean2) {
		super();
		this.list = list;
		this.pagingBean2 = pagingBean2;
	}

	public List<Object> getList() {
		return list;
	}

	public void setList(List<Object> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean
				+ ", pagingBean2=" + pagingBean2 + "]";
	}

}