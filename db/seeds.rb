10.times do |n|
  User.create!(
    name: FFaker::Name.name,
    email: FFaker::Internet.email,
    password: "Abc123123",
    password_confirmation: "Abc123123",
    activated: true,
    activated_at: Time.zone.now
  )
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
