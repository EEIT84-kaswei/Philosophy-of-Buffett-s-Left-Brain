package _04_stock.model;
/* 張碩文 Peter Chang, 01-04-2016 */

import java.io.Serializable;
import java.math.BigDecimal;

public class DailyStockBean implements Serializable{
	private Integer stock_Code;
	private java.util.Date trading_Date;
	private BigDecimal opening_Price;
	private BigDecimal highest_Price;
	private BigDecimal lowest_Price;
	private BigDecimal closing_Price;
	private BigDecimal change_Amount;
	private BigDecimal change_Extent;
	private Integer trade_Volume;	
			
	@Override
	public String toString() {
		return "DailyStockBean [stock_Code=" + stock_Code + ", trading_Date="
				+ trading_Date + ", opening_Price=" + opening_Price
				+ ", highest_Price=" + highest_Price + ", lowest_Price="
				+ lowest_Price + ", closing_Price=" + closing_Price
				+ ", change_Amount=" + change_Amount + ", change_Extent="
				+ change_Extent + ", trade_Volume=" + trade_Volume + "]";
	}
	
	
	
	public Integer getStock_Code() {
		return stock_Code;
	}



	public void setStock_Code(Integer stock_Code) {
		this.stock_Code = stock_Code;
	}



	public java.util.Date getTrading_Date() {
		return trading_Date;
	}



	public void setTrading_Date(java.util.Date trading_Date) {
		this.trading_Date = trading_Date;
	}



	public BigDecimal getOpening_Price() {
		return opening_Price;
	}



	public void setOpening_Price(BigDecimal opening_Price) {
		this.opening_Price = opening_Price;
	}



	public BigDecimal getHighest_Price() {
		return highest_Price;
	}



	public void setHighest_Price(BigDecimal highest_Price) {
		this.highest_Price = highest_Price;
	}



	public BigDecimal getLowest_Price() {
		return lowest_Price;
	}



	public void setLowest_Price(BigDecimal lowest_Price) {
		this.lowest_Price = lowest_Price;
	}



	public BigDecimal getClosing_Price() {
		return closing_Price;
	}



	public void setClosing_Price(BigDecimal closing_Price) {
		this.closing_Price = closing_Price;
	}



	public BigDecimal getChange_Amount() {
		return change_Amount;
	}



	public void setChange_Amount(BigDecimal change_Amount) {
		this.change_Amount = change_Amount;
	}



	public BigDecimal getChange_Extent() {
		return change_Extent;
	}



	public void setChange_Extent(BigDecimal change_Extent) {
		this.change_Extent = change_Extent;
	}



	public Integer getTrade_Volume() {
		return trade_Volume;
	}



	public void setTrade_Volume(Integer trade_Volume) {
		this.trade_Volume = trade_Volume;
	}



	@Override
	public int hashCode() {
		return stock_Code ^ trading_Date.hashCode();		
	}
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && obj instanceof DailyStockBean){
			DailyStockBean bean=(DailyStockBean)obj;
			if(this.stock_Code==bean.stock_Code
					&& this.trading_Date.equals(bean)){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	
	
}
