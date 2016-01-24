
$(document).ready(function(){
  console.log("JS is active...")
  bindListeners();
});

var bindListeners = function(){
  $("form[action='/cart_items']").on("submit", buyNow);
  $(".dropdown").on('click', 'a.qty', updateOrderQty);
  $("#shopping-cart").on('click', 'a.remove-button', deleteItemLine);
  $('#checkout').on('click', 'a', checkoutCart);
};

var refreshCart = function(){
  $.ajax({
    method: 'GET',
    url: '/carts'
  }).done(function(response){
    $('#shopping-cart').replaceWith(response)
  });
};

var buyNow = function(event){
  event.preventDefault();
  formData = $(this).serializeArray();
  console.log("this: " + this);
  console.log(formData)
  var ajaxCall = $.ajax({
    method: 'POST',
    url: '/cart_items',
    data: formData,
  }).done(function(response){
    // console.log("THIS IS THE OUTPUT: " + response )
    $('#cart-item-count').html(" " + response);
    // $("tr#" + response).append();
    refreshCart()
  })
};

var updateOrderQty = function(event){
  event.preventDefault();
  var this_path = $(this).attr('href')
  $.ajax({
    method: 'PUT',
    url: "/cart_items" + this_path
  }).done(function(response){
    $('#dropdownMenu1').html(response)
  });
};

var deleteItemLine = function(event){
  event.preventDefault();
  var this_path = $(this).attr('href');
  console.log("Got delete line item request: " + this_path);
  $.ajax({
    method: 'DELETE',
    url: this_path,
  }).done(function(response){
    console.log("returned from cart_items controller: " + response);
    $("tr#" + response.id).remove();
    $('#cart-item-count').html(" " + response.count);
  });
};

var checkoutCart = function(event){
  event.preventDefault();
  var this_path = $(this).attr('href');
  $.ajax({
    method: 'DELETE',
    url: this_path,
  }).done(function(response){
    console.log("Sucess!");
    $('.cart_row').remove()
  });
};
