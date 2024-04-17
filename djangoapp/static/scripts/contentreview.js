var drawChart =  function (columns, columns_groups) {
	var chart = c3.generate({
	    data: {
	    	x: 'x',
	        columns: columns,
	        type: 'bar',
	        groups: [columns_groups]
	    },
	    axis: {
	        x: {
	            type: 'category' // needed to load string x value
	        }
	    },
	    grid: {
	        y: {
	            lines: [{ value:0 }]
	        }
	    },
	    legend: {
	        position: 'right'
	    }
	});
	
	setTimeout(function () {
	    chart.groups([columns_groups])
	}, 200);
}


var content_type_ktype = function (data) {
	columns = []; // colors ['Text',0,0,0,0], ['Image',0,0,0,0], ['Video',0,0,0,0]
	for (i in content_types) {
		columns.push([content_types[i], 0, 0, 0, 0]);
	}
	var columns_groups = content_types;

	$.each(data, function (k, stats) {
		// console.log("content_type {0}, keywd.ktype {1}, total {2}".format(stats.content_type, stats.keywd__ktype, stats.total));
		if (stats.content_type != null && stats.keywd__ktype != null)
			columns[stats.content_type-1][stats.keywd__ktype] = stats.total;
	});
	
    console.log(columns);
	var x_string = [['x', 'Review', 'Negative', 'General', 'Association']];
	var z = x_string.concat(columns);
	drawChart(z, columns_groups);
}

/*
 * Pie chart - Brand SERP
 */
pie_success = function (data) {
	var columns = [[], [], [], [], [], [], []];
	
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
	}
	
	ajaxUpdate();
	return false;
}

var ajaxUpdate = function () {
	var filter = "?domain={0}&search_engine={1}&daterange={2}".format(
		prefilters['domain'],
		prefilters['search_engine'],
		prefilters['daterange']);
			
	getJson("content_type_pie"+filter, pie_success);
	getJson("content_type_ktype/"+filter, content_type_ktype);
	getJson("top_domains/5"+filter, function (data) { loadTableHB("#top_domains_tbody", data); });
	getJson("top_urls/5"+filter, function (data) { loadTableHB("#top_urls_tbody", data); });
}
