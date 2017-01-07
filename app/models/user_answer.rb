class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll
  # Remember to create a migration!
end
