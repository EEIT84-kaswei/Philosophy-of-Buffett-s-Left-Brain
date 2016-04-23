package _03_stock_market.model;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.util.Date;
import java.util.List;

import _03_stock_market.model.LegalPersonBean;

public interface LegalPersonDAO {

	public abstract List<LegalPersonBean> select();

	public abstract LegalPersonBean insert(LegalPersonBean bean);

	public abstract LegalPersonBean update(LegalPersonBean bean);

	LegalPersonBean selectByDateCode(Integer stock_Code, Date ldate);

	boolean delete(Integer stock_Code, Date ldate);

}