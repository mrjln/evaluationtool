require 'rails_helper'

  describe "Adding a new student " do
    before { login_as user }
    let(:user) {create :user}
    let(:batch) {create :batch}

  feature 'Create new student in batch', js: true do
    scenario 'add a new student do'do

      visit "batches/#{batch.id}/students/new"
      fill_in 'Name', with: 'ditiseentestnaamextralang'
      page.execute_script("$('form').submit()")

      expect(page).to have_content('ditiseentestnaamextralang')
    end
  end
end
