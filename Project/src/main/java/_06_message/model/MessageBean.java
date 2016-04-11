package _06_message.model;
/* 陳姵吟 Carley Chen, 01-04-2016 */

public class MessageBean {
	private Integer mno;
	private Integer id;
	private Integer ano;
	private java.util.Date mtime;
	private String mcontext;
	public Object messageDAO;
	
	public MessageBean(){
		
	}
	
	@Override
	public String toString() {
		return "MessageBean [mno=" + mno + ", id=" + id + ", ano=" + ano
				+ ", mtime=" + mtime + ", mcontext=" + mcontext + "]";
	}
	
	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAno() {
		return ano;
	}
	public void setAno(Integer ano) {
		this.ano = ano;
	}
	public java.util.Date getMtime() {
		return mtime;
	}
	public void setMtime(java.util.Date mtime) {
		this.mtime = mtime;
	}
	public String getMcontext() {
		return mcontext;
	}
	public void setMcontext(String mcontext) {
		this.mcontext = mcontext;
	}
	
}
