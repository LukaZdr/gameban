require 'rails_helper'

RSpec.describe Sprint, type: :model do
  describe 'validations' do
    it 'is valid with destinct qualities' do
      user = build(:sprint, quality_1: 'a',
                      quality_2: 'b',
                      quality_3: 'c',
                      quality_4: 'd',
                      quality_5: 'e')
      expect(user).to be_valid
    end

    it 'is not valid with duplicate qualities' do
      user = build(:sprint, quality_1: 'a',
                            quality_2: 'a')
      expect(user).not_to be_valid
    end
  end
end