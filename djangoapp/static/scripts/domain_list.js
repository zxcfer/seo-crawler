domain_list_url = window.location.href.replace('page/1/', 'datatables');
prefilters = { 'sentiment':9, 'domtype':9 };
columns = [
 { data: "domain" },
 { data: "domtype" },
 { data: "sentiment" },
 { data: "custom" },
 { data: "created_at" },
 { data: null, "render": function (data, type, full, meta) {
 	edit_url = '/sentiment-monitor/settings/your-domains/update/{0}/'.format(data.id);
 	remove_url = '/sentiment-monitor/settings/your-domains/delete/{0}/'.format(data.id);
 	
     edit = '<a href="{0}" class="btn btn-primary btn-xs">Edit</a>'.format(edit_url);
     remove = ' <a href="{0}" class="btn btn-danger btn-xs">Delete</a>'.format(remove_url);;
     
     return edit+remove;}
 }];

var set_domain_filter = function (filter, value) {
	prefilters[filter] = value;

	if (filter == 'sentiment') {
		$('#'+filter+'_select').text(sentiments[value]);
	} else if (filter == 'domtype') {
		$('#'+filter+'_select').text(domtypes[value]);
	}
	ajaxUpdate();
	return false;
}

var ajaxUpdate = function () {
	var filter = "?sentiment={0}&domtype={1}".format(
			prefilters['sentiment'],
			prefilters['domtype']);
	console.log(filter);
	if (typeof table != 'undefined') {
		console.log(domain_list_url+filter);
		table.ajax.url(domain_list_url + filter).load();
	}
}

$(document).ready(function() {
    table = $('#domain_list').DataTable({
        ajax: domain_list_url,
        columns: columns
    });
});