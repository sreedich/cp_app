require 'spec_helper'

describe 'add property' do 
before(:each) do 
  visit root_path 
  click_on 'Log In'
  fill_in 'Email', with: admin.email
  fill_in 'Password', with: admin.password 
  click_on 'Sign in' 
end

  let!(:admin){FactoryGirl.create(:admin)} 



  

  it 'admin adds a property' do 
    previous_count = Property.count 
    visit root_path
    click_on 'Add a New Property'
    fill_in 'Name', with: 'Kendall Square'
    fill_in 'Address', with: '173 Charles Street'
    fill_in 'City', with: 'Boston'
    select 'MA', from: 'State'
    fill_in 'Zip', with: '00000'
    click_on 'Submit'
    expect(Property.count).to eql(previous_count + 1)

  end 

end 
