FactoryGirl.define do 
  factory :user do
    
    sequence :email do |n|
      "TomH#{n}@gmail.com"
    end

    password '0u23fwljr2392'
    password_confirmation '0u23fwljr2392'
    first_name 'Tom'
    last_name 'Haverford'
  end
end