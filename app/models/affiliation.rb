class Affiliation < ApplicationRecord
    has_and_belongs_to_many :people, join_table: "affiliations_people"
end
