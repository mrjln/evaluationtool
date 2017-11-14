Photo.destroy_all
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
   class1_student = Student.create!({
     name: Faker::HarryPotter.character,
     batch: batch1,
     })
  photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429094/vnud6lsbqpo8qxz4fgjb.jpg", student: class1_student)
 end

 10.times do |i|
    class2_student = Student.create!({
      name: Faker::LordOfTheRings.character,
      batch: batch2,
      })
  photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429095/yjrtzit5oii8jlhjh4wq.jpg", student: class2_student)
  end

  10.times do |i|
     class3_student = Student.create!({
       name: Faker::Pokemon.name,
       batch: batch3,
       })
   photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508427883/elf_cz311r.png", student: class3_student)
   end
