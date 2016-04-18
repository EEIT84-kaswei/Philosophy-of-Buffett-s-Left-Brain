package rest.restfulService.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.io.Serializable;
import java.math.BigDecimal;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="instantStockOne")
public class InstantStockOneBean implements Serializable{
	
		
	
	private String stock_TypeCode;
	private String concept_Stock;
	private Integer stock_Code;
	private String stock_Name;
	private BigDecimal purchase_Price;
	private BigDecimal selling_Price;
	private BigDecimal final_price;
	private BigDecimal change_Amount;
	private BigDecimal change_extent;
	private Integer acc_Trade_Volume;
	
	public InstantStockOneBean(){
		
	}
	
	@Override
	public String toString() {
		return "InstantStockOneBean [stock_TypeCode=" + stock_TypeCode + ", concept_Stock=" + concept_Stock
				+ ", stock_Code=" + stock_Code + ", stock_Name=" + stock_Name + ", purchase_Price=" + purchase_Price
				+ ", selling_Price=" + selling_Price + ", final_price=" + final_price + ", change_Amount="
				+ change_Amount + ", change_extent=" + change_extent + ", acc_Trade_Volume=" + acc_Trade_Volume + "]";
	}

	public String getStock_TypeCode() {
		return stock_TypeCode;
	}

	public void setStock_TypeCode(String stock_TypeCode) {
		this.stock_TypeCode = stock_TypeCode;
	}
	
	public String getConcept_Stock() {
		return concept_Stock;
	}


	public void setConcept_Stock(String concept_Stock) {
		this.concept_Stock = concept_Stock;
	}


	public Integer getStock_Code() {
		return stock_Code;
	}

	public void setStock_Code(Integer stock_Code) {
		this.stock_Code = stock_Code;
	}
	
	public String getStock_Name() {
		return stock_Name;
	}

	public void setStock_Name(String stock_Name) {
		this.stock_Name = stock_Name;
	}

	public BigDecimal getPurchase_Price() {
		return purchase_Price;
	}

	public void setPurchase_Price(BigDecimal purchase_Price) {
		this.purchase_Price = purchase_Price;
	}

	public BigDecimal getSelling_Price() {
		return selling_Price;
	}

	public void setSelling_Price(BigDecimal selling_Price) {
		this.selling_Price = selling_Price;
	}

	public BigDecimal getFinal_price() {
		return final_price;
	}

	public void setFinal_price(BigDecimal final_price) {
		this.final_price = final_price;
	}

	public BigDecimal getChange_Amount() {
		return change_Amount;
	}

	public void setChange_Amount(BigDecimal change_Amount) {
		this.change_Amount = change_Amount;
	}

	public BigDecimal getChange_extent() {
		return change_extent;
	}

	public void setChange_extent(BigDecimal change_extent) {
		this.change_extent = change_extent;
	}


	
	public Integer getAcc_Trade_Volume() {
		return acc_Trade_Volume;
	}

	public void setAcc_Trade_Volume(Integer acc_Trade_Volume) {
		this.acc_Trade_Volume = acc_Trade_Volume;
	}

	
	
}
