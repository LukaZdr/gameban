require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'earning xp' do
    let(:user_1) { create(:user, xp: 0) }
    let(:user_2) { create(:user, xp: 1) }
    let(:user_3) { create(:user, xp: 2) }

    it 'updates the users xp' do
      expect(user_1.xp).to eq(0)
      user_1.gain_xp(2)
      expect(user_1.xp).to eq(2)
    end

    context 'when passing another user' do
      it 'makes the other users tendency negative' do
        expect(user_2.tendency).to eq(0)
        expect(user_3.tendency).to eq(0)
        user_1.gain_xp(3)
        expect(user_2.tendency).to eq(-1)
        expect(user_3.tendency).to eq(-1)
      end
      it 'makes users tendency positive'
    end

    context 'when not passing anyone' do
      it 'makes users tendency neutral'
      it 'doesnt change other users tendency'
    end
  end
end
