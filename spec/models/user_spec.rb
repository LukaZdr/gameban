require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'earning xp' do
    let(:user_1) { create(:user) }
    it 'updates the users xp' do
      print('laa')
      user_1
    end
    context 'when passing another user' do
      it 'makes the other users tendency negative'
      it 'makes users tendency positive'
    end
    context 'when not passing anyone' do
      it 'makes users tendency neutral'
      it 'doesnt change other users tendency'
    end
  end
end
