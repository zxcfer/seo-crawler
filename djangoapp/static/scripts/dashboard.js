var drawChart =  function (columns, columns_groups) {
	var chart = c3.generate({
	    data: {
	    	x: 'x',
	        columns: columns,
	        type: 'bar',
	        groups: [columns_groups]
	    },
	    axis: {
	        x: { type: 'category' },
	        y : {
                tick: {
                    format: d3.format(",%")
                }
            }
	    },
	    grid: {
	        y: { lines: [{ value:0 }] }
	    },
	    legend: {
	        position: 'right'
	    }
	});
}

/*
 * data = [
 * 	{None: 20, Neutral: 21.42, Negative: 40, Postive: 42.85}
 * 	{None: 10,                 Negative: 60, Postive: 42.85}
 * 	{None: 12, Neutral: 21.42, Negative: 23,               }
 * }
 * 
 * ['None', 20, 10, 12], ['', ]...
 */
chart_success = function (data) {
	var columns = [['None'],['Postive'],['Negative'],['Neutral'],['Irrelevant']];  // colors
	var columns_groups = ['None', 'Postive', 'Negative', 'Neutral','Irrelevant'];
	
	$.each(data, function(k, sentiments) {
        for (i in columns) {
        	var x = sentiments[columns[i][0]];
        	if (x === undefined) x = 0;
        	columns[i].push(x/100);
        }
	});
	
	var today = new Date();
	mon1 = getMonday(new Date(today.getTime() - (7 * 24 * 3600 * 1000))).toDateString()
	mon2 = getMonday(new Date(today.getTime() - (14* 24 * 3600 * 1000))).toDateString();
	mon3 = getMonday(new Date(today.getTime() - (3*7* 24 * 3600 * 1000))).toDateString();
	mon4 = getMonday(new Date(today.getTime() - (4*7* 24 * 3600 * 1000))).toDateString();
	
	
	var x_string = [['x', mon4, mon3, mon2, 'last week', 'current week']];
	var chart_columns = x_string.concat(columns);
	drawChart(chart_columns, columns_groups);
}

/*
 * Pie chart 
 */
pie_success = function (data) {
	var columns = [[], [], [], []];
	
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

prefilters = {
	'domain'		: '', 
	'search_engine'	: 'XX',
	'keyword'		: 0, 
	'brand'			: 9,
	'ktype'			: 9,
	'daterange'		: ''
};

var set_filter = function (filter, value) {
	prefilters[filter] = value;

	if (filter == 'search_engine') {
		$('#'+filter+'_select').text(search_engines[value]);
	} else if (filter == 'brand') {
		$('#'+filter+'_select').text(brands[value]);
	} else if (filter == 'ktype') {
		$('#'+filter+'_select').text(ktypes[value]);
	} else if (filter == 'keyword') {
		$('#'+filter+'_select').text(keywords[value]);
	} else if (filter == 'domain') {
		$('#'+filter+'_select').text(value);
	}
	
	ajaxUpdate();
	return false;
}

var ajaxUpdate = function () {
	var filter = "?domain={0}&search_engine={1}&keyword={2}&brand={3}&ktype={4}&daterange={5}".format(
		prefilters['domain'],
		prefilters['search_engine'],
		prefilters['keyword'],
		prefilters['brand'],
		prefilters['ktype'],
		prefilters['daterange']
	);
			
	getJson("dashboard_chart"+filter, chart_success);
	getJson("dashboard_pie"+filter, pie_success);
	getJson("dashboard_top_sites"+filter, function (data) { loadTableHB("#top_sites_tbody", data); });
	getJson("top_positive"+filter, function (data) { loadTableHB("#top_positive_tbody", data); });
	getJson("top_negative"+filter, function (data) { loadTableHB("#top_negative_tbody", data); });
}