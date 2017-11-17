require 'rails_helper'
describe "Deleting a student " do
  before { login_as user }
  let(:user) {create :user}
  let(:batch) {create :batch}
  let(:student) {create :student, batch: batch}

feature 'Deleting a student from batch', js: true do
  scenario 'delete a student'do

    visit "batches/#{batch.id}"
    click_link 'Delete student'

    expect(page).not_to have_content(student.name)
  end
end
end
