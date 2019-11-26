$(function() {
  $(document).on("change", "#user_avatar", function(e) {
    console.log("READ_FILE")
    var reader = new FileReader;
    if (e.target.files.length) {
      reader.onload = function(e) {
        var avatarThumbnail = $("#user_thumbnail");
        console.log("GET_USER_THYMBNAIL")
        $("#user_avatar_preview").removeClass("d-none");
        $("#user_avatar_preview").addClass("d-block");
        avatarThumbnail.attr("src", e.target.result);
        console.log("ATTACH_SRC")
      }
      return reader.readAsDataURL(e.target.files[0]);
    }
  })

  $(document).on("change", "#photographer_avatar", function(e) {
    console.log("READ_P_FILE")
    var reader = new FileReader;
    if (e.target.files.length) {
      reader.onload = function(e) {
        var avatarThumbnail = $("#photographer_thumbnail");
        console.log("GET_P_THYMBNAIL")
        $("#photographer_avatar_preview").removeClass("d-none");
        $("#photographer_avatar_preview").addClass("d-block");
        avatarThumbnail.attr("src", e.target.result);
        console.log("ATTACH_P_SRC")
      }
      return reader.readAsDataURL(e.target.files[0]);
    }
  })
})

