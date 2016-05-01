		var historyAllData=[];
		var historyPriceData=[];
		var historyVolumeData=[];
		var historyAmountData=[];
		var historyExtentData=[];
		var historyMA20Data=[];
		var historyMA60Data=[];
		var historyMA240Data=[];
		var historyKData=[];
		var historyDData=[];
		var instantPriceData=[];
		var instantVolumeData=[];
		var taiexPriceData=[];
		var taiexVolumeData=[];
		
		function transferTaiexData(data){
			for(i=0;i<data.length;i++){
				taiexPriceData.push([data[i][0],data[i][1]]);
				taiexVolumeData.push([data[i][0],data[i][2]]);
			}
		}	
				
		function transferInstantData(data){
			for(i=0;i<data.length;i++){
				instantPriceData.push([data[i][0],data[i][1]]);
				instantVolumeData.push([data[i][0],data[i][2]]);
			}
		}
		
		function transferHistoryData(data){
			historyAllData=data;
			var dataLength=data.length;
			for(i=0;i<dataLength;i++){
				historyPriceData.push([data[i][0],data[i][1],data[i][2],data[i][3],data[i][4]]);
				historyVolumeData.push([data[i][0],data[i][7]]);
				
				if(i>=19){
					historyMA20Data.push([data[i][0],data[i][8]]);
				}
				
				if(i>=59){
					historyMA60Data.push([data[i][0],data[i][9]]);
				}
				
				if(i>=239){
					historyMA240Data.push([data[i][0],data[i][10]]);
				}
				
				historyKData.push([data[i][0],data[i][11]]);
				historyDData.push([data[i][0],data[i][12]]);
			}
		}
				
		$(document).ready(function () {				
					
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
						
			
			var taiexSourceUrl=contextPath+"/pages/TaiexServlet";
			var taiexQueryStr="code=taiex";			
			
			$.ajax({
				method:"GET",
				url:taiexSourceUrl,
				data:taiexQueryStr,
				cache:false,
				async:false,
				dataType:"json",
				success:transferTaiexData
			});
			
			$('#weightedIndexChart').highcharts('StockChart', {
				
		        chart : {
		            events : {
		                load : function () {
		                    var series = this.series[0];
		                    setInterval(function () {
		                    	$.ajax({
		            				method:"GET",
		            				url:taiexSourceUrl,
		            				data:taiexQueryStr,
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
		            					weightedIndexChart.series[0].setData(price,false);
		            					weightedIndexChart.series[1].setData(volume,false);
		            					weightedIndexChart.redraw();
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
		        },

		        title : {
		            text : '加權指數'
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
		                	enabled: false,
			                },
		            },
		            area:{
				        tooltip:{
				           	pointFormat:'<span>{series.name}: {point.y:.2f}億</span><br/>'
				        },
				        dataGrouping: {
				        	enabled: false
			                }				            
				    }	                
	           	},

		        series : [{
		        	type : 'line',
		            name : '加權指數',
		            data : taiexPriceData		            
		        },{
		    		type: 'area',
		    		color: '#f5b537',
		    		name: '成交金額',
		    		data: taiexVolumeData,
		            yAxis: 1
		    	}]
		    });
			
			var weightedIndexChart = $('#weightedIndexChart').highcharts();
			
			
			var instantSourceUrl=contextPath+"/pages/InstantStockServlet";
			var instantQueryStr="stock_Code="+stock_Code;			
			
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
		            					instantChart.series[0].setData(price,false);
		            					instantChart.series[1].setData(volume,false);
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
		        },

		        title : {
		            text : stock_Code+' '+stock_Name+' 即時走勢'
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
		            name : stock_Code+' '+stock_Name,
		            data : instantPriceData		            
		        },{
		    		type:'column',
		    		name:'成交量',
		    		color:'#008000',
		    		data:instantVolumeData,
		            yAxis: 1		            
		    	}]
		    });			
			
			var instantChart = $('#instantChart').highcharts();
			
			
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
		    
			var historySourceUrl=contextPath+"/secure/DailyStockServlet";			
			var historyQueryStr="stock_Code="+stock_Code;	
			
			$.ajax({
				method:"GET",
				url:historySourceUrl,
				data:historyQueryStr,
				cache:false,
				async:false,
				dataType:"json",
				success:transferHistoryData
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
			                top: '62%',
			                height: '18%',
			                offset: 0,
			                lineWidth: 2
			            },{
			                labels: {
			                    align: 'left',
			                    x: 4
			                },
			                top: '82%',
			                height: '18%',
			                offset: 0,
			                lineWidth: 2,
			                max:100,
			                min:0,
			                tickInterval:50
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
			    		text:stock_Code+' '+stock_Name+' 技術分析'
			    	},
			    	
			    	tooltip:{
			    		formatter:function(){
			    			var amount;
			    			var extent;
			    			for(var i=0;i<historyAllData.length;i++){
			    				if(this.x==historyAllData[i][0]){
			    					amount=historyAllData[i][5];
			    					extent=historyAllData[i][6];
			    				}
			    			}
			    			
			    			var tip=Highcharts.dateFormat('<span>%A, %b%e日, %Y</span><br/>',this.x);
			    			tip+='開盤: '+this.points[0].point.open+'<br/>';
			    			tip+='最高: '+this.points[0].point.high+'<br/>';
			    			tip+='最低: '+this.points[0].point.low+'<br/>';
			    			tip+='收盤: '+this.points[0].point.close+'<br/>';
			    			if(typeof amount=='number'){
			    				if(amount>0){
			    					tip+='<span>'+'漲跌金額'+': '+'<span style="color:red;">'+amount+'</span></span><br/>';
			    				}else if(amount<0){
			    					tip+='<span>'+'漲跌金額'+': '+'<span style="color:green;">'+amount+'</span></span><br/>';
			    				}else{
			    					tip+='<span>'+'漲跌金額'+': '+amount+'</span><br/>';
			    				}
			    			}else{
			    				tip+='<span>'+'漲跌金額'+': '+amount+'</span><br/>';
			    			}			    			
			    			if(typeof extent=='number'){
			    				if(extent>0){
			    					tip+='<span>'+'漲跌幅度'+': '+'<span style="color:red;">'+extent+'%</span></span><br/>';
			    				}else if(extent<0){
			    					tip+='<span>'+'漲跌幅度'+': '+'<span style="color:green;">'+extent+'%</span></span><br/>';
			    				}else{
			    					tip+='<span>'+'漲跌幅度'+': '+extent+'%</span><br/>';
			    				}
			    			}else{
			    				tip+='<span>'+'漲跌幅度'+': '+extent+'</span><br/>';
			    			}
			    			tip+='<span>'+this.points[1].series.name+': '+this.points[1].point.y+'</span><br/>';			    			
			    			if(this.points[4]==undefined){
			    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y+'<br/>';
			    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y+'<br/>';
			    			}else if(this.points[5]==undefined){
			    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y+'<br/>';
			    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y+'<br/>';
			    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y+'<br/>';
			    			}else if(this.points[6]==undefined){
			    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y+'<br/>';
			    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y+'<br/>';
			    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y+'<br/>';
			    				tip+='<span style="color:'+this.points[5].point.color+'">\u25CF</span> '+this.points[5].series.name+': '+this.points[5].point.y+'<br/>';
			    			}else{
			    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y+'<br/>';
			    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y+'<br/>';
			    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y+'<br/>';
			    				tip+='<span style="color:'+this.points[5].point.color+'">\u25CF</span> '+this.points[5].series.name+': '+this.points[5].point.y+'<br/>';
			    				tip+='<span style="color:'+this.points[6].point.color+'">\u25CF</span> '+this.points[6].series.name+': '+this.points[6].point.y+'<br/>';
			    			}
			    			return tip;
			    		}
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
			                    week:['周 %A, %b %e日, %Y'],
			                    day:['%A, %b%e日, %Y'],
			                    minute:['%A, %b%e日, %Y']
			                    }
			                }
			            },
			            
			            spline: {		            	
			                tooltip:{
			                	pointFormat:' <span style="color:{point.color}">\u25CF</span> {series.name}: {point.y:.2f}<br/>',           
			                },
			                dataGrouping: {
				                approximation: "average",
				                enabled: true,
				                forced: true,
				                units: [['day',[1]]]                
				                },
			            },
			            
			            line: {		            	
			                tooltip:{
			                	pointFormat:' <span style="color:{point.color}">\u25CF</span> {series.name}: {point.y:.2f}<br/>',           
			                },
			                dataGrouping: {
				                approximation: "average",
				                enabled: true,
				                forced: true,
				                units: [['day',[1]]]                
				                },
			            }
			        },
			    	
			    	series:[{
			    		type:'candlestick',
			    		name:stock_Code+' '+stock_Name,
			    		data:historyPriceData
			    	},{
			    		type:'column',
			    		name:'成交量',
			    		data:historyVolumeData,
			              yAxis: 1              
			    	},{
			    		type:'spline',
			    		color:'#f24385',
			    		name:'MA20',
			    		data:historyMA20Data
			    	},{
			    		type:'spline',
			    		color:'#57b846',
			    		name:'MA60',
			    		data:historyMA60Data
			    	},{
			    		type:'spline',
			    		color:'#9e5ccd',
			    		name:'MA240',
			    		data:historyMA240Data
			    	},{
			    		type:'line',
			    		color:'#536dfe',
			    		name:'K9',
			    		data:historyKData,
			              yAxis: 2             
			    	},{
			    		type:'line',
			    		color:'#ef5350',
			    		name:'D9',
			    		data:historyDData,
			              yAxis: 2             
			    	}
			    	]    	
			    });
			    
			    var historyChart = $('#historyChart').highcharts();
			    
				$("#month").click(function(){
					historyChart.tooltip.options.formatter=function(){
		    			var tip=Highcharts.dateFormat('<span>%Y年  %B</span><br/>',this.x);
		    			tip+='開盤: '+this.points[0].point.open+'<br/>';
		    			tip+='最高: '+this.points[0].point.high+'<br/>';
		    			tip+='最低: '+this.points[0].point.low+'<br/>';
		    			tip+='收盤: '+this.points[0].point.close+'<br/>';
		    			tip+='<span>'+this.points[1].series.name+': '+this.points[1].point.y+'</span><br/>';
		    			if(this.points[4]==undefined){
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y.toFixed(2)+'<br/>';
		    			}else if(this.points[5]==undefined){
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y.toFixed(2)+'<br/>';
		    			}else if(this.points[6]==undefined){
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[5].point.color+'">\u25CF</span> '+this.points[5].series.name+': '+this.points[5].point.y.toFixed(2)+'<br/>';
		    			}else{
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[5].point.color+'">\u25CF</span> '+this.points[5].series.name+': '+this.points[5].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[6].point.color+'">\u25CF</span> '+this.points[6].series.name+': '+this.points[6].point.y.toFixed(2)+'<br/>';
		    			}
		    			return tip;
		    		};
		    		
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
					
					historyChart.series[2].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['month',[1]]],
		            	}           
					},false);
					
					historyChart.series[3].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['month',[1]]],
		            	}           
					},false);
					
					historyChart.series[4].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['month',[1]]],
		            	}           
					},false);
					
					historyChart.series[5].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['month',[1]]],
		            	}           
					},false);
					
					historyChart.series[6].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['month',[1]]],
		            	}           
					},false);
		      		
		      		historyChart.redraw();
				});		    
			    
				$("#week").click(function(){					
					historyChart.tooltip.options.formatter=function(){
		    			var tip=Highcharts.dateFormat('<span>周 %A, %b %e日, %Y</span><br/>',this.x);
		    			tip+='開盤: '+this.points[0].point.open+'<br/>';
		    			tip+='最高: '+this.points[0].point.high+'<br/>';
		    			tip+='最低: '+this.points[0].point.low+'<br/>';
		    			tip+='收盤: '+this.points[0].point.close+'<br/>';
		    			tip+='<span>'+this.points[1].series.name+': '+this.points[1].point.y+'</span><br/>';
		    			if(this.points[4]==undefined){
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y.toFixed(2)+'<br/>';
		    			}else if(this.points[5]==undefined){
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y.toFixed(2)+'<br/>';
		    			}else if(this.points[6]==undefined){
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[5].point.color+'">\u25CF</span> '+this.points[5].series.name+': '+this.points[5].point.y.toFixed(2)+'<br/>';
		    			}else{
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[5].point.color+'">\u25CF</span> '+this.points[5].series.name+': '+this.points[5].point.y.toFixed(2)+'<br/>';
		    				tip+='<span style="color:'+this.points[6].point.color+'">\u25CF</span> '+this.points[6].series.name+': '+this.points[6].point.y.toFixed(2)+'<br/>';
		    			}
		    			return tip;
		    		};
					
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
		      		
					historyChart.series[2].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['week',[1]]],
		            	}           
					},false);
					
					historyChart.series[3].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['week',[1]]],
		            	}           
					},false);
					
					historyChart.series[4].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['week',[1]]],
		            	}           
					},false);
					
					historyChart.series[5].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['week',[1]]],
		            	}           
					},false);
					
					historyChart.series[6].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['week',[1]]],
		            	}           
					},false);
					
		      		historyChart.redraw();
				});
				
				$("#day").click(function(){
					historyChart.tooltip.options.formatter=function(){			    			
						var amount;
		    			var extent;
						for(var i=0;i<historyAllData.length;i++){
		    				if(this.x==historyAllData[i][0]){
		    					amount=historyAllData[i][5];
		    					extent=historyAllData[i][6];
		    				}
		    			}
						
						var tip=Highcharts.dateFormat('<span>%A, %b%e日, %Y</span><br/>',this.x);
		    			tip+='開盤: '+this.points[0].point.open+'<br/>';
		    			tip+='最高: '+this.points[0].point.high+'<br/>';
		    			tip+='最低: '+this.points[0].point.low+'<br/>';
		    			tip+='收盤: '+this.points[0].point.close+'<br/>';
		    			if(typeof amount=='number'){
		    				if(amount>0){
		    					tip+='<span>'+'漲跌金額'+': '+'<span style="color:red;">'+amount+'</span></span><br/>';
		    				}else if(amount<0){
		    					tip+='<span>'+'漲跌金額'+': '+'<span style="color:green;">'+amount+'</span></span><br/>';
		    				}else{
		    					tip+='<span>'+'漲跌金額'+': '+amount+'</span><br/>';
		    				}
		    			}else{
		    				tip+='<span>'+'漲跌金額'+': '+amount+'</span><br/>';
		    			}			    			
		    			if(typeof extent=='number'){
		    				if(extent>0){
		    					tip+='<span>'+'漲跌幅度'+': '+'<span style="color:red;">'+extent+'%</span></span><br/>';
		    				}else if(extent<0){
		    					tip+='<span>'+'漲跌幅度'+': '+'<span style="color:green;">'+extent+'%</span></span><br/>';
		    				}else{
		    					tip+='<span>'+'漲跌幅度'+': '+extent+'%</span><br/>';
		    				}
		    			}else{
		    				tip+='<span>'+'漲跌幅度'+': '+extent+'</span><br/>';
		    			}
		    			tip+='<span>'+this.points[1].series.name+': '+this.points[1].point.y+'</span><br/>';
		    			if(this.points[4]==undefined){
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y+'<br/>';
		    			}else if(this.points[5]==undefined){
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y+'<br/>';
		    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y+'<br/>';
		    			}else if(this.points[6]==undefined){
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y+'<br/>';
		    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y+'<br/>';
		    				tip+='<span style="color:'+this.points[5].point.color+'">\u25CF</span> '+this.points[5].series.name+': '+this.points[5].point.y+'<br/>';
		    			}else{
		    				tip+='<span style="color:'+this.points[2].point.color+'">\u25CF</span> '+this.points[2].series.name+': '+this.points[2].point.y+'<br/>';
		    				tip+='<span style="color:'+this.points[3].point.color+'">\u25CF</span> '+this.points[3].series.name+': '+this.points[3].point.y+'<br/>';
		    				tip+='<span style="color:'+this.points[4].point.color+'">\u25CF</span> '+this.points[4].series.name+': '+this.points[4].point.y+'<br/>';
		    				tip+='<span style="color:'+this.points[5].point.color+'">\u25CF</span> '+this.points[5].series.name+': '+this.points[5].point.y+'<br/>';
		    				tip+='<span style="color:'+this.points[6].point.color+'">\u25CF</span> '+this.points[6].series.name+': '+this.points[6].point.y+'<br/>';
		    			}
		    			return tip;
		    		};
					
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
					
					historyChart.series[2].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['day',[1]]],
		            	}           
					},false);
					
					historyChart.series[3].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['day',[1]]],
		            	}           
					},false);
					
					historyChart.series[4].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['day',[1]]],
		            	}           
					},false);
					
					historyChart.series[5].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['day',[1]]],
		            	}           
					},false);
					
					historyChart.series[6].update({
		            	dataGrouping: {
		            	approximation: "average",
		            	enabled: true,
		            	forced: true,
		            	units: [['day',[1]]],
		            	}           
					},false);
		      		
		      		historyChart.redraw();
				});
						
		});