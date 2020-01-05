$(function() {

  var newPortfolioFile;

  function replaceView(number) {
    var portfolioImg = $(`<div class="portfolio-frame d-flex flex-column bg-gray shadow pt-2 mb-3" data-id="${ number }">
                              <img class="portfolio-preview mb-1" >
                          </div>`);
    var deleteBtn = $(`<button type="button" class="delete-image d-block btn btn-lg bg-secondary p-1 w-100" data-id="${ number }">
                            <p class="mb-0 text-light">削除</p>
                      </button>`);
    portfolioImg.append(deleteBtn);
    return portfolioImg;
  }

  function replaceImg(number) {
    var portfolioForm = $(`<label for="portfolio_input_${ number }" class="portfolio-label position-relative mt-0 mb-1 bg-sub d-flex align-items-center justify-content-center" data-id="${ number }">
                              <div class="portfolio-description d-flex align-items-center justify-content-center position-absolute text-white w-100 h-100">画像をアップロード</div>
                              <i class="fas fa-camera fa-5x text-white"></i>
                              <input type="file" name="portfolio[portfolio_url]" class="portfolio-input d-none" id="portfolio_input_${ number }" data-id="${ number }">
                          </label>`);
    return portfolioForm;
  }

  $(document).on("change", '#portfolio_input_1,#portfolio_input_2,#portfolio_input_3,#portfolio_input_4,#portfolio_input_5,#portfolio_input_6', function(e) {
    var inputId = $(this).data('id');
    newPortfolioFile = $(this).prop("files")[0];
    var reader = new FileReader;
    
    if (e.target.files.length) {
      var portfolioImg = replaceView(inputId);
      var portfolioBtn = $(`div[data-id="${inputId}"].portfolio-submit`);
      reader.onload = function(e) {
        var replaceTarget = $(`label[data-id="${inputId}"].portfolio-label`);
        $(replaceTarget).replaceWith(portfolioImg);
        portfolioImg.find("img").attr("src", e.target.result);
        portfolioBtn.removeClass("d-none");
      }
      return reader.readAsDataURL(newPortfolioFile);
    }
  })

  $(document).on("click", '.delete-image, .portfolio-close', function() {
    var deleteId = $(this).data('id');
    var portfolioBtn = $(`div[data-id="${deleteId}"].portfolio-submit`);
    if (newPortfolioFile != "") {
      var portfolioLabel = replaceImg(deleteId);
      var replaceTarget = $(`div[data-id="${deleteId}"].portfolio-frame`);
      $(replaceTarget).replaceWith(portfolioLabel);
      portfolioBtn.addClass("d-none");
      newPortfolioFile = "";
    }
  });

  $('#portfolio_submit_1,#portfolio_submit_2,#portfolio_submit_3,#portfolio_submit_4,#portfolio_submit_5,#portfolio_submit_6').on("submit", function(e) {
    e.preventDefault();
    var submitId = $(this).data('id');
    var formData = new FormData($(`form[data-id="${submitId}"].portfolio-form`).get(0));
    if (newPortfolioFile == "") {
      formData.append("portfolio[image]", "");
    } else {
      formData.append("portfolio[image]", newPortfolioFile);
      for (let value of formData.entries()) { 
      }
    };
    $.ajax({
      url:         "/portfolios",
      type:        "POST",
      data:        formData,
      contentType: false,
      processData: false,
    })
    .done(function(post){
      console.log(post);
    });
  });
})