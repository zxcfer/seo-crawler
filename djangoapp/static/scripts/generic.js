function get_json(form_id, data_div, message_div) {
	
	var frm = $(form_id); // '#form_id'

	frm.submit(function () {
		$.ajax({
			dataType: 'json',
			type: frm.attr('method'),
			url: frm.attr('action'),
			data: frm.serialize(),
			success: function (data) {
				$("#SOME-DIV").html(data); // #data_div
			},
			error: function(data) {
				$("#MESSAGE-DIV").html("Something went wrong!");
			}
		});
		return false;
	});

}

	var items = [];
	$.each(data, function(key, val) {
		
	});

template = ;
{{#items}}
  <tr class='{{row_type}}'>
    <td>{{id}}</td>
    <td>{{domain}}</td>
    <td>{{desc}}</td>
    <td>{{website}}</td>
    <td class='action'>
      <a class='btn btn-success' data-toggle='tooltip' href='#' title='Zoom'>
        <i class='icon-zoom-in'></i>
      </a>
      <a class='btn btn-info' href='#'>
        <i class='icon-edit'></i>
      </a>
      <a class='btn btn-danger' href='#'>
        <i class='icon-trash'></i>
      </a>
    </td>
  </tr>
{{/items}}

row_type = ['success', 'danger', 'warning', 'active']
