$(window).on('load',function() {
  if(document.URL.match(/\/portfolios\/\d+\/edit/)) {
    var editPortfolioFile;
    var existingImage = $("#portfolio_edit_description").attr("src");

    function replaceView() {
      var portfolioImg = $(`<div class="portfolio-edit-frame d-flex flex-column bg-gray shadow pt-2 mb-3" id="portfolio_edit_frame">
                                <img class="portfolio-edit-preview mb-1" >
                            </div>`);
      var deleteBtn = $(`<button type="button" class="d-block btn btn-lg bg-secondary p-1 w-100" id="portfolio_edit_delete">
                              <p class="mb-0 text-light">削除</p>
                        </button>`);
      portfolioImg.append(deleteBtn);
      return portfolioImg;
    }

    function replaceImg() {
      var portfolioLabel = $(`<label for="portfolio_input_edit" class="portfolio-edit-label position-relative mt-0 mb-1 bg-gray d-flex align-items-center justify-content-center" id="portfolio_edit_label">
                                <div class="portfolio-description d-flex align-items-center justify-content-center position-absolute text-white w-100 h-100">画像をアップロード</div>
                                <img src="${existingImage}" class="portfolio-edit-description w-100 mb-1" id="portfolio_edit_description">
                                <input type="file" name="portfolio[image]" class="portfolio-input d-none" id="portfolio_input_edit">
                            </label>`);
      return portfolioLabel;
    }

    $(document).on("change", '#portfolio_input_edit', function(e) {
      editPortfolioFile = $(this).prop("files")[0];
      var reader = new FileReader;
      
      if (e.target.files.length) {
        var portfolioImg = replaceView();
        var portfolioBtn = $("#portfolio_edit_btn");
        reader.onload = function(e) {
          var replaceTarget = $("#portfolio_edit_label");
          $(replaceTarget).replaceWith(portfolioImg);
          portfolioImg.find("img").attr("src", e.target.result);
          portfolioBtn.removeClass("d-none");
        }
        return reader.readAsDataURL(editPortfolioFile);
      }
    })

    $(document).on("click", '#portfolio_edit_delete', function() {
      var portfolioBtn = $("#portfolio_edit_btn");
      var portfolioLabel = replaceImg();
      var replaceTarget = $("#portfolio_edit_frame");

      if (editPortfolioFile != "") {
        $(replaceTarget).replaceWith(portfolioLabel);
        portfolioBtn.addClass("d-none");
        editPortfolioFile = "";
      }
    });

    $('#portfolio_edit_submit').on("submit", function(e) {
      e.preventDefault();
      var formData = new FormData($(this).get(0));
      if (editPortfolioFile == "") {
        formData.append("portfolio[image]", "");
      } else {
        formData.append("portfolio[image]", editPortfolioFile);
        for (let value of formData.entries()) { 
        }
      };
      $.ajax({
        url:         "/portfolios/" + gon.portfolio_id,
        type:        "PATCH",
        data:        formData,
        contentType: false,
        processData: false,
      })
      .done(function(post){
        console.log(post);
      });
    });
  }
});