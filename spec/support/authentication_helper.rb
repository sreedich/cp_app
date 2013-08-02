module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email 
    fill_in 'Password', with: user.password 
    click_on 'Sign in'
  end 

  def sign_up_as(user)
    visit new_user_registration_path 
    fill_in 'Email', with: user.email 
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation 
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name 
    click_button 'Sign up'
  end
end 
