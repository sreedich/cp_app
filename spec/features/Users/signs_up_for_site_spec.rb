require 'spec_helper'

describe 'user signs up for website' do
  
it 'user navigates to homepage' do 
visit root_path
expect(page).to have_content('Welcome CrashPadder!')
expect(page).to have_content('Log In')
expect(page).to have_content('Sign Up')
end

it 'user can sign up for website' do 
visit new_user_registration_path
expect(page).to have_content('First name')
expect(page).to have_content('Last name')
expect(page).to have_content('Email')
expect(page).to have_content('Password')

end

end
