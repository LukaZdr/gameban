require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'earning xp' do
    let!(:user_1) { create(:user, xp: 0) }
    let!(:user_2) { create(:user, xp: 4) }
    let!(:user_3) { create(:user, xp: 5) }

    it 'updates the users xp' do
      expect(user_1.xp).to eq(0)
      user_1.gain_xp(2)
      expect(user_1.xp).to eq(2)
    end

    context 'when passing another user' do
      it 'makes the other users tendency negative' do
        expect(user_2.tendency).to eq(0)
        expect(user_3.tendency).to eq(0)
        user_1.gain_xp(4)
        expect(user_2.tendency).to eq(-1)
        expect(user_3.tendency).to eq(-1)
      end
      it 'makes users tendency positive'
    end

    context 'when not passing anyone' do
      it 'makes users tendency neutral' do
        user = create(:user, tendency: 1)
        user.gain_xp(1)
        expect(user.tendency).to eq(0)
      end

      it 'doesnt change other users tendency' do
        print(user_1.tendency)
        print(user_2.tendency)
        expect(user_3.tendency).to eq(0)
      end
    end
  end
end
