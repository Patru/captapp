# encoding: UTF-8
require_relative 'integration_helper'

class CaptainIntegration < IntegrationSpec
  describe 'as an admin' do
    before do
      Capybara.reset_sessions!    # make sure we loose all the cookies (putting this in after will prevent screenshots)
      @dummy_admin = create_dummy_admin
      login_admin @dummy_admin, '12345xYz'
    end

    it 'can access an empty index' do
      visit '/admin/captain/index'
      current_path.must_equal '/admin/captain/index'
      page.must_have_title 'List of all captains'
      within 'table.captains' do
        wont_have_css 'tr'
      end
    end

    it 'can create a new captain and show it' do
      visit '/admin/captain/index'
      click_link 'New Captain'
      page.must_have_title 'Create a new captain'
      within 'form.captain' do
        fill_in 'Name', with:'first captain'
        fill_in 'Email:', with:'first@captain.org'
        fill_in 'Password', with: 'SchwapSchu'
        click_button 'Create'
      end
      current_path.must_match /\/admin\/captain/
      page.must_have_title 'Details for captain first captain'
      within 'nav.item' do
        must_have_link 'Edit'
      end
    end

    describe 'with an existing captain' do
      before do
        @cpt = Captain.new(name: 'test captain', email:'test@captain.org', password:'123abcDE')
        @cpt.save
      end

      it 'can edit the captains name' do
        visit @cpt.show_path
        click_link 'Edit'
        within 'form' do
          must_have_field 'Name', with:@cpt.name
          fill_in 'Name', with:'new name'
          click_button 'Save'
        end
        current_path.must_match '/admin/captain'
        within 'table.captain' do
          must_have_text 'new name'
          wont_have_text 'test captain'
        end
      end

      it 'validates the presence of the name' do
        visit @cpt.edit_path
        within 'form' do
          fill_in 'Name', with:''
          click_button 'Save'
        end
        within 'div.flash .error' do
          must_have_text 'captain could not be saved'
        end
        within 'div.error-messages' do
          must_have_text 'name is not present'
        end
      end

      it 'validates the presence of the email' do
        visit @cpt.edit_path
        within 'form' do
          fill_in 'Email', with:''
          click_button 'Save'
        end
        within 'div.error-messages' do
          must_have_text 'email is not present'
        end
      end
    end
  end

end
