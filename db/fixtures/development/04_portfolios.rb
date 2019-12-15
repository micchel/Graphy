# require 'fileutils'
# Dir.chdir 'public/uploads/portfolio'
# FileUtils.rm(Dir.glob('*.*'))

Portfolio.seed(:id,
  { id: 1, photographer_id: 1, category_id: 1, image: Rails.root.join("db/fixtures/pictures/portfolio-family.jpg").open },
  { id: 2, photographer_id: 1, category_id: 2, image: Rails.root.join("db/fixtures/pictures/portfolio-cupple.jpg").open },
  { id: 3, photographer_id: 1, category_id: 3, image: Rails.root.join("db/fixtures/pictures/portfolio-friends.jpg").open },
  { id: 4, photographer_id: 1, category_id: 4, image: Rails.root.join("db/fixtures/pictures/portfolio-profile.jpg").open },
  { id: 5, photographer_id: 1, category_id: 5, image: Rails.root.join("db/fixtures/pictures/portfolio-pet.jpg").open },
  { id: 6, photographer_id: 1, category_id: 6, image: Rails.root.join("db/fixtures/pictures/portfolio-event.jpg").open },
  { id: 7, photographer_id: 2, category_id: 1, image: Rails.root.join("db/fixtures/pictures/portfolio-family.jpg").open },
  { id: 8, photographer_id: 2, category_id: 2, image: Rails.root.join("db/fixtures/pictures/portfolio-cupple.jpg").open },
  { id: 9, photographer_id: 2, category_id: 3, image: Rails.root.join("db/fixtures/pictures/portfolio-friends.jpg").open },
  { id: 10, photographer_id: 2, category_id: 4, image: Rails.root.join("db/fixtures/pictures/portfolio-profile.jpg").open },
  { id: 11, photographer_id: 2, category_id: 5, image: Rails.root.join("db/fixtures/pictures/portfolio-pet.jpg").open },
  { id: 12, photographer_id: 2, category_id: 6, image: Rails.root.join("db/fixtures/pictures/portfolio-event.jpg").open },
  { id: 13, photographer_id: 3, category_id: 1, image: Rails.root.join("db/fixtures/pictures/portfolio-family.jpg").open},
  { id: 14, photographer_id: 3, category_id: 2, image: Rails.root.join("db/fixtures/pictures/portfolio-cupple.jpg").open },
  { id: 15, photographer_id: 3, category_id: 3, image: Rails.root.join("db/fixtures/pictures/portfolio-friends.jpg").open },
  { id: 16, photographer_id: 3, category_id: 4, image: Rails.root.join("db/fixtures/pictures/portfolio-profile.jpg").open },
  { id: 17, photographer_id: 3, category_id: 5, image: Rails.root.join("db/fixtures/pictures/portfolio-pet.jpg").open },
  { id: 18, photographer_id: 3, category_id: 6, image: Rails.root.join("db/fixtures/pictures/portfolio-event.jpg").open },
  { id: 19, photographer_id: 4, category_id: 1, image: Rails.root.join("db/fixtures/pictures/portfolio-family.jpg").open},
  { id: 20, photographer_id: 4, category_id: 2, image: Rails.root.join("db/fixtures/pictures/portfolio-cupple.jpg").open},
  { id: 21, photographer_id: 4, category_id: 3, image: Rails.root.join("db/fixtures/pictures/portfolio-friends.jpg").open  },
  { id: 22, photographer_id: 4, category_id: 4, image: Rails.root.join("db/fixtures/pictures/portfolio-profile.jpg").open },
  { id: 23, photographer_id: 4, category_id: 5, image: Rails.root.join("db/fixtures/pictures/portfolio-pet.jpg").open },
  { id: 24, photographer_id: 4, category_id: 6, image: Rails.root.join("db/fixtures/pictures/portfolio-event.jpg").open },
  { id: 25, photographer_id: 5, category_id: 1, image: Rails.root.join("db/fixtures/pictures/portfolio-family.jpg").open},
  { id: 26, photographer_id: 5, category_id: 2, image: Rails.root.join("db/fixtures/pictures/portfolio-cupple.jpg").open },
  { id: 27, photographer_id: 5, category_id: 3, image: Rails.root.join("db/fixtures/pictures/portfolio-friends.jpg").open },
  { id: 28, photographer_id: 5, category_id: 4, image: Rails.root.join("db/fixtures/pictures/portfolio-profile.jpg").open },
  { id: 29, photographer_id: 5, category_id: 5, image: Rails.root.join("db/fixtures/pictures/portfolio-pet.jpg").open },
  { id: 30, photographer_id: 5, category_id: 6, image: Rails.root.join("db/fixtures/pictures/portfolio-event.jpg").open },
  { id: 31, photographer_id: 6, category_id: 1, image: Rails.root.join("db/fixtures/pictures/portfolio-family.jpg").open },
  { id: 32, photographer_id: 6, category_id: 2, image: Rails.root.join("db/fixtures/pictures/portfolio-cupple.jpg").open },
  { id: 33, photographer_id: 6, category_id: 3, image: Rails.root.join("db/fixtures/pictures/portfolio-friends.jpg").open  },
  { id: 34, photographer_id: 6, category_id: 4, image: Rails.root.join("db/fixtures/pictures/portfolio-profile.jpg").open  },
  { id: 35, photographer_id: 6, category_id: 5, image: Rails.root.join("db/fixtures/pictures/portfolio-pet.jpg").open },
  { id: 36, photographer_id: 6, category_id: 6, image: Rails.root.join("db/fixtures/pictures/portfolio-event.jpg").open }
)