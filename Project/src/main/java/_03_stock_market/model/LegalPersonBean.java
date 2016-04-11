package _03_stock_market.model;
/* 陳姵吟 Carley Chen, 01-04-2016 */

public class LegalPersonBean {
	private java.util.Date ldate;
	private Integer FCBuy_Count;
	private Integer FCSale_Count;
	private Integer ITBuy_Count;
	private Integer ITSale_Count;
	private Integer SFBuy_Count;
	private Integer SFSale_Count;
	
	@Override
	public String toString() {
		return "LegalPersonBean [ldate=" + ldate + ", FCBuy_Count="
				+ FCBuy_Count + ", FCSale_Count=" + FCSale_Count
				+ ", ITBuy_Count=" + ITBuy_Count + ", ITSale_Count="
				+ ITSale_Count + ", SFBuy_Count=" + SFBuy_Count
				+ ", SFSale_Count=" + SFSale_Count + "]";
	}
	
	public java.util.Date getLdate() {
		return ldate;
	}
	public void setLdate(java.util.Date ldate) {
		this.ldate = ldate;
	}
	public Integer getFCBuy_Count() {
		return FCBuy_Count;
	}
	public void setFCBuy_Count(Integer fCBuy_Count) {
		FCBuy_Count = fCBuy_Count;
	}
	public Integer getFCSale_Count() {
		return FCSale_Count;
	}
	public void setFCSale_Count(Integer fCSale_Count) {
		FCSale_Count = fCSale_Count;
	}
	public Integer getITBuy_Count() {
		return ITBuy_Count;
	}
	public void setITBuy_Count(Integer iTBuy_Count) {
		ITBuy_Count = iTBuy_Count;
	}
	public Integer getITSale_Count() {
		return ITSale_Count;
	}
	public void setITSale_Count(Integer iTSale_Count) {
		ITSale_Count = iTSale_Count;
	}
	public Integer getSFBuy_Count() {
		return SFBuy_Count;
	}
	public void setSFBuy_Count(Integer sFBuy_Count) {
		SFBuy_Count = sFBuy_Count;
	}
	public Integer getSFSale_Count() {
		return SFSale_Count;
	}
	public void setSFSale_Count(Integer sFSale_Count) {
		SFSale_Count = sFSale_Count;
	}
	
}
