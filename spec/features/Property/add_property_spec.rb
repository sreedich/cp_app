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
  let(:property){FactoryGirl.create(:property)}
 

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
    expect(current_path).to eql(properties_path)
  end 

  it 'admin sees list of properties' do 
    property 
    visit properties_path
    expect(page).to have_content(property.name)
  end 

  it 'admin navigates to property page' do
    property 
    visit properties_path
    click_on 'Edit'
    expect(page).to have_content('Add a Category')
  end 

  it 'admin adds property category' do
    previous_count = Category.count 
    visit property_path(property)
    click_on 'Add a Category'
    fill_in 'Title', with: 'Bathroom'
    click_on 'Submit'
    expect(Category.count).to eql(previous_count + 1)
  end 

  it 'display list of categories on property page' do 
    visit property_path(property)
    click_on 'Add a Category'
    fill_in 'Title', with: 'Bathroom'
    click_on 'Submit'
    expect(page).to have_content(property.categories.last.title)
  end 

end 
