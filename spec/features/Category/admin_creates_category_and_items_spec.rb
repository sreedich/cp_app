require 'spec_helper.rb'


describe 'admin creates a category with items' do 
  before(:each) do 
    sign_up_as(user)
    visit new_category_path 
  end

 let(:user) {FactoryGirl.create(:user)}

  it 'visit category' do
    expect(page).to have_content('Category')
  end 

   it 'creates a category' do
    previous_count = Category.count 
    fill_in 'Title', with: 'Kitchen'
    click_on 'Submit'
    expect(Category.count).to eql(previous_count + 1)
  end 

  it 'list categories on index page' do
    fill_in 'Title', with: 'Kitchen'
    click_on 'Submit'
    expect(page).to have_content('Kitchen')
  end 


end
