$(document).on('ready page:load', function(){
	$('#get_tenpo_code').change(function(event){
		$.ajax({
			type:'get',
			url:'/sales/search',
			data:{ tenpo_code: $(this).val()},
			dataType:"script"
		});
		event.stopImmediatePropagation();
	});
});


	