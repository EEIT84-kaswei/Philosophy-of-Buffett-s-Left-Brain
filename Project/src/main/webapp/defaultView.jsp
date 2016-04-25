<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%> 
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>Insert title here</title> -->

<!-- </head> -->
<style>
#weightedIndexChart{
 		width: auto;
  		height : auto;
		max-width: 25em;
		max-height: 25em;
	}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/highstock.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/exporting.js"></script>

<script type="text/javascript">

var taiexPriceData=[];
var taiexVolumeData=[];

function transferTaiexData(data){
	for(i=0;i<data.length;i++){
		taiexPriceData.push([data[i][0],data[i][1]]);
		taiexVolumeData.push([data[i][0],data[i][2]]);
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
	
	var contextPath="${pageContext.request.contextPath}";
	
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
});
</script>

<body>

<div id="weightedIndexChart" style="margin:0 auto"></div>

</body>
</html>