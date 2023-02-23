# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '.ransackable_attributes' do
    it 'returns an array of queryable attributes' do
      expect(Event.ransackable_attributes).to eq(%w[title start_date end_date web_source])
    end
  end
end
