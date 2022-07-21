class Location < ApplicationRecord
    has_and_belongs_to_many :people, join_table: "locations_people"
end
