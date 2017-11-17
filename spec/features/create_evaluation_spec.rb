require 'rails_helper'

  describe "Adding a new evaluation" do
    before { login_as user }

    let(:user) { create :user}
    let!(:batch) {create :batch}
    let!(:student) {create :student, batch: batch}

  feature 'Create new evaluation for student', js: true do
    scenario 'add a new evaluation to student' do

      visit "batches/#{batch.id}/students/#{student.id}"
      select "green", :from => "evaluation_color"
      select "2017/16/11", :from => "evaluation_date"

      click_button("Add-evaluation")
    end
  end
end
