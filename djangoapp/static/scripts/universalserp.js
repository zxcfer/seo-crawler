var drawChart =  function (columns) {
	var chart = c3.generate({
	    data: {
	    	x: 'x',
	        columns: columns,
	        type: 'bar'
	    },
	    axis: {
	        x: { type: 'category' }
	    },
	    grid: {
	        y: { lines: [{ value:0 }] }
	    },
	    legend: { position: 'right' }
	});
}

/*
 * data = [
 * 	{None: 20, Neutral: 21.42, Negative: 40, Postive: 42.85}
 * 	{None: 10,                 Negative: 60, Postive: 42.85}
 * 	{None: 12, Neutral: 21.42, Negative: 23,				 }
 * }
 * 
 * ['None', 20, 10, 12], ['', ]...
 */

var content_type_group = function (data) {
	var columns = [['URLs',0,0,0,0,0,0,0]];
	
	$.each(data, function(k, group) {
       	columns[0][group.content_type] = group.total;
	});
	
    columns = [['x'].concat(content_types)].concat(columns);
	drawChart(columns);
}

var pie_success = function (data) {
	var columns = [[], [], [], []];
	
	loadTableHB("#url_count_tbody", data);
	
	$.each(data, function(k, items) {
		columns[k][0] = items.result_type;
		columns[k][1] = items.total;
	});
	
	var piechart = c3.generate({
		bindto: '#piechart',
	    data: {
	        columns: columns,
	        type : 'pie',
	    }
	});
}

var getAllDomains = function() {
	getJson("top_domains/50", function (data) { loadTableHB("#top_domains_tbody", data); });
	return false;
}

var getAllUrls = function() {
	getJson("top_urls/50", function (data) { loadTableHB("#top_urls_tbody", data); });
	return false;
}

prefilters = {
	'domain'		: '',
	'search_engine'	: 'XX',
	'daterange'		: ''
}

var set_filter = function (filter, value) {
	prefilters[filter] = value;

	if (filter == 'search_engine') {
		$('#'+filter+'_select').text(search_engines[value]);
	} else if (filter == 'domain') {
		$('#'+filter+'_select').text(value);
	}
	
	ajaxUpdate();
	return false;
}

var ajaxUpdate = function () {
	var filter = "?domain={0}&search_engine={1}&daterange={2}".format(
		prefilters['domain'],
		prefilters['search_engine'],
		prefilters['daterange']
	);
			
	getJson("dashboard_pie"+filter, pie_success);
	getJson("content_type_group"+filter, content_type_group);
	getJson("top_domains/5"+filter, function (data) { loadTableHB("#top_domains_tbody", data); });
	getJson("top_urls/5"+filter, function (data) { loadTableHB("#top_urls_tbody", data); });
	
}
