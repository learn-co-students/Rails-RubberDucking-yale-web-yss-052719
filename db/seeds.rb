Student.destroy_all
Duck.destroy_all

10.times do
  Student.create(name: Faker::Name.name, mod: rand(1..5))
end

25.times do
  Duck.create(name: Faker::Dog.meme_phrase, description: Faker::Dog.breed, student: Student.all.sample)
end
