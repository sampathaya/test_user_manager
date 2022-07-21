# frozen_string_literal: true

class Person < ApplicationRecord
  has_and_belongs_to_many :locations, join_table: 'locations_people'
  has_and_belongs_to_many :affiliations, join_table: 'affiliations_people'

  validates :name, :species, :gender, presence: true
end
