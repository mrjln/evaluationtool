require 'rails_helper'

  describe "Adding a new comment to an evaluation " do
    let(:batch) {create :batch}
    let(:student) {create :student, batch: batch}

  feature 'Create new evaluation for student', js: true do
    scenario 'add a new evaluation to student' do

      visit "batches/#{batch.id}/students/#{student.id}"
      fill_in 'Add a comment', with: 'ditiseentesteenhelelangtekstomdatdatgoedisomtetesten'
      page.execute_script("$('form').submit()")

      expect(page).to have_content('ditiseentesteenhelelangtekstomdatdatgoedisomtetesten')

    end
  end
end
