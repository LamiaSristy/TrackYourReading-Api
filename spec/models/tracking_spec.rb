RSpec.describe Tracking, type: :model do
  describe 'Associations' do
    it { should belong_to(:book) }
  end
  describe 'validations' do
    it { should validate_presence_of(:date) }
  end  
end
