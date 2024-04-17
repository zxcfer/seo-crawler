var drawChart =  function (columns, columns_groups) {
	var chart = c3.generate({
	    data: {
	    	x: 'x',
	        columns: columns,
	        type: 'bar',
	        groups: [columns_groups]
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
 * [{"domain": "en.wikipedia.org", "total": 14, "page": 1}, {"domain": "commons.wikimedia.org", "total": 9, "page": 1}]
 */
chart_success = function (data) {
	console.log(data);
	
	columns = []; // colors ['domain1',0,0,0], ['domain2',0,0,0], ['domain3',0,0,0]
	var columns_groups = [];
	
	for (i in data) {
		columns.push([data[i].domain, 0, 0, 0]);
		columns_groups.push(data.domain);
	}
	console.log(columns);
	
	$.each(data, function (k, stats) {
		console.log("{3}: domain {0}, page {1}, total {2}".format(stats.domain, stats.page, stats.total, k));
		if (stats.page != null && stats.domain != null)
			columns[k][stats.page] = stats.total;
	});
	
    console.log(columns);
	var x_string = [['x', 'Page 1', 'Page 2', 'Page 3']];
	var z = x_string.concat(columns);
	drawChart(z, columns_groups);
}


prefilters = {
	'domain'		: '', 
	'search_engine'	: 'XX',
	'keyword'		: 0,
	'daterange'		: ''
}

var set_filter = function (filter, value) {
	prefilters[filter] = value;

	if (filter == 'search_engine') {
		$('#'+filter+'_select').text(search_engines[value]);
	} else if (filter == 'keyword') {
		$('#'+filter+'_select').text(keywords[value]);
	} else if (filter == 'domain') {
		$('#'+filter+'_select').text(value);
	}
	
	ajaxUpdate();
	return false;
}

datatables_columns = [
          	        { data: "keyword" },
          	        { data: "category" },
          	        { data: "search_engine" },
          	        { data: "result_type" },
          	        { data: "content_type" },
	      	        { data: null, "render": function (data, type, full, meta) {
		  	            edit = '<a href="{0}" target="_blank">{1}</a>'.format(data.url, data.url);
		  	            return edit;}
		  	        },
          	        { data: "ranking" },
          	        { data: "sentiment" },
          	    ];

web_ranking_url = "/sentiment-monitor/webranking_datatables";
var ajaxUpdate = function () {
	var filter = "?domain={0}&search_engine={1}&keyword={2}&daterange={3}".format(
		prefilters['domain'],
		prefilters['search_engine'],
		prefilters['keyword'],
		prefilters['daterange']
	);
			
	getJson("urls_per_domain_page"+filter, chart_success);
	if (typeof web_ranking_table != 'undefined') {
		web_ranking_table.ajax.url(web_ranking_url + filter).load();
	}
}

$(document).ready(function() {
	web_ranking_table = $('#webRankingTable').DataTable({
	    ajax: web_ranking_url,
	    columns: datatables_columns
	});
});
