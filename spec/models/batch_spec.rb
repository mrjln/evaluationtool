require 'rails_helper'

#RSpec.describe Batch, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end

describe ".pick_semi_random_color" do
  let(:batch) {create :batch}

    it "returns color" do
      expect(batch.pick_semi_random_color).to eq("red").or(eq("yellow")).or(eq("green"))
    end
  end

  describe ".return_percentage" do
    let(:batch) {create :batch}
    let(:student1) { create :student, batch: batch }
    let(:student2) { create :student, batch: batch }
    let(:student3) { create :student, batch: batch }
    let(:student4) { create :student, batch: batch }

    let(:evaluation) { create :evaluation, color: "red", student: student1 }
    let(:evaluation) { create :evaluation, color: "red", student: student2 }
    let(:evaluation) { create :evaluation, color: "yellow", student: student3 }
    let(:evaluation) { create :evaluation, color: "green", student: student4 }

      it "returns percentage of students with the color red, yellow or blue" do
        expect(batch.return_percentage("red")).to be_a(integer) 
      end
    end
