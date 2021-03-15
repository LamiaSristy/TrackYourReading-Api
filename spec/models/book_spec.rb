require 'rails_helper';

RSpec.describe Book, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:trackings).dependent(:destroy) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
