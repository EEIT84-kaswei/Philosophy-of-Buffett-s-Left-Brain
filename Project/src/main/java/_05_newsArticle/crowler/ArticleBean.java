package _05_newsArticle.crowler;

import java.io.Serializable;
/* 陳姵吟 Carley Chen, 01-04-2016 */

public class ArticleBean implements Serializable{
	private Integer ano;
	private String account;
	private String aname;
	private java.util.Date atime;
	private String atitle;
	private String acontext;
		
	@Override
	public String toString() {
		return "ArticleBean [ano=" + ano + ", account=" + account + ", aname="
				+ aname + ", atime=" + atime + ", atitle=" + atitle
				+ ", acontext=" + acontext + "]";
	}
	
	public Integer getAno() {
		return ano;
	}
	public void setAno(Integer ano) {
		this.ano = ano;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public java.util.Date getAtime() {
		return atime;
	}
	public void setAtime(java.util.Date atime) {
		this.atime = atime;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public String getAcontext() {
		return acontext;
	}
	public void setAcontext(String acontext) {
		this.acontext = acontext;
	}		
	
}
