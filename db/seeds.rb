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
    name: "くまさんケーキ",
    price: 5000,
    description: "可愛いくまさんのチョコレートケーキ",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/choco.png')),
                  filename: 'choco.png')
item =Item.create(
    genre_id: genre_cake.id,
    name: "ユニコーンケーキ",
    price: 3000,
    description: "【JKに人気爆発中】SNSでも人気のデコレーションケーキです。",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/yuni.png')),
                  filename: 'yuni.png')
item =Item.create(
    genre_id: genre_cake.id,
    name: "リボンケーキ",
    price: 3500,
    description: "アニバーサリーを象徴とするショートケーキ",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/kawaii.png')),
                  filename: 'kawaii.png')
item =Item.create(
    genre_id: genre_cake.id,
    name: "ゴリラケーキ",
    price: 3500,
    description: " ゴリラさんファンのみなさま、おうち時間の癒しにいかがでしょうか？",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/gori.png')),
                  filename: 'gori.png')
                  


genre_okashi =Genre.create(name: "焼き菓子")
item =Item.create(
    genre_id: genre_okashi.id,
    name: "焼き菓子セット",
    price: 700,
    description: "【ホワイトデー限定商品】サクサクほろほろクッキー",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/yakiga.png')),
                  filename: 'yakiga.png')
item =Item.create(
    genre_id: genre_okashi.id,
    name: "ココロ焦がれる十勝の焼き菓子",
    price: 1200,
    description: "生クリームいっぱいのケーキもいいけれど、ついもう１個と手が伸びてしまう焼き菓子は、身近で心憎いスイーツ。",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/yakigashi.png')),
                  filename: 'yakigashi.png')
                  

genre_pudding =Genre.create(name: "プリン")
item =Item.create(
    genre_id: genre_pudding.id,
    name: "本格プリン",
    price: 1200,
    description: "注文殺到！希少な純国産ブランド卵を使ったまるでクリームみたいなもなめらかプリン",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/purin.png')),
                  filename: 'purin.png')
item =Item.create(
    genre_id: genre_pudding.id,
    name: "生いちごプリン",
    price: 450,
    description: "九州の食材がふんだんに使われた色鮮やかなプリン",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/taru.png')),
                  filename: 'taru.png')

genre_candy =Genre.create(name: "キャンディ")
item =Item.create(
    genre_id: genre_candy.id,
    name: "ホワイトデーMIX",
    price: 400,
    description: "【ホワイトデー限定商品】気軽に返せる！可愛いキャンディ",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/showtime1.png')),
                  filename: 'showtime1.png')
item =Item.create(
    genre_id: genre_candy.id,
    name: "祝キャンディ",
    price: 550,
    description: "結婚式のオリジナルプチギフトや卒園・入学のお祝い等にいかがでしょうか？",
    is_active: true)
    item.image.attach(io: File.open(Rails.root.join('app/assets/images/can.png')),
                  filename: 'can.png')