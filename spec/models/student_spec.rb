require 'rails_helper'

#RSpec.describe Student, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end
describe "association with batch" do
  let(:batch) { create :batch }

  it "student belongs to a batch" do
    student = batch.students.build(batch: batch )

    expect(student.batch).to eq(batch)
  end
end
