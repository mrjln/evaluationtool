require 'rails_helper'

  describe "Adding a new student " do
    let(:batch) {create :batch}
    let(:student) {create :student, batch: batch}

  feature 'Create new evaluation for student', js: true do
    scenario 'add a new evaluation to student' do

      visit "batches/#{batch.id}/students/#{student.id}"
      select "green", :from => "evaluation_color"
      page.execute_script("$('form').submit()")

      page.find_by_id('green')

    end
  end
end
