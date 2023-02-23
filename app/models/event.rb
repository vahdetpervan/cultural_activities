# frozen_string_literal: true

class Event < ApplicationRecord
  def self.ransackable_attributes(_auth_object = nil)
    %w[title start_date end_date web_source]
  end
end
