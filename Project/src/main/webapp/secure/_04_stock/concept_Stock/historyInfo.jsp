<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>歷史資訊</title>
</head>
<body>

<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />



		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/highstock.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/exporting.js"></script>
		
		<script type="text/javascript">
		var priceData;
		var volumeData;
		
		function transferPrice(data){
			priceData=data
		}
		
		function transferVolume(data){
			volumeData=data;
		}
		
		$(document).ready(function () {
			
			var originalDrawPoints = Highcharts.seriesTypes.column.prototype.drawPoints;

		    Highcharts.seriesTypes.column.prototype.drawPoints = function () {
		        var merge  = Highcharts.merge,
		            series = this,
		            chart  = this.chart,
		            points = series.points,
		            i      = points.length;
		        
		        while (i--) {
		            var candlePoint = chart.series[0].points[i];
		            var color = (candlePoint.open < candlePoint.close) ? '#FF0000' : '#008000';
		            var seriesPointAttr = merge(series.pointAttr);
		            
		            seriesPointAttr[''].fill = color;
		            seriesPointAttr.hover.fill = Highcharts.Color(color).brighten(0.3).get();
		            seriesPointAttr.select.fill = color;
		            
		            points[i].pointAttr = seriesPointAttr;
		        }

		        originalDrawPoints.call(this);
		    }
			
			var contextPath="${pageContext.request.contextPath}";
			var sourceUrl=contextPath+"/secure/DailyStockServlet";
			
			var priceStr="stock_Code="+"${bean.stock_Code}"+"&type=price";
			var volumeStr="stock_Code="+"${bean.stock_Code}"+"&type=volume";
			
			$.ajax({
				method:"GET",
				url:sourceUrl,
				data:priceStr,
				cache:false,
				async:false,
				dataType:"json",
				success:transferPrice
			});
			
			$.ajax({
				method:"GET",
				url:sourceUrl,
				data:volumeStr,
				cache:false,
				async:false,
				dataType:"json",
				success:transferVolume
			});
						
			Highcharts.setOptions({
		        global: {
		            timezoneOffset: -8 * 60
		        },
		        lang:{
		        shortMonths:['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
		        weekdays:['星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六']
		        }
		    });
			
		    $('#historyChart').highcharts('StockChart',{
		      navigator:{
		      xAxis:{
		      dateTimeLabelFormats:{
		    	  		month:'%Y/%m',
		                day: '%b%e日'
		                }
		           }
		      },
		      
		      xAxis:{
		      dateTimeLabelFormats:{
		    	  		month: '%Y/%m',
						week:'%b%e日',
         			 	day: '%b%e日'
		            }
		      },
		      
		      yAxis: [{
		                labels: {
		                    align: 'left',
		                    x: 4
		                },
		                height: '60%',
		                lineWidth: 2
		            }, {
		                labels: {
		                    align: 'left',
		                    x: 4
		                },
		                top: '65%',
		                height: '35%',
		                offset: 0,
		                lineWidth: 2
		            }],
		      
		    	rangeSelector:{
		    		selected:1,
		    		inputDateFormat:'%Y年%b%e日'
		    	},
		    	
		    	title:{
		    		text:'${bean.stock_Code} ${bean.stock_Name}'
		    	},
		    	
		    	 plotOptions: {
		            candlestick: {
		            	color: 'green',
		                upColor: 'red',
		                lineColor: 'green',
		                upLineColor:'red',
		                tooltip:{
		                pointFormat:'<b>{series.name}</b><br/>' +
		                '開盤: {point.open}<br/>' +
		                '最高: {point.high}<br/>' +
		                '最低: {point.low}<br/>' +
		                '收盤: {point.close}<br/>'                
		                },
		    		dataGrouping: {
	                	dateTimeLabelFormats:{
	                	week:['周 %A, %b %e日, %Y'],
	                	day:['%A, %b%e日, %Y'],
	                	}
	            	},
		            },
		            
		            column:{
		            tooltip:{
		               pointFormat:'<span>{series.name}: {point.y}<br/>'
		            },
		            dataGrouping: {
		                dateTimeLabelFormats:{
		                    week:['%A, %b%e日, %Y'],
		                    day:['%A, %b%e日, %Y'],
		                    minute:['%A, %b%e日, %Y']
		                    }
		                }
		            }
		        },
		    	
		    	series:[{
		    		type:'candlestick',
		    		name:'${bean.stock_Code} ${bean.stock_Name}',
		    		data:priceData
		    	},{
		    		type:'column',
		    		name:'成交量',
		    		data:volumeData,
		              yAxis: 1              
		    	}
		    	]    	
		    });
		});		
		</script>
		
		<h2>股票歷史資訊：${bean.stock_Name}</h2>

		<div align=center
			style="border: 1px gray solid; height: 40em; width: 70%">
			<h4>歷史數據(走勢圖)</h4>
			
			<h4>即時數據</h4>
			<table style="border: 2px black solid; padding: 5px;" rules="all"
						cellpadding='5' align=center>
				<thead>
					<tr>
						<td><h4>券商重押>30%</h4></td>
						<td><h4>TOP券商買超>500張<br>超額買超>4倍</h4></td>
						<td><h4>短線籌碼集中<br>一日集中>20%</h4></td>
						<td><h4>外資連買>3天<br>買超>1000張</h4></td>
						<td><h4>投信連買>3天<br>買超>1000張</h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${index1}</td>
						<td>${index2}</td>
						<td>${index3}</td>
						<td>${index4}</td>
						<td>${index5}</td>
					</tr>
				</tbody>
				
				<tbody>
					<tr>
						<td>${stockTable}</td>
					
					</tr>				
				</tbody>
			</table><br>
			<div id="historyChart" style="width: 100%; height: 600px;"></div>
			<br>
			<table>
				<tbody>
					<tr></tr>
				
				
				</tbody>
			
			</table>
		</div>

</body>
</html>
