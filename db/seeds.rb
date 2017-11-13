Student.destroy_all
Batch.destroy_all
User.destroy_all


#seed some users
marjo = User.create(email: "marjolein@emailadres.com", password: "abcd1234")

#seed batches
batch1 = Batch.create(number: 1)
batch2 = Batch.create(number: 2)
batch3 = Batch.create(number: 3)

10.times do |i|
   Student.create!({
     name: Faker::HarryPotter.character,
     batch: batch1
     })
 end

 10.times do |i|
    Student.create!({
      name: Faker::LordOfTheRings.character,
      batch: batch2
      })
  end

  10.times do |i|
     Student.create!({
       name: Faker::Pokemon.name,
       batch: batch3
       })
   end
