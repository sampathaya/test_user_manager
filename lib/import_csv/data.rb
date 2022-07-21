# frozen_string_literal: true

module ImportCsv
  # this is to import person data
  class Data
    def initialize(attribute)
      @rows = attribute
    end

    def import
      @rows.each do |row|
        person = Person.new(row).create

        row['Location']&.split(',')&.each do |location|
          loc = ::Location.find_or_create_by(name: location.titleize)
          person.locations << loc
        end

        next unless row['Affiliations']

        row['Affiliations'].split(',').each do |affiliation|
          aff = ::Affiliation.find_or_create_by(name: affiliation)
          person.affiliations << aff
        end
      end
    end
  end
end
