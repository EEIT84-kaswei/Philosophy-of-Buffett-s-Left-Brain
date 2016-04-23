package _03_stock_market.model;

import java.math.BigDecimal;

/* 廖千慧 Lara Liao, 01-04-2016 */

public class TaiexBean {
	private java.sql.Timestamp tDateTime;
	private java.util.Date tDate;
	private String taiex_Code;
	private BigDecimal taiex;
	private BigDecimal taiex_Volume;
	
	@Override
	public String toString() {
		return "TaiexBean [tDateTime=" + tDateTime + ", tDate=" + tDate
				+ ", taiex_Code=" + taiex_Code + ", taiex=" + taiex
				+ ", taiex_Volume=" + taiex_Volume + "]";
	}
	
	public java.sql.Timestamp gettDateTime() {
		return tDateTime;
	}
	public void settDateTime(java.sql.Timestamp tDateTime) {
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
	public BigDecimal getTaiex() {
		return taiex;
	}
	public void setTaiex(BigDecimal taiex) {
		this.taiex = taiex;
	}
	public BigDecimal getTaiex_Volume() {
		return taiex_Volume;
	}
	public void setTaiex_Volume(BigDecimal taiex_Volume) {
		this.taiex_Volume = taiex_Volume;
	}

	@Override
	public int hashCode() {
		return tDateTime.hashCode() ^ tDate.hashCode() ^ taiex_Code.hashCode() ^ taiex.hashCode() ^ taiex_Volume.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if(obj!=null && obj instanceof TaiexBean){
			TaiexBean bean=(TaiexBean)obj;
			if(this.tDateTime.equals(bean.tDateTime)
					&& this.tDate.equals(bean.tDate)
					&& this.taiex_Code.equals(bean.taiex_Code)
					&& this.taiex.equals(bean.taiex)
					&& this.taiex_Volume.equals(bean.taiex_Volume)){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}

}
