class Task < ActiveRecord::Base
  belongs_to :user

  scope :incompleted, -> { where('is_completed=false') }
  scope :completed,   -> { where('is_completed=true') }
end

