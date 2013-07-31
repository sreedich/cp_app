require 'spec_helper'

describe 'user signs up for website' do
  
it 'user navigates to homepage' do 
visit root_path
expect(page).to have_content('Welcome CrashPadder!')
expect(page).to have_content('Log In')
expect(page).to have_content('Sign Up')
end

end
