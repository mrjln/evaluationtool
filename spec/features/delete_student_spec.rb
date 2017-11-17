require 'rails_helper'
describe "Deleting a student " do
  before { login_as user }
  let(:user) {create :user}
  let(:thegreatestbatch) {create :batch}
  let!(:student) {create :student, batch: thegreatestbatch}
  let!(:evaluation) {create :evaluation, student: student, color:"green"}


feature 'Deleting a student from batch', js: true do
  scenario 'delete a student'do

    visit "batches/#{thegreatestbatch.id}"
    click_link 'Delete student'
    
    page.driver.browser.switch_to.alert.accept

    expect(page).not_to have_content(student.name)
  end
end
end
