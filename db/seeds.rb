Photo.destroy_all
Comment.destroy_all
Evaluation.destroy_all
Student.destroy_all
Batch.destroy_all
User.destroy_all



#seed some users
marjo = User.create(email: "marjolein@emailadres.com", password: "abcd1234")


#seed batches
batch1 = Batch.create(
  number: 1,
  starts_at: Date.parse("2017-5-7").beginning_of_week,
  ends_at: Date.parse("2017-5-7").beginning_of_week + 5.days + 9.weeks)
batch2 = Batch.create(number: 2,
  starts_at: Date.parse("2017-8-7").beginning_of_week,
  ends_at: Date.parse("2017-8-7").beginning_of_week + 5.days + 9.weeks)
batch3 = Batch.create(number: 3,
  starts_at: Date.parse("2017-8-7").beginning_of_week,
  ends_at: Date.parse("2017-8-7").beginning_of_week + 5.days + 9.weeks)


#class to test evaluations on

student1 = Student.create!({name: Faker::HarryPotter.character, batch: batch1, evaluations: []})
 Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429094/vnud6lsbqpo8qxz4fgjb.jpg", student: student1)
student2 = Student.create!({ name: Faker::HarryPotter.character, batch: batch1, evaluations: [] })
Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429094/vnud6lsbqpo8qxz4fgjb.jpg", student: student2)
student3 = Student.create!({ name: Faker::HarryPotter.character, batch: batch1, evaluations: [] })
Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429094/vnud6lsbqpo8qxz4fgjb.jpg", student: student3)
student4 = Student.create!({ name: Faker::HarryPotter.character, batch: batch1, evaluations: [] })
Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429094/vnud6lsbqpo8qxz4fgjb.jpg", student: student4)
student5 = Student.create!({ name: Faker::HarryPotter.character, batch: batch1, evaluations: [] })
Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429094/vnud6lsbqpo8qxz4fgjb.jpg", student: student5)
student6 = Student.create!({ name: Faker::HarryPotter.character, batch: batch1, evaluations: [] })
Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429094/vnud6lsbqpo8qxz4fgjb.jpg", student: student6)
student7 = Student.create!({ name: Faker::HarryPotter.character, batch: batch1, evaluations: [] })
Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429094/vnud6lsbqpo8qxz4fgjb.jpg", student: student7)
student8 = Student.create!({ name: Faker::HarryPotter.character, batch: batch1, evaluations: [] })
Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429094/vnud6lsbqpo8qxz4fgjb.jpg", student: student8)
student9 = Student.create!({ name: Faker::HarryPotter.character, batch: batch1, evaluations: [] })
Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429094/vnud6lsbqpo8qxz4fgjb.jpg", student: student9)
student10 = Student.create!({ name: Faker::HarryPotter.character, batch: batch1, evaluations: [] })
Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508429094/vnud6lsbqpo8qxz4fgjb.jpg", student: student10)

red_evaluation_student1= Evaluation.create!({
  evaluation_date: Date.parse("2017-11-14"),
  color: "red",
  student: student1,
  comments: [Comment.create({content: "Dit is een test comment yay", user: marjo})]
  })

yellow_evaluation_student2= Evaluation.create!({
  evaluation_date: Date.parse("2017-11-14"),
  color: "yellow",
  student: student2
  })

green_evaluation_student3= Evaluation.create!({
  evaluation_date: Date.parse("2017-11-14"),
  color: "green",
  student: student3
  })

red_evaluation_student4= Evaluation.create!({
    evaluation_date: Date.parse("2017-11-14"),
    color: "red",
    student: student4
    })

yellow_evaluation_student5= Evaluation.create!({
      evaluation_date: Date.parse("2017-11-14"),
      color: "yellow",
      student: student5
      })


  green_evaluation_student6= Evaluation.create!({
  evaluation_date: Date.parse("2017-11-14"),
  color: "green",
  student: student6
  })

  red_evaluation_student7= Evaluation.create!({
      evaluation_date: Date.parse("2017-11-14"),
      color: "red",
      student: student7
      })

red_evaluation_student8= Evaluation.create!({
    evaluation_date: Date.parse("2017-11-14"),
    color: "red",
    student: student8
    })

red_evaluation_student9= Evaluation.create!({
    evaluation_date: Date.parse("2017-11-14"),
    color: "red",
    student: student9
    })

red_evaluation_student10= Evaluation.create!({
    evaluation_date: Date.parse("2017-11-14"),
    color: "red",
    student: student10
    })

    #end of seeds for testing evaluations

 10.times do |i|
    class2_student = Student.create!({
      name: Faker::LordOfTheRings.character,
      batch: batch2,
      evaluations:[],
      })
    photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508427883/elf_cz311r.png", student: class2_student)
  end


  10.times do |i|
     class3_student = Student.create!({
       name: Faker::Pokemon.name,
       batch: batch3,
       evaluations: [],
       })
     photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1510909979/jynx_hnborm.png", student: class3_student)
   end
