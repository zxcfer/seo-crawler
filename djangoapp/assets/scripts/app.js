String.prototype.format = function() {
  var formatted = this;
  for (var i = 0; i < arguments.length; i++) {
    var regexp = new RegExp('\\{'+i+'\\}', 'gi');
    formatted = formatted.replace(regexp, arguments[i]);
  }
  return formatted;
};

getJson = function (url, success) {
	console.log("URL <{1}>".format(location.href, url));
  $.ajax({
    dataType: "json",
    type:     'GET',
    url:      url + location.search,
    success:  success,
    error: 	function (xhr, ajaxOptions, thrownError) {
      console.log("Error getJSON '{0}':'{1}'".format(url, xhr.status));
      console.log(thrownError);
    }
  });
}

$(function() {
    $('#side-menu').metisMenu();
});


loadTableHB = function (table_body_id, data) {
	Handlebars.registerHelper("inc", function(value, options) {
		return parseInt(value) + 1;
	});
	
	console.log(data);
	
	console.log(table_body_id+"_template");
	var source   = $(table_body_id+"_template").html();
	var template = Handlebars.compile(source);
	var html     = template({'items': data});
	
	$(table_body_id).replaceWith(html);
}

loadTablePartialHB = function (table_body_id, template_id, partial_id, data) {
	var source   = $(template_id).html();
	var template = Handlebars.compile(source);
	Handlebars.registerPartial("partial", $(partial_id).html());
	
	var html     = template({'items': data});
	$(table_body_id).replaceWith(html);
}

function getMonday( date ) {
    var day = date.getDay() || 7;  
    if( day !== 1 ) 
        date.setHours(-24 * (day - 1)); 
    return date;
}

function setParam(name, value) {
    var l = window.location;

    /* build params */
    var params = {};        
    var x = /(?:\??)([^=&?]+)=?([^&?]*)/g;        
    var s = l.search;
    for(var r = x.exec(s); r; r = x.exec(s))
    {
        r[1] = decodeURIComponent(r[1]);
        if (!r[2]) r[2] = '%%';
        params[r[1]] = r[2];
    }

    /* set param */
    params[name] = encodeURIComponent(value);

    /* build search */
    var search = [];
    for(var i in params)
    {
        var p = encodeURIComponent(i);
        var v = params[i];
        if (v != '%%') p += '=' + v;
        search.push(p);
    }
    search = search.join('&');

    /* execute search */
    l.search = search;
}

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
    $(window).bind("load resize", function() {
        topOffset = 50;
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1) height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    });

    // menu active
    var url = window.location;
    var element = $('ul.nav a').filter(function() {
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).addClass('active').parent().parent().addClass('in').parent();
    
    if (element.is('li')) {
        element.addClass('active');
    }
});
