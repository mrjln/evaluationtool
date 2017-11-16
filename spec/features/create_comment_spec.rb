require 'rails_helper'

  describe "Adding a new comment to an evaluation " do
    before { login_as user }

   let(:user) { create :user}
    let(:batch) {create :batch}
    let(:student) {create :student, batch: batch}
    let(:evaluation) {create :evaluation, student: student}
    let(:evaluation) {create :evaluation, student: student}

  feature 'Create new evaluation for student', js: true do
    scenario 'add a new evaluation to student' do

      visit "batches/#{batch.id}/students/#{student.id}"
      fill_in "Add a comment", with: 'ditiseentesteenhelelangtekstomdatdatgoedisomtetesten'
      click_link_or_button "Add Comment to this evaluation"
      expect(page).to have_content('ditiseentesteenhelelangtekstomdatdatgoedisomtetesten')

    end
  end
end
