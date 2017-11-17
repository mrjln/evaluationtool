require 'rails_helper'
describe "Updating a student " do
  before { login_as user }
  let(:user) {create :user}
  let(:thegreatestbatch) {create :batch}
  let!(:student) {create :student, name: 'Gerbrand', batch: thegreatestbatch}
  let!(:evaluation) {create :evaluation, student: student, color:"green"}


feature 'Updating a student information - name ', js: true do
  scenario 'Click update a student'do

    visit "batches/#{thegreatestbatch.id}"
    click_link 'Update student'

    expect(page).not_to have_content(student.name)
    end
  end

  feature 'Updating student name ', js: true do
    scenario 'Add a new name'do

      visit "batches/#{thegreatestbatch.id}/students/#{student.id}/edit"
      fill_in 'Name', with: 'ditiseentestnaamextralang'
      page.execute_script("$('form').submit()")

      expect(page).to have_content('ditiseentestnaamextralang')
      end
    end


end
