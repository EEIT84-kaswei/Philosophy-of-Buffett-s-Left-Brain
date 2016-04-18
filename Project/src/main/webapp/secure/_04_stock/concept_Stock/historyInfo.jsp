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
		var historyPriceData;
		var historyVolumeData;
		var instantPriceData;
		var instantVolumeData;
		
		function transferHistoryData(data){
			var price=[]
			var volume=[]
			for(i=0;i<data.length;i++){
				price.push([data[i][0],data[i][1],data[i][2],data[i][3],data[i][4]]);
				volume.push([data[i][0],data[i][5]]);
			}
			historyPriceData=price;
			historyVolumeData=volume;
		}
				
		function transferInstantData(data){
			var price=[]
			var volume=[]
			for(i=0;i<data.length;i++){
				price.push([data[i][0],data[i][1]]);
				volume.push([data[i][0],data[i][2]]);
			}
			instantPriceData=price;
			instantVolumeData=volume;
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
			var historySourceUrl=contextPath+"/secure/DailyStockServlet";			
			var historyQueryStr="stock_Code="+"${bean.stock_Code}";
			
			$.ajax({
				method:"GET",
				url:historySourceUrl,
				data:historyQueryStr,
				cache:false,
				async:false,
				dataType:"json",
				success:transferHistoryData
			});
					
			Highcharts.setOptions({
		        global: {
		            timezoneOffset: -8 * 60
		        },
		        lang:{
		        months:['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
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
		    		inputDateFormat:'%Y年%b%e日',
		    		buttons: [{
		    			type: 'month',
		    			count: 1,
		    			text: '1月'
		    		}, {
		    			type: 'month',
		    			count: 3,
		    			text: '3月'
		    		}, {
		    			type: 'month',
		    			count: 6,
		    			text: '6月'
		    		}, {
		    			type: 'ytd',
		    			text: '今年'
		    		}, {
		    			type: 'year',
		    			count: 1,
		    			text: '1年'
		    		}, {
		    			type: 'all',
		    			text: '全部'
		    		}]
		    	},
		    	
		    	title:{
		    		text:'${bean.stock_Code} ${bean.stock_Name} 技術分析'
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
		    			approximation: "ohlc",
		                enabled: true,
		                forced: true,
		                units: [['day',[1]]],
	                	dateTimeLabelFormats:{
	                	month: ['%Y年  %B'],
	                	week:['周 %A, %b %e日, %Y'],
	                	day:['%A, %b%e日, %Y'],
	                	}
	            	},
		            },
		            
		            column:{
		            tooltip:{
		               pointFormat:'<span>{series.name}: {point.y}</span><br/>'
		            },
		            dataGrouping: {
		            	approximation: "sum",
		                enabled: true,
		                forced: true,
		                units: [['day',[1]]],
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
		    		data:historyPriceData
		    	},{
		    		type:'column',
		    		name:'成交量',
		    		data:historyVolumeData,
		              yAxis: 1              
		    	}
		    	]    	
		    });
		    
		    var historyChart = $('#historyChart').highcharts();
		    
			$("#month").click(function(){
				historyChart.series[0].update({
	                dataGrouping: {
	                approximation: "ohlc",
	                enabled: true,
	                forced: true,
	                units: [['month',[1]]],
	                }
	            },false);
				
				historyChart.series[1].update({
	            	dataGrouping: {
	            	approximation: "sum",
	            	enabled: true,
	            	forced: true,
	            	units: [['month',[1]]],
	            	}           
				},false);
	      		
	      		historyChart.redraw();
			});		    
		    
			$("#week").click(function(){
				historyChart.series[0].update({
	                dataGrouping: {
	                approximation: "ohlc",
	                enabled: true,
	                forced: true,
	                units: [['week',[1]]],
	                }
	            },false);
				
				historyChart.series[1].update({
	            	dataGrouping: {
	            	approximation: "sum",
	            	enabled: true,
	            	forced: true,
	            	units: [['week',[1]]],
	            	}           
				},false);
	      		
	      		historyChart.redraw();
			});
			
			$("#day").click(function(){
				historyChart.series[0].update({
	                dataGrouping: {
	                approximation: "ohlc",
	                enabled: true,
	                forced: true,
	                units: [['day',[1]]],
	                }
	            },false);
				
				historyChart.series[1].update({
	            	dataGrouping: {
	            	approximation: "sum",
	            	enabled: true,
	            	forced: true,
	            	units: [['day',[1]]],
	            	}           
				},false);
	      		
	      		historyChart.redraw();
			});			
			
			var instantSourceUrl=contextPath+"/pages/InstantStockServlet";
			var instantQueryStr="stock_Code="+"${bean.stock_Code}";			
			
			$.ajax({
				method:"GET",
				url:instantSourceUrl,
				data:instantQueryStr,
				cache:false,
				async:false,
				dataType:"json",
				success:transferInstantData
			});
			
			$('#instantChart').highcharts('StockChart', {
				
		        chart : {
		            events : {
		                load : function () {
		                    var series = this.series[0];
		                    setInterval(function () {
		                    	$.ajax({
		            				method:"GET",
		            				url:instantSourceUrl,
		            				data:instantQueryStr,
		            				cache:false,
		            				async:true,
		            				dataType:"json",
		            				success:function(data){
		            					var price=[]
		            					var volume=[]
		            					for(i=0;i<data.length;i++){
		            						price.push([data[i][0],data[i][1]]);
		            						volume.push([data[i][0],data[i][2]]);
		            					}
		            					instantChart.series[0].setData(price);
		            					instantChart.series[1].setData(volume);
		            					instantChart.redraw();
		            				}		                    	
		            			});		                    	
		                    }, 60000);		                    
		                }
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
		        
		        rangeSelector: {
		        	enabled:false,
		            buttons: [{
		                count: 1,
		                type: 'minute',
		                text: '1分'
		            }, {
		                count: 5,
		                type: 'minute',
		                text: '5分'
		            }, {
		                type: 'all',
		                text: '全部'
		            }],
		            inputEnabled: false,
		        },

		        title : {
		            text : '${bean.stock_Code} ${bean.stock_Name} 即時走勢'
		        },

		        exporting: {
		            enabled: false
		        },
		        
		        plotOptions: {
		            line: {		            	
		                tooltip:{
		                	pointFormat:'<span>{series.name}: {point.y:.2f}</span><br/>',           
		                },
		                dataGrouping: {
			                approximation: "average",
			                enabled: true,
			                forced: true,
			                units: [['minute',[1]]]                
			                },
		            },
		            column:{
				        tooltip:{
				           pointFormat:'<span>{series.name}: {point.y}</span><br/>'
				        },
				        dataGrouping: {
			                approximation: "sum",
			                enabled: true,
			                forced: true,
			                units: [['minute',[1]]]                
			                }				            
				    }	                
	           	},

		        series : [{
		        	type : 'line',
		            name : '${bean.stock_Code} ${bean.stock_Name}',
		            data : instantPriceData		            
		        },{
		    		type:'column',
		    		name:'成交量',
		    		data:instantVolumeData,
		            yAxis: 1		            
		    	}]
		    });			
			
			var instantChart = $('#instantChart').highcharts();
			
		});		
		</script>
		
		<h2>股票歷史資訊：${bean.stock_Name}</h2>

		<div align=center
			style="border: 1px gray solid; height: 40em; width: 70%">
			
			
			<h4>即時數據</h4>
			<div id="instantChart" style="width: 100%; height: 400px;"></div>
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
			<input id="month" type="button" value="月K" style="float:right;">
			<input id="week" type="button" value="周K" style="float:right;">
			<input id="day" type="button" value="日K" style="float:right;">
			<h4>歷史數據(走勢圖)</h4>
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
