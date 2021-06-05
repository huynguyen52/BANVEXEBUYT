// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var xyz = JSON.parse(localStorage.getItem("thongtinveluot"));
var dayArr = [];
var dataArr = [];
var dataLength = xyz.data.length;
dataLength = dataLength < 8 ? dataLength : 7;
for (let i = 0; i < dataLength; i++) {
	var tempDate = new Date(xyz.data[i].ngay);
	var day_name = '';
	switch (tempDate.getDay()) {
		case 0:
			day_name = "Chủ nhật";
			break;
		case 1:
			day_name = "Thứ hai";
			break;
		case 2:
			day_name = "Thứ ba";
			break;
		case 3:
			day_name = "Thứ tư";
			break;
		case 4:
			day_name = "Thứ năm";
			break;
		case 5:
			day_name = "Thứ sau";
			break;
		case 6:
			day_name = "Thứ bảy";
	}
	dayArr.push(day_name);
	dataArr.push(xyz.data[i].soLuong);
}



function number_format(number, decimals, dec_point, thousands_sep) {
	// *     example: number_format(1234.56, 2, ',', ' ');
	// *     return: '1 234,56'
	number = (number + '').replace(',', '').replace(' ', '');
	var n = !isFinite(+number) ? 0 : +number,
		prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
		sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
		dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
		s = '',
		toFixedFix = function(n, prec) {
			var k = Math.pow(10, prec);
			return '' + Math.round(n * k) / k;
		};
	// Fix for IE parseFloat(0.55).toFixed(0) = 0;
	s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	if (s[0].length > 3) {
		s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	}
	if ((s[1] || '').length < prec) {
		s[1] = s[1] || '';
		s[1] += new Array(prec - s[1].length + 1).join('0');
	}
	return s.join(dec);
}

// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myBarChart = new Chart(ctx, {
	type: 'bar',
	data: {
		labels: dayArr,
		datasets: [{
			label: "Revenue",
			backgroundColor: "#5893df",
			hoverBackgroundColor: "#5893df",
			borderColor: "#4e73df",
			data: dataArr,
		}],
	},
	options: {
		maintainAspectRatio: false,
		layout: {
			padding: {
				left: 10,
				right: 25,
				top: 25,
				bottom: 0
			}
		},
		scales: {
			xAxes: [{
				time: {
					unit: 'month'
				},
				gridLines: {
					display: false,
					drawBorder: false
				},
				ticks: {
					maxTicksLimit: 6
				},
				maxBarThickness: 25,
			}],
			yAxes: [{
				ticks: {
					min: 0,
					maxTicksLimit: 5,
					padding: 10,
					// Include a dollar sign in the ticks
					callback: function(value, index, values) {
						return '$' + number_format(value);
					}
				},
				gridLines: {
					color: "#2e4263",
					zeroLineColor: "#2e4263",
					drawBorder: false,
					borderDash: [0],
					zeroLineBorderDash: [0]
				}
			}],
		},
		legend: {
			display: false
		},
		tooltips: {
			titleMarginBottom: 10,
			titleFontColor: '#6e707e',
			titleFontSize: 14,
			backgroundColor: "rgb(255,255,255)",
			bodyFontColor: "#858796",
			borderColor: '#dddfeb',
			borderWidth: 1,
			xPadding: 15,
			yPadding: 15,
			displayColors: false,
			caretPadding: 10,
			callbacks: {
				label: function(tooltipItem, chart) {
					var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
					return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
				}
			}
		},
	}
});
