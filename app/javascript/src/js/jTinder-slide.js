$(window).on('load',function() {
  if(document.URL.match(/\/users\/search*/)) {
    var portfoliosNum = gon.portfolios.length;
    var currentPortfolioIndex = 0;

    var postReaction = function (photographer_id, reaction) {
      $.ajaxSetup({
          headers: {
              'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
          }
      });
      $.ajax({
        type: "POST",
        url: "/reactions",
        data: {
          photographer_id: photographer_id,
          reaction: reaction,
        },
        success: function(j_data){
          console.log("success")
        }
      });
    }

    function checkPortfolioNum() {
      if (currentPortfolioIndex === portfoliosNum){
        $(".no-portfolio").addClass("is-active");
        $("#action_btn_area").addClass("is-none")
        return;
      }
    }

    $("#tinderslide").jTinder({
      onDislike: function (item) {
        currentPortfolioIndex++;
        checkPortfolioNum();
        var photographer_id = item[0].dataset.photographer_id
        postReaction(photographer_id, 'dislike')
      },
      onLike: function (item) {
        currentPortfolioIndex++;
        checkPortfolioNum();
        var photographer_id = item[0].dataset.photographer_id
        postReaction(photographer_id, 'like')
      },
      animationRevertSpeed: 200,
      animationSpeed: 400,
      threshold: 1,
      likeSelector: '.like',
      dislikeSelector: '.dislike'
    });
    $('.actions .like, .actions .dislike').click(function(e){
      e.preventDefault();
      $("#tinderslide").jTinder($(this).attr('class'));
    });
  }
});