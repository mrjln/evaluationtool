require 'rails_helper'

#RSpec.describe Evaluation, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end

describe "association with student" do
  let(:student) { create :student }

  it "evaluation belongs to a student" do
    photo = student.photos.build()

    expect(photo.student).to eq(student)
  end
end
