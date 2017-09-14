$(document).ready(function(){
	setTimeout(function(){
		$('#notice_wrapper').fadeOut("slow",function(){
			$(this).remove();
		})
	},4500)

	setTimeout(function(){
		$('#alert_wrapper').fadeOut("slow",function(){
			$(this).remove();
		})
	},4500)
})

/*$(window).load(function() {
  $('#slider').nivoSlider();
});*/

// Or if you are using Turbolinks
$(document).on('page:change', function () {
  $('#slider').nivoSlider();
});