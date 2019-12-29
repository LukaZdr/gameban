require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'validations' do
    it 'factory is valid' do
      ticket = build(:ticket)
      expect(ticket).to be_valid
    end

    context 'is not valid'
    it 'with status or priorities that is not in list ' do
      ticket1 = build(:ticket, status: 'foo')
      ticket2 = build(:ticket, priority: 'bar')
      expect(ticket1).not_to be_valid
      expect(ticket2).not_to be_valid
    end
  end

  describe 'status changes' do
    it 'next' do
      ticket = create(:ticket, status: 'Backlog')
      expect(ticket.status).to eq('Backlog')
      ticket.next_status
      expect(ticket.status).to eq('Todo')
      ticket.next_status
      expect(ticket.status).to eq('In progress')
      ticket.next_status
      expect(ticket.status).to eq('Quality Assurance')
      ticket.next_status
      expect(ticket.status).to eq('Done')
    end

    it 'previous' do
      ticket = create(:ticket, status: 'Done')
      expect(ticket.status).to eq('Done')
      ticket.previous_status
      expect(ticket.status).to eq('Quality Assurance')
      ticket.previous_status
      expect(ticket.status).to eq('In progress')
      ticket.previous_status
      expect(ticket.status).to eq('Todo')
      ticket.previous_status
      expect(ticket.status).to eq('Backlog')
    end
  end
end