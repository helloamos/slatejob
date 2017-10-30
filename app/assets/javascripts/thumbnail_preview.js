$(document).on('turbolinks:load', function(){
  $(":file").filestyle({input: false, text: "amo"});
});

$(document).on('turbolinks:load', function() {
  $('.filestyle').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      console.log(file);
      img.src = file.target.result;
      $('.thumbnail-preview').html(img);
    }
    reader.readAsDataURL(image);
    console.log(files);
  });
});


