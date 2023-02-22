# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email:"patriot@example.com", password:"asdfgh")

genre_cake =Genre.create(name: "ケーキ")
item =Item.create(
    genre_id: genre_cake.id,
    name: "チョコケーキ",
    price: 5000,
    description: "可愛いくまさんのチョコレートケーキ",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/choco.png')),
                  filename: 'choco.png')


genre_okashi =Genre.create(name: "焼き菓子")
item =Item.create(
    genre_id: genre_okashi.id,
    name: "焼き菓子セット",
    price: 700,
    description: "【ホワイトデー限定商品】サクサクほろほろクッキー",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/yakiga.png')),
                  filename: 'yakiga.png')

genre_pudding =Genre.create(name: "プリン")
item =Item.create(
    genre_id: genre_pudding.id,
    name: "本格プリン",
    price: 1200,
    description: "昔ながらのシンプルな味",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/purin.png')),
                  filename: 'purin.png')
item =Item.create(
    genre_id: genre_pudding.id,
    name: "焼きプリン",
    price: 200,
    description: "美味しいプリン",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/pudding.png')),
                  filename: 'pudding.png')

genre_candy =Genre.create(name: "キャンディ")
item =Item.create(
    genre_id: genre_candy.id,
    name: "ホワイトデーMIX",
    price: 400,
    description: "【ホワイトデー限定商品】気軽に返せる！可愛いキャンディ",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/showtime1.png')),
                  filename: 'showtime1.png')