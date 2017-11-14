#This is a spec file to run in Rspec, test the batches view

require 'rails_helper'

describe "Batches/Classes view" do
    let(:batch1) { create :batch, number: 101 }
    let(:batch2) { create :batch, number: 202 }

    it "shows all Batches" do
      visit "/batches"
      render
      expect(rendered).to have_content batch1.number
      expect(rendered).to have_content batch1.number
    end
  end
