require 'rails_helper'

#RSpec.describe Batch, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end

describe ".pick_semi_random_color" do

    it "returns color" do
      expect(Batch.pick_semi_random_color).to eq("red").or(eq("yellow")).or(eq("green"))
    end
  end
