class Question < ActiveRecord::Base
  has_many :options
  belongs_to :poll
  # Remember to create a migration!
end
