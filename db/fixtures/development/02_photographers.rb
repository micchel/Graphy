require 'fileutils'
Dir.chdir 'public/uploads/photographer/'
FileUtils.rm(Dir.glob('*.*'))

Photographer.seed do |s|
  s.id = 1
  s.email = 'p1@p1'
  s.password = 'p1p1p1'
  s.name = 'テスト太郎'
  s.sex_type = 0
  s.facebook_url = ""
  s.instagram_url = ""
  s.twitter_url = ""
  s.price = 15000
  s.self_introduction = "よろしくお願いいたします。"
  s.avatar = Rails.root.join("db/fixtures/pictures/photographer-male.jpg").open
end
Photographer.seed do |s|
  s.id = 2,
  s.email = 'p2@p2'
  s.password = 'p2p2p2'
  s.name = 'テスト壱子'
  s.sex_type = 1
  s.facebook_url = ""
  s.instagram_url = ""
  s.twitter_url = ""
  s.price = 15000
  s.self_introduction = "よろしくお願いいたします。"
  s.avatar = Rails.root.join("db/fixtures/pictures/photographer-female.jpg").open
end
Photographer.seed do |s|
  s.id = 3
  s.email = 'p3@p3'
  s.password = 'p3p3p3'
  s.name = 'テスト二郎'
  s.sex_type = 0
  s.facebook_url = ""
  s.instagram_url = ""
  s.twitter_url = ""
  s.price = 15000
  s.self_introduction = "よろしくお願いいたします。"
  s.avatar = Rails.root.join("db/fixtures/pictures/photographer-male.jpg").open
end
Photographer.seed do |s|
  s.id = 4
  s.email = 'p4@p4'
  s.password = 'p4p4p4'
  s.name = 'テスト弐子'
  s.sex_type = 1
  s.facebook_url = ""
  s.instagram_url = ""
  s.twitter_url = ""
  s.price = 15000
  s.self_introduction = "よろしくお願いいたします。"
  s.avatar = Rails.root.join("db/fixtures/pictures/photographer-female.jpg").open
end
Photographer.seed do |s|
  s.id = 5
  s.email = 'p5@p5'
  s.password = 'p5p5p5'
  s.name = 'テスト三郎'
  s.sex_type = 0
  s.facebook_url = ""
  s.instagram_url = ""
  s.twitter_url = ""
  s.price = 15000
  s.self_introduction = "よろしくお願いいたします。"
  s.avatar = Rails.root.join("db/fixtures/pictures/photographer-male.jpg").open
end
Photographer.seed do |s|
  s.id = 6
  s.email = 'p6@p6'
  s.password = 'p6p6p6'
  s.name = 'テスト参子'
  s.sex_type = 1
  s.facebook_url = ""
  s.instagram_url = ""
  s.twitter_url = ""
  s.price = 15000
  s.self_introduction = "よろしくお願いいたします。"
  s.avatar = Rails.root.join("db/fixtures/pictures/photographer-female.jpg").open
end
Photographer.seed do |s|
  s.id = 7
  s.email = 'p7@p7'
  s.password = 'p7p7p7'
  s.name = 'テスト四郎'
  s.sex_type = 0
  s.facebook_url = ""
  s.instagram_url = ""
  s.twitter_url = ""
  s.price = 15000
  s.self_introduction = "よろしくお願いいたします。"
  s.avatar = Rails.root.join("db/fixtures/pictures/photographer-male.jpg").open
end
Photographer.seed do |s|
  s.id = 8
  s.email = 'p8@p8'
  s.password = 'p8p8p8'
  s.name = 'テスト肆子'
  s.sex_type = 1
  s.facebook_url = ""
  s.instagram_url = ""
  s.twitter_url = ""
  s.price = 15000
  s.self_introduction = "よろしくお願いいたします。"
  s.avatar = Rails.root.join("db/fixtures/pictures/photographer-female.jpg").open
end
Photographer.seed do |s|
  s.id = 9
  s.email = 'p9@p9'
  s.password = 'p9p9p9'
  s.name = 'テスト五郎'
  s.sex_type = 0
  s.facebook_url = ""
  s.instagram_url = ""
  s.twitter_url = ""
  s.price = 15000
  s.self_introduction = "よろしくお願いいたします。"
  s.avatar = Rails.root.join("db/fixtures/pictures/photographer-male.jpg").open
end
Photographer.seed do |s|
  s.id = 10
  s.email = 'p10@p10'
  s.password = 'p10p10p10'
  s.name = 'テスト伍子'
  s.sex_type = 1
  s.facebook_url = ""
  s.instagram_url = ""
  s.twitter_url = ""
  s.price = 15000
  s.self_introduction = "よろしくお願いいたします。"
  s.avatar = Rails.root.join("db/fixtures/pictures/photographer-female.jpg").open
end
