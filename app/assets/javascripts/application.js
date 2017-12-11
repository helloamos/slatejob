// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require geocomplete
//= require turbolinks
//= require rails.validations
//= require bootstrap
//= require bootstrap-filestyle
//= require social-share-button
//= require toastr
//= require chosen-jquery
// require select2
//= require intlTelInput
// require utils
//= require jquery.raty
//= require ratyrate

//= require_tree .

$(document).on('turbolinks:load', function(){
	$("#geocomplete").geocomplete();  // Option 1: Call on element.
	$().alert('close')
});




$(document).on('turbolinks:load', function () {
 $(".freelances").popover({ html : true, trigger: 'focus'})
 $(".projects").popover({ html : true , trigger: 'focus'})
 $(".user-menu").popover({ html : true, trigger: 'focus'})
 $(".companies").popover({ html : true, trigger: 'focus'})
 $(".more").popover({ html : true, trigger: 'focus'})

});

$(document).on('turbolinks:load', function () {
	$( "a.freelances " ).click(function( event ) {
	  event.preventDefault()
	  // Do something
	});

	$( "a.projects" ).click(function( event ) {
	  event.preventDefault()
	  // Do something
	});

	$( "a.user-menu" ).click(function( event ) {
	  event.preventDefault()
	  // Do something
	});
	$( "a.companies" ).click(function( event ) {
	  event.preventDefault()
	  // Do something
	});
	$( "a.more" ).click(function( event ) {
	  event.preventDefault()
	  // Do something
	})

})


// Enable chosen js for turbolinks
$(document).on('turbolinks:load', function() {
	$('.chosen-select').chosen({
	allow_single_deselect: true,
	max_selected_options: 10,
	no_results_text: 'No results matched'

	});
});
 
 /* $(document).on('turbolinks:load', function(){
	 $("#phone").intlTelInput();
});*/
 $(document).on('turbolinks:load', function(){
  $("#phone").intlTelInput({
    formatOnInit: true,
    separateDialCode: true,
    
    // initial country
initialCountry: "Mali",


    utilsScript: "/libphonenumber/utils.js"
});
  });