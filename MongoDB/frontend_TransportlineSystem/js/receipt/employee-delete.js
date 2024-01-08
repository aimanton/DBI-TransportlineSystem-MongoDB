$(document).ready(function () {
  deleteEntry();
});

function deleteEntry() {
  $(document).on('click', '.btn-delete', function () {
    var id = $(this).attr('data-id');
    let url = "http://localhost:5297/api/Employee/" + id;

    $.ajax({
      url: url,
      type: 'DELETE',
      success: function () {
        var elementExists = document.getElementById('s' + id);
        if (elementExists) {
          document.getElementById('s' + id).innerHTML = '';
        }

        document.getElementById('console').innerHTML += "<div class='red'>{Deleted}</div>";
        updateScroll();

        for (var i = 0; i < 5; i++) {
          read();
        }
      },
      error: function (xhr, textStatus, errorThrown) {
        console.error("Error deleting entry:", errorThrown);
      }
    });
  });
}