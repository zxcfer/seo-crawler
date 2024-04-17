/*
 * 
 * [{'keywd__brand': 2, 'total': 25, 'sentiment': 0}, 
 * {'keywd__brand': 0, 'total': 24, 'sentiment': 0}, 
 * {'keywd__brand': 1, 'total': 24, 'sentiment':0},
 * {'keywd__brand': 0, 'total': 1, 'sentiment': 1}]
 * 
 * [['Postive', ]
 *  ['Negative', ]
 *  ['Neutral', ]]
 */

NO_SENTIMENT = 0
POSITIVE_SENTIMENT = 1;
NEGATIVE_SENTIMENT = 2;
NEUTRAL_SENTIMENT = 3;

BRAND = 1;
NON_BRAND = 2;

brand_sentiment = function (data) {
	brandSentimentColumns = [['Postive',0,0], ['Negative',0,0], ['Neutral',0,0], ['Irrelevant',0,0]]; // colors
	columns_groups = ['Postive', 'Negative', 'Neutral','Irrelevant'];

	$.each(data, function (k, brands) {
		if (brands.sentiment != 0 && brands.keywd__brand !=0) {
			brandSentimentColumns[brands.sentiment-1][brands.keywd__brand] = brands.total;
		}
	});
	
	var x_string = [['x', 'Brand', 'Non-brand']];
	var z = x_string.concat(brandSentimentColumns);
	drawBrandSentiment(z, columns_groups);
}


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
	drawBrandKtype(z, columns_groups);
}

var drawBrandSentiment =  function (columns, columns_groups) {
	var chart = c3.generate({
		bindto: '#brand_sentiment_barchart',
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

}

var drawBrandKtype =  function (columns, columns_groups) {
	var chart = c3.generate({
		bindto: '#brand_ktype_barchart',
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
}

prefilters = {
	'domain'		: '', 
	'search_engine'	: 'XX',
	'daterange'	: '' 
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
			
	getJson("brand_sentiment/"+filter, brand_sentiment);
	getJson("brand_ktype/"+filter, brand_ktype);
	getJson("top_brand_urls/"+filter, function (data) { loadTableHB("#top_brand", data); });
	getJson("top_non_brand_urls/"+filter, function (data) { loadTableHB("#top_non_brand", data); });
	getJson("top_ktype_review_urls/"+filter, function (data) { loadTableHB("#top_ktype_review", data); });
	getJson("top_ktype_negative_urls/"+filter, function (data) { loadTableHB("#top_ktype_negative", data); });
	getJson("top_ktype_general_urls/"+filter, function (data) { loadTableHB("#top_ktype_general", data); });
}

