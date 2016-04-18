package _06_message.model;
public class MessageBean {
	private Integer mno;
	private String account;
	private Integer ano;
	private java.util.Date mtime;
	private String mcontext;
	@Override
	public String toString() {
		return "MessageBean [mno=" + mno + ", account=" + account + ", ano="
				+ ano + ", mtime=" + mtime + ", mcontext=" + mcontext + "]";
	}
	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
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
