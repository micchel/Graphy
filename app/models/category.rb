class Category < ActiveHash::Base
  self.data = [
      {id: 1, name: 'ファミリー'}, {id: 2, name: 'カップル'}, {id: 3, name: '友達'},
      {id: 4, name: 'プロフィール'}, {id: 5, name: 'ペット'}, {id: 6, name: 'イベント'}
  ]
end
