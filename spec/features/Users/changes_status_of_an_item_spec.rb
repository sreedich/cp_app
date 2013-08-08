require 'spec_helper'

describe 'user changing status of an item' do
  
  context 'User is NOT an admin' do

    let(:user){ FactoryGirl.create(:user)}
    let(:item){ FactoryGirl.create(:item)}
    let(:category){item.category}
    before(:each) do 
      sign_up_as(user)
      item
    end

    it 'user can see list of items available within the house' do
      visit categories_path
      expect(page).to have_content(category.title)
      expect(page).to have_content(item.name)
    end

    it 'user can change the status of an item' do 
      visit categories_path
      click_button 'In Stock'
      visit categories_path
      expect(page).to have_button('Out of Stock')
    end


  end
end
