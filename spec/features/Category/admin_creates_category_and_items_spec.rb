require 'spec_helper.rb'


describe 'admin creates a category with items' do 

 let(:user) {FactoryGirl.create(:user)}

  it 'creates a category' do
    visit new_user_registration_path 
    sign_up_as(user)
    visit category_path 
    expect(page).to have_content('Category')
  end 

end
