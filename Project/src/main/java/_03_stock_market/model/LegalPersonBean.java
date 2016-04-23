package _03_stock_market.model;
/* 廖千慧, 07-04-2016 */

import java.io.Serializable;

public class LegalPersonBean  implements Serializable{
	
	private java.util.Date ldate;
	private Integer stock_Code;
	private Integer FC_Trade_Count;
	private Integer IT_Trade_Count;
	private Integer SD_Trade_Count;
	private Integer Trade_Total;
	
	
	
	
	@Override
	public String toString() {
		return "[" + ldate + "," + stock_Code + "," + FC_Trade_Count
				+ "," + IT_Trade_Count + "," + SD_Trade_Count + ","
				+ Trade_Total + "]";
	}
	public java.util.Date getLdate() {
		return ldate;
	}
	public void setLdate(java.util.Date ldate) {
		this.ldate = ldate;
	}
	public Integer getStock_Code() {
		return stock_Code;
	}
	public void setStock_Code(Integer stock_Code) {
		this.stock_Code = stock_Code;
	}
	public Integer getFC_Trade_Count() {
		return FC_Trade_Count;
	}
	public void setFC_Trade_Count(Integer fC_Trade_Count) {
		FC_Trade_Count = fC_Trade_Count;
	}
	public Integer getIT_Trade_Count() {
		return IT_Trade_Count;
	}
	public void setIT_Trade_Count(Integer iT_Trade_Count) {
		IT_Trade_Count = iT_Trade_Count;
	}
	public Integer getSD_Trade_Count() {
		return SD_Trade_Count;
	}
	public void setSD_Trade_Count(Integer sD_Trade_Count) {
		SD_Trade_Count = sD_Trade_Count;
	}
	public Integer getTrade_Total() {
		return Trade_Total;
	}
	public void setTrade_Total(Integer trade_Total) {
		Trade_Total = trade_Total;
	}
	@Override
	public int hashCode() {
		return  stock_Code ^ ldate.hashCode();
	}
	@Override
	public boolean equals(Object obj) {

		if(obj!=null && obj instanceof LegalPersonBean){
			LegalPersonBean bean = (LegalPersonBean)obj;
			if(this.ldate==bean.ldate && this.stock_Code.equals(bean)){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	

	
}
