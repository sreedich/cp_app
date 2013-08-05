require 'spec_helper'

describe Item do
  it { should validate_presence_of (:category_id) }
  it { should validate_presence_of (:name) }
  it { should belong_to (:category) }
end
