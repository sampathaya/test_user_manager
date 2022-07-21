# frozen_string_literal: true

module ImportCsv
  # this is to import person data
  class Person
    def initialize(row)
      @name = row['Name'].titleize
      @species = row['Species']
      @gender = validate_gender(row['Gender'])
      @weapon = row['Weapon']
      @vehicle = row['Vehicle']
    end

    def create
      ::Person.find_or_create_by({ 
        name: @name,
        species: @species,
        gender: @gender,
        weapon: @weapon,
        vehicle: @vehicle 
      })
    end

    private

    def validate_gender(gender)
      return nil unless gender

      case gender.downcase
      when 'male', 'm'
        'Male'
      when 'female', 'f'
        'Female'
      when 'other'
        'Other'
      end
    end
  end
end
