require 'spec_helper'

describe 'Admin adds a list item to a category' do 
let(:category){FactoryGirl.create(:category)}
  
  it 'adds a list item' do
    previous_count = Item.count
    category
    visit category_path(category.id) 
    fill_in 'Name', with: 'Soap'
    click_on 'Submit'
    expect(Item.count).to eql(previous_count + 1) 
  end 

end 
