require 'rails_helper'

  describe "Adding a new batch " do

  feature 'Create new batch', js: true do
    scenario 'add a new batch do'do

      visit "batches/new"
      fill_in 'Batch Number', with: '100001'
      page.execute_script("$('form').submit()")

      expect(page).to have_content('100001')
    end
  end
end
