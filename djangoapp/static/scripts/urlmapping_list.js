save = function (post_url) {
	$.ajax({
	  type: "POST",
	  url: post_url,
	  data: {'csrfmiddlewaretoken': csrf_token},
	  success: saveSuccess,
	});
}

saveSentiment = function(row_id, sentiment) {
	$('#sentiment-'+row_id).text(sentiments[sentiment-1]);
	save('/sentiment-monitor/settings/url-mapping/update-sentiment/{0}/{1}/'.format(row_id, sentiment));
}

saveContentCategory = function(row_id, content_type) {
	$('#content-category-'+row_id).text(content_types[content_type-1]);
	save('/sentiment-monitor/settings/url-mapping/update-content-category/{0}/{1}/'.format(row_id, content_type));
}

saveResultType = function (row_id, result_type) {
	$('#result-type-'+row_id).text(result_types[result_type]);
	save('/sentiment-monitor/settings/url-mapping/update-result-type/{0}/{1}/'.format(row_id, result_type));
}

saveSuccess = function(data, status, xhr) {
	result = status;
	console.log('Success Post: "{0}"'.format(xhr.url));
}

selectDiv = '<div class="btn-group">'
		+'<button id="{0}" type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">'
		+'  {1}<span class="caret"></span></button>'
		+'<ul class="dropdown-menu" role="menu">{2}</ul>'
		+'</div>';
selectAction = '<li><a href="javascript:void(0)" onclick="save{0}({1}, {2});">{3}</a></li>';
	
$(document).ready(function() {
    $('#urlmapping_list').DataTable({
	    ajax: "/sentiment-monitor/settings/url-mapping/datatables",
	    columns: [
  	        {	data: null, 
  	        	render: function (data, type, full, meta) {
  	        		edit = '<a href="{0}" target="_blank">{1}</a>'.format(data.url, data.url);
  	        		return edit;
  	        	}
  	        },
	        {   data: null,
  	        	render: function (data, type, full, meta) {
  	        		actions = selectAction.format('Sentiment', data.id, 0, 'None');
  	        		for (var i=0; i<sentiments.length-1; i++)
  	        			actions += selectAction.format('Sentiment', data.id, i+1, sentiments[i]);
  	        		return selectDiv.format('sentiment-'+data.id, data.sentiment, actions);
	        	}
	        },
	        {   data: null,
  	        	render: function (data, type, full, meta) {
  	        		actions = selectAction.format('ContentCategory', data.id, 0, 'None');
  	        		for (var i=0; i<content_types.length-1; i++)
  	        			actions += selectAction.format('ContentCategory', data.id, i+1, content_types[i]);
  	        		return selectDiv.format('content-category-'+data.id, data.content_type, actions);
	        	}
	        },
	        {   data: null, 
  	        	render: function (data, type, full, meta) {
  	        		actions = selectAction.format('ResultType', data.id, 0, 'None');
  	        		for (i in result_types)
  	        			actions += selectAction.format('ResultType', data.id, "'{0}'".format(i), result_types[i]);
  	        		return selectDiv.format('result-type-'+data.id, data.result_type, actions);
	        	}
	        },
//	        { data: "content_type" },
//	        { data: "result_type" },
	        { data: "content_authority" },
	        { data: null, 
	        	render: function (data, type, full, meta) {
	        		edit_url = '/sentiment-monitor/settings/url-mapping/update/{0}/'.format(data.id);
	        		edit = '<a href="{0}" class="btn btn-primary btn-xs">Edit</a>'.format(edit_url);
	        		return edit;
	        	}
	        }
	    ]
	});
});

