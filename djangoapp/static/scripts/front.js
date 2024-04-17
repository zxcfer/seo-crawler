drawPieChart =  function (chart_id, columns) {
	var piechart = c3.generate({
		bindto: chart_id,
	    data: {
	        columns: columns,
	        type : 'pie',
	    }
	});
}

drawBarChart =  function (chart_id, columns, columns_groups) {
	var chart = c3.generate({
		bindto: chart_id,
	    data: {
	    	x: 'x',
	        columns: columns,
	        type: 'bar',
	        groups: [columns_groups]
	    },
	    axis: {
	        x: { type: 'category' }
	    },
	    grid: { y: { lines: [{ value:0 }] } },
	    legend: { position: 'right' }
	});

}

$(document).ready(function() {
	
	ajaxUpdate();

	/*
	 * Date Range Filter
	 */
	$('input[name="daterange"]').daterangepicker({
	    format: 'YYYY-MM-DD',
	    startDate: '2015-04-01',
	    endDate: '2015-04-17',
	    ranges: {
	       'Last 30 Days': [moment().subtract(29, 'days'), moment()],
	       'This Month': [moment().startOf('month'), moment().endOf('month')],
	       'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	    }
	},
	function(start, end, label) {
	    prefilters['daterange'] = start.format('YYYY-MM-DD')+'.'+end.format('YYYY-MM-DD');
	    ajaxUpdate();
	});

});