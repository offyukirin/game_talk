# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create([
    { name: 'アクション' },
    { name: 'シューティング' },
    { name: 'シミュレーション'},
    { name: 'レーシング'},
    { name: 'アドベンチャー'},
    { name: 'ロールプレイング'},
    { name: 'パズル'},
    { name: '音楽'},
    { name: 'カード'},
    ])

Admin.create!(email: 'game_talk_admin@test.com', password: 'password')

users = User.create!(
  [
    {email: 'olivia@test.com', name: 'Olivia', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@test.com', name: 'James', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@test.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'alice@test.com', name: 'Alice', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'chloe@test.com', name: 'Chloe', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
  ]
)

Post.create!(
  [
    {title: '最高率のレベル上げ', content: '学問所で経験値を買う。', user_id: users[0].id },
    {title: '召喚獣を手に入れろ', content: '召喚獣を入手すると戦闘が楽になります', user_id: users[1].id },
    {title: 'ラディカルビーム！！！', content: '草原のある位置で連打すると裏世界に行けます！', user_id: users[2].id },
    {title: '金策', content: 'バトルポイントでボールを買いショップで売る。', user_id: users[3].id },
    {title: '最強の剣の作り方', content: '溶岩地帯で手に入る鉱石がいい！', user_id: users[4].id }
  ]
)