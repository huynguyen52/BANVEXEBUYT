// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var xyz = JSON.parse(localStorage.getItem("thongTinVeThangDetail"));
function sortObj(obj) {
  return Object.keys(obj).sort().reduce(function (result, key) {
    result[key] = obj[key];
    return result;
  }, {});
}
var newxyz = sortObj(xyz);
var keysArr = Object.keys(newxyz);
var valuesArr = Object.values(newxyz);


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

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
	type: 'line',
	data: {
		labels: keysArr,
		datasets: [{
			label: "Daily",
			lineTension: 0.3,
			backgroundColor: "rgba(88, 147, 223, 0.05)",
			borderColor: "#5893df",
			pointRadius: 3,
			pointBackgroundColor: "#5893df",
			pointBorderColor: "#5893df",
			pointHoverRadius: 3,
			pointHoverBackgroundColor: "#5893df",
			pointHoverBorderColor: "#5893df",
			pointHitRadius: 10,
			pointBorderWidth: 0.5,
			data: valuesArr,
		}, {
			label: "Month",
			lineTension: 0.3,
			backgroundColor: "rgba(236, 94, 105, 0.05)",
			borderColor: "#ec5e69",
			pointRadius: 3,
			pointBackgroundColor: "#ec5e69",
			pointBorderColor: "#ec5e69",
			pointHoverRadius: 3,
			pointHoverBackgroundColor: "#ec5e69",
			pointHoverBorderColor: "#ec5e69",
			pointHitRadius: 10,
			pointBorderWidth: 0.5,
			data: [10, 5, 0, 3, 2, 7, 4, 1, 0, 2, 1, 9],
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
					unit: 'date'
				},
				gridLines: {
					display: false,
					drawBorder: false
				},
				ticks: {
					maxTicksLimit: 7
				}
			}],
			yAxes: [{
				ticks: {
					maxTicksLimit: 5,
					padding: 10,
					// Include a dollar sign in the ticks
					callback: function(value, index, values) {
						return '$' + number_format(value);
					}
				},
				gridLines: {
					color: "#706199",
					zeroLineColor: "#706199",
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
			backgroundColor: "rgb(255,255,255)",
			bodyFontColor: "#858796",
			titleMarginBottom: 10,
			titleFontColor: '#6e707e',
			titleFontSize: 14,
			borderColor: '#dddfeb',
			borderWidth: 1,
			xPadding: 15,
			yPadding: 15,
			displayColors: false,
			intersect: false,
			mode: 'index',
			caretPadding: 10,
			callbacks: {
				label: function(tooltipItem, chart) {
					var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
					return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
				}
			}
		}
	}
});
