$(document).on('ready page:load', function(){
	$('#get_chart').change(function(event){
		$.ajax({
			type:'get',
			url:'/statistics/search',
			data:{chart_id: $(this).val()},
			dataType:"script"
		});
		event.stopImmediatePropagation();
	});
});