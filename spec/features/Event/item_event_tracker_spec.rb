require 'spec_helper'

describe 'event change is recorded' do 
 before(:each) do 
    sign_up_as(user)
    visit new_category_path 
    category 
    visit category_path(category)
  end

  let(:user) {FactoryGirl.create(:user)}
  let(:category) {FactoryGirl.create(:category)}

  it 'Event is created once an item is created' do 
    previous_count = Event.count
    fill_in 'Name', with: 'Paper Towels'
    click_on 'Submit'
    expect(Event.count).to eql(previous_count + 1)
    expect(Item.last.created_at).to eql(Item.last.events.first.time)
  end 

  it 'When an items status has changed a new event is created' do
    fill_in 'Name', with: 'Paper Towels'
    click_on 'Submit'
    previous_count = Event.count
    visit categories_path
    click_on 'In Stock'
    expect(Event.count).to eql(previous_count + 1)
    expect(Item.last.updated_at).to eql(Item.last.events.last.time)
    expect(Item.last.state).to eql(Event.last.state)
  end

end 
