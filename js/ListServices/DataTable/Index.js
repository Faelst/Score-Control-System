const endPointApi = 'http://localhost:8081/api'

import func from './Functions.js'

$(document).ready(function () {
  
  
  var table = $("#example").DataTable({
    order: [[1, "asc"]],
  });


  // Add event listener for opening and closing details
  $("#example tbody").on("click", "td > button", function () {
    var tr = $(this).closest("tr");
    var row = table.row(tr);
    if (row.child.isShown()) {
      // This row is already open - close it
      row.child.hide();
      tr.removeClass("shown");
    } else {
      // Open this row

      $.get(`${endPointApi}/service/1`)
        .then(resp => {
          row.child(func.format(resp)).show();
          tr.addClass("shown");
        })
    }
  });
});
