brand_ktype = function (data) {
	var columns = [['Postive',0,0,0,0], ['Negative',0,0,0,0], ['Neutral',0,0,0,0], ['Irrelevant',0,0,0,0]]; // colors
	var columns_groups = ['Postive', 'Negative', 'Neutral','Irrelevant'];

	$.each(data, function (k, ktypes) {
		if (ktypes.sentiment != 0 && ktypes.keywd__ktype != 0) {
			columns[ktypes.sentiment-1][ktypes.keywd__ktype] = ktypes.total;
		}
	});
	
    console.log(columns);
	var x_string = [['x', 'Review', 'Negative', 'General', 'Associate']];
	var z = x_string.concat(columns);
	drawBarChart('#sentiment_barchart', z, columns_groups);
}


/*
 *  [{'total': 37, 'sentiment': 2}, {'total': 12, 'sentiment': 1}, {'total': 25, 'sentiment': 3}, [], [], [], []]
 * 
 * ['None', 20, 10, 12], ['', ]...
 */
POSITIVE_SENTIMENT = 1;
NEGATIVE_SENTIMENT = 2;
NEUTRAL_SENTIMENT = 3;

content_flux = function (data) {
	
	var columns = [['Postive',0,0,0,0,0], ['Negative',0,0,0,0,0], ['Neutral',0,0,0,0,0]]; // colors
	var columns_groups = ['Postive', 'Negative', 'Neutral'];

	$.each(data, function(k, week) {
		j = 5-k;
		for (i in week) {
			if (week[i].sentiment == POSITIVE_SENTIMENT) {
				columns[0][j] = week[i].total;
			} else if (week[i].sentiment == NEGATIVE_SENTIMENT) {
				columns[1][j] = week[i].total;
			} else if (week[i].sentiment == NEUTRAL_SENTIMENT) {
				columns[2][j] = week[i].total;			
			}
		}
	});
	var today = new Date();
}

prefilters = {
		'search_engine'	: 'XX',
		'keyword'		: 0, 
		'ktype'			: 9,
		'daterange'		: ''
	};

datatables_columns =  [ { data: null, "render": function (data, type, full, meta) {
      		  	            edit = '<a href="{0}" target="_blank">{1}</a>'.format(data.url, data.url);
      		  	            return edit;}
      		  	        },
      		  	        { data: "content_type" },
            	        { data: "result_type" },
            	        { data: "sentiment" },
            	        { data: "search_engine" }
            	    ];

web_ranking_url = "/sentiment-monitor/webranking_datatables";

var set_filter = function (filter, value) {
	prefilters[filter] = value;
	
	if (filter == 'search_engine') {
		$('#'+filter+'_select').text(search_engines[value]);
	} else if (filter == 'ktype') {
		$('#'+filter+'_select').text(ktypes[value]);
	} else if (filter == 'keyword') {
		$('#'+filter+'_select').text(keywords[value]);
	}
	ajaxUpdate();
	return false;
}

var ajaxUpdate = function () {
	
	var filter = "?search_engine={0}&daterange={1}&keyword={2}&ktype={3}".format(
			prefilters['search_engine'],
			prefilters['daterange'],
			prefilters['keyword'],
			prefilters['ktype']);
	
	getJson("brand_ktype/"+filter, brand_ktype);

	/*
	 * [{"total": 38, "sentiment": 2}, 
	 * {"total": 13, "sentiment": 1}, 
	 * {"total": 219, "sentiment": 0}, 
	 * {"total": 30, "sentiment": 3}, 
	 * {"total": 3, "sentiment": 4}]
	 */
	getJson("sentiment_group"+filter, function(data) {
		var columns = [[], [], [], [], []];
		$.each(data, function(k, items) {
			columns[k][0] = items.sentiment;
			columns[k][1] = items.total;
		});
		drawPieChart('#sentiment_piechart', columns);
	});
	
	getJson("dashboard_pie"+filter, function(data) {
		var columns = [[], [], [], []];
		$.each(data, function(k, items) {
			columns[k][0] = items.result_type;
			columns[k][1] = items.total;
		});
		drawPieChart('#content_type_piechart', columns);
	});
	
	getJson("content_type_pie"+filter, function(data) {
		var columns = [[], [], [], [], [], [], []];
		$.each(data, function(k, items) {
			columns[k][0] = items.result_type;
			columns[k][1] = items.total;
		});
		drawPieChart('#content_overview_piechart', columns);
	});

	if (typeof brandSerpTable != 'undefined') {
		brandSerpTable.ajax.url(web_ranking_url+filter).load();
	}
}

$(document).ready(function() {
	brandSerpTable = $('#serptable').DataTable({
	    ajax: web_ranking_url,
	    columns: datatables_columns
	});
});
