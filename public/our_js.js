
$(document).ready(function(){
  console.log("HEY YO")
  bindListeners();
});

var bindListeners = function(){
  $("form[action='/cart_items']").on("submit", buyNow);
  $(".dropdown").on('click', 'a.qty', updateOrderQty)
};

var buyNow = function(event){
  event.preventDefault();
  formData = $(this).serializeArray();
  console.log("this: " + this);
  console.log(formData)
  var ajaxCall = $.ajax({
    method: 'post',
    url: '/cart_items',
    data: formData,
    success: function(response){
    console.log("THIS IS THE OUTPUT: " + response )
    $('#cart-item-count').html(" " + response);
    },
    error: console.log("THIS IS AN ERROR IN buyNow ajax"),
  });
};

var updateOrderQty = function(event){
  event.preventDefault();
  var this_path = $(this).attr('href')
  $.ajax({
    method: 'put',
    url: "/cart_items" + this_path
  }).done(function(response){
    $('#dropdownMenu1').html(response)
  });
};


