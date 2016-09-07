  function ready() {
    // This initializes all elements that have data-behaviour=datepicker as a datepicker.
    // There is no need to repeat this statement anywhere else.
      $('[data-behaviour~=datepicker]').datepicker();

      $('#sandbox-container .input-group.date').datepicker({
    maxViewMode: 2,
    todayBtn: "linked",
    language: "es",
    calendarWeeks: true,
    autoclose: true,
    todayHighlight: true,
    beforeShowMonth: function (date){
                  if (date.getMonth() == 8) {
                    return false;
                  }
                },
    defaultViewDate: { year: 1977, month: 04, day: 25 }
});
// $("#items_search input").bind("keyup", function() {
//
// // $("#items_search input").observe_field(2, function() {
//
//   $("#items_search input").addClass("loading"); // show the spinner
//   var form = $("#items_search"); // grab the form wrapping the search bar.
//
//   var url = "/items/index"; // live_search action.
//   var formData = form.serialize(); // grab the data in the form
//   $.get(url, formData, function(html) { // perform an AJAX get
//
//     $("#items_search input").removeClass("loading"); // hide the spinner
//
//     $("#items").html(html); // replace the "results" div with the results
//
//   });

// $(function() {
//   $("#items th , #items").on("keyup", "a", function() {
//     $.getScript(this.href);
//     return false;
//   });
//   $("#items_search input").keyup(function() {
//     $.get($("#items_search").attr("action"), $("#items_search").serialize(), null, "script");
//     return false;
//   });
// });

// $("#big-search-box").bind("keyup", function() {
//
// $("#big-search-box").observe_field(2, function() {
//
//   $("#big-search-box").addClass("loading"); // show the spinner
//   var form = $("#live-search-form"); // grab the form wrapping the search bar.
//
//   var url = "/search_results"; // live_search action.
//   var formData = form.serialize(); // grab the data in the form
//   $.get(url, formData, function(html) { // perform an AJAX get
//
//     $("#big-search-box").removeClass("loading"); // hide the spinner
//
//     $("#live-search-results").html(html); // replace the "results" div with the results
//
//   });

};
$(document).on('ready page:load', ready);
