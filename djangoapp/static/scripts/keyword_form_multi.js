currentRow = 0;

$(function() {

    addCategoryRow = function(row) {
        newcategory = 'newcategory'+row;
        var clone = $('#newcategory').clone();      // clone row
        clone.attr("id", newcategory);              // change id
        clone.find('#id_category_name')             // change label
            .attr('id', 'id_category_name'+row)
            .attr('name', 'category_name'+row)
            .val('Custom '+row);
        clone.find('#id_category_value')            // change input value and hide
            .attr('id', 'id_category_value'+row)
            .attr('name', 'category_value'+row)
            .val('');
        clone.find('#_id_category_value')           // checkbox: uncheck
            .attr('id', '_id_category_value'+row)
            .addClass('category');
        clone.find('.addcategory').remove();
        clone.appendTo('#categories');
    }

    addCheckboxEvent = function(checkbox_id) {
        $(checkbox_id).on('change', function() {
            if (!$(this).prop('checked')) {
            	var thisRow = this.id.replace('_id_category_value', '')
            	$('#newcategory'+thisRow).remove();
            }
            return false;
        });
    }

    // first checkbox
    $('#_id_category_value').on('change', function() {
    	var checkbox_id = '#' + $(this).attr('id')
        var value_input_id = checkbox_id.replace('_','');
        var value_input = $(value_input_id);
        if (value_input.hasClass('hide')) {
            $('.addcategory').removeClass('hide');        
            $(value_input_id).removeClass('hide');
            $(value_input_id.replace('value', 'name')).val("Custom");
        } else {
            $('.addcategory').addClass('hide');
            $(value_input).addClass('hide');
            $(value_input).val('');
        }
        return false;
    });

    // checkbox for predefined categories [brand/type]
    $('.category').on('change', function() {
        var category = $(this).attr('id').replace('_','');
        var input = $('#'+category);
        if (input.hasClass('hide')) {
            $('#'+category).removeClass('hide');
        } else {
            $('#'+category).addClass('hide');
            $('#'+category).val(0);
        }
        return false;
    });
    
    $('.addcategory').on('click', function() {
        currentRow++;
        addCategoryRow(currentRow);
        addCheckboxEvent('#_id_category_value'+currentRow);
        return false;
    });
    
    $(document).ready(function() {
        items = $('.category:checked');
        $.each(items, function(index, item) {
            var category = $(this).attr('id').replace('_','');
            var input = $('#'+category);
            $('#'+category).removeClass('hide');
        });
    });

});
