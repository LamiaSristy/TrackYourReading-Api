require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:books).dependent(:destroy) }
  end
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:username).is_at_least(4) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
