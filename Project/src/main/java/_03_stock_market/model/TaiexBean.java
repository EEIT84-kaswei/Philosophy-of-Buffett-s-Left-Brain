package _03_stock_market.model;
/* 廖千慧 Lara Liao, 01-04-2016 */

public class TaiexBean {
	private java.util.Date tDateTime;
	private java.util.Date tDate;
	private String taiex_Code;
	private Double taiex;
	
	@Override
	public String toString() {
		return "TaiexBean [tDateTime=" + tDateTime + ", tDate=" + tDate
				+ ", taiex_Code=" + taiex_Code + ", taiex=" + taiex + "]";
	}
	public java.util.Date gettDateTime() {
		return tDateTime;
	}
	public void settDateTime(java.util.Date tDateTime) {
		this.tDateTime = tDateTime;
	}
	public java.util.Date gettDate() {
		return tDate;
	}
	public void settDate(java.util.Date tDate) {
		this.tDate = tDate;
	}
	public String getTaiex_Code() {
		return taiex_Code;
	}
	public void setTaiex_Code(String taiex_Code) {
		this.taiex_Code = taiex_Code;
	}
	public Double getTaiex() {
		return taiex;
	}
	public void setTaiex(Double taiex) {
		this.taiex = taiex;
	}
	
}
