
keyword_list_url = "/sentiment-monitor/settings/keyword/datatables";
prefilters = { 'brand':9, 'ktype':9 };

columns = [
           { data: "word" },
           { data: "brand" },
           { data: "ktype" },
           { data: "custom" },
           { data: "created_at" },
           { data: null, "render": function (data, type, full, meta) {
           	edit_url = '/sentiment-monitor/settings/keyword/update/{0}/'.format(data.id);
           	remove_url = '/sentiment-monitor/settings/keyword/delete/{0}/'.format(data.id);
           	
               edit = '<a href="{0}" class="btn btn-primary btn-xs">Edit</a>'.format(edit_url);
               remove = ' <a href="{0}" class="btn btn-danger btn-xs">Delete</a>'.format(remove_url);;
               
               return edit+remove;}
           }
       ];

var set_keyword_filter = function (filter, value) {
	prefilters[filter] = value;

	if (filter == 'brand') {
		$('#'+filter+'_select').text(brands[value]);
	} else if (filter == 'ktype') {
		$('#'+filter+'_select').text(ktypes[value]);
	}
	ajaxUpdate();
	return false;
}

var ajaxUpdate = function () {
	var filter = "?brand={0}&ktype={1}".format(
			prefilters['brand'],
			prefilters['ktype']);
	if (typeof table != 'undefined') {
		table.ajax.url(keyword_list_url + filter).load();
	}
}

$(document).ready(function() {
    table = $('#keyword_list').DataTable({
        ajax: keyword_list_url,
        columns: columns
    });
});
