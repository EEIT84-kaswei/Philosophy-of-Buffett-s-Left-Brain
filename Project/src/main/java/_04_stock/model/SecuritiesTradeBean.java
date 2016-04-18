package _04_stock.model;
import java.io.Serializable;
/* 黃胤凱 Kevin Huang, 06-04-2016 */

import java.util.Date;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;


public class SecuritiesTradeBean implements Serializable{	
	private Integer stock_Code;
	private String securities_Supplier;
	private Integer buy_Sheets;
	private	Integer sell_Sheets;
	private Integer b_s_sheets;
	private Date sDate;
	public Integer getStock_Code() {
		return stock_Code;
	}
	public void setStock_Code(Integer stock_Code) {
		this.stock_Code = stock_Code;
	}
	public String getSecurities_Supplier() {
		return securities_Supplier;
	}
	public void setSecurities_Supplier(String securities_Supplier) {
		this.securities_Supplier = securities_Supplier;
	}
	public Integer getBuy_Sheets() {
		return buy_Sheets;
	}
	public void setBuy_Sheets(Integer buy_Sheets) {
		this.buy_Sheets = buy_Sheets;
	}
	public Integer getSell_Sheets() {
		return sell_Sheets;
	}
	public void setSell_Sheets(Integer sell_Sheets) {
		this.sell_Sheets = sell_Sheets;
	}
	public Integer getB_s_sheets() {
		return b_s_sheets;
	}
	public void setB_s_sheets(Integer b_s_sheets) {
		this.b_s_sheets = b_s_sheets;
	}
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	@Override
	public String toString() {
		return "[" + stock_Code	+ ", " + securities_Supplier + ", " + buy_Sheets 
				+ ", " + sell_Sheets + ", " + b_s_sheets + ", " + sDate + "]";
	}
	public boolean equals(Object obj){
		if(obj == this){
		return true;
		}
		if(!(obj instanceof SecuritiesTradeBean)){		
		return false;
		}
		SecuritiesTradeBean bean = (SecuritiesTradeBean) obj;
		return new EqualsBuilder().append(this.stock_Code, bean.getStock_Code()).append(this.sDate, bean.getsDate()).append(this.securities_Supplier, bean.getSecurities_Supplier()).isEquals();
	}
	public int hashCode(){
		return new HashCodeBuilder().append(this.stock_Code).append(this.sDate).append(this.securities_Supplier).toHashCode();
	}
	
	
	
	
}
