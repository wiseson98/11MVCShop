package com.model2.mvc.service.domain;

public class Board {
	
	///Field
	private int boardNo;
	private String writer;
	private String title;
	private String content;
	private String image;
	
	///Constructor
	public Board() {
	}

	///Method
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", image=" + image + "]";
	}

}//end of class