I18n.locale = :ja

20.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  uid = Faker::Number.number(10)
  provider = Faker::Number.number(8)
  avatar = Faker::Avatar.image
  password = "password"
  User.create!(email: email,
               name: name,
               uid: uid,
               provider: provider,
               avatar: avatar,
               password: password,
               password_confirmation: password,
               )
end

e = 1
while e <= 20
  Topic.create(
    caption: "「犯人はヤス」",
    user_id: e,
  )
  e = e + 1
end

40.times do
  random = Random.new
  content = Faker::Pokemon.name
  Comment.create(
    user_id: random.rand(1..20),
    topic_id: random.rand(1..20),
    content: content,
  )
end
