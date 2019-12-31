$(function() {

  $(document).on("change", "#user_avatar", function(e) {
    var reader = new FileReader;
    if (e.target.files.length) {
      reader.onload = function(e) {
        var avatarThumbnail = $("#user_thumbnail");
        avatarThumbnail.attr("src", e.target.result);
        $("#avatar_form").addClass("d-none");
        $("#user_avatar_preview").removeClass("d-none");
      }
      return reader.readAsDataURL(e.target.files[0]);
    }
  })

  $(document).on("change", "#photographer_avatar", function(e) {
    var reader = new FileReader;
    if (e.target.files.length) {
      reader.onload = function(e) {
        var avatarThumbnail = $("#photographer_thumbnail");
        avatarThumbnail.attr("src", e.target.result);
        $("#avatar_form").addClass("d-none");
        $("#photographer_avatar_preview").removeClass("d-none");
      }
      return reader.readAsDataURL(e.target.files[0]);
    }
  })
})
