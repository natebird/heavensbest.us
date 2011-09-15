// jQuery "#big-search-box".bind("keyup"), ->
//   form = $("#live-search-form") # set the form 
//   url = "/accounts/search" # set the live_search route for the controller action.  
//   formData = form.serialize() # grab the data in the form  
//   
//   $.get url, formData, (html) -> # perform an AJAX get
//     $("#live-search-results").html(html) # replace the "results" div with the results

$("#big-search-box").bind("keyup", function() {
  $("#big-search-box").addClass("loading"); // show the spinner
  var form = $("#live-search-form"); // grab the form wrapping the search bar.
  var url = "/accounts/search"; // live_search action.  
  var formData = form.serialize(); // grab the data in the form  
  $.get(url, formData, function(html) { // perform an AJAX get
    $("#big-search-box").removeClass("loading"); // hide the spinner
    $("#live-search-results").html(html); // replace the "results" div with the results
  });
}); 
