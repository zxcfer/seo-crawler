$(document).ready(function() {
	
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