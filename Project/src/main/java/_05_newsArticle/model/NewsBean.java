package _05_newsArticle.model;

public class NewsBean {
	private Integer nno;
	private java.util.Date ntime;
	private String ntitle;
	private String ncontext;
	
	@Override
	public String toString() {
		return "NewsBean [nno=" + nno + ", ntime=" + ntime + ", ntitle="
				+ ntitle + ", ncontext=" + ncontext + "]";
	}
	
	public Integer getNno() {
		return nno;
	}
	public void setNno(Integer nno) {
		this.nno = nno;
	}
	public java.util.Date getNtime() {
		return ntime;
	}
	public void setNtime(java.util.Date ntime) {
		this.ntime = ntime;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontext() {
		return ncontext;
	}
	public void setNcontext(String ncontext) {
		this.ncontext = ncontext;
	}
	
}
