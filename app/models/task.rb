class Task < ActiveRecord::Base
  belongs_to :user

  scope :incompleted, -> { where('is_completed=false') }
  scope :completed,   -> { where('is_completed=true') }

  validates :title, presence: true
  validates :priority, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :due_date, presence: true, if: :is_future_date?

  before_validation :date_is_nil?
  
  before_save do
    self.is_completed = false if is_completed.nil?
    true
  end

protected
  def date_is_nil?
    if due_date.nil?
      errors.add(:due_date, "not a valid date!")
      false
    end
  end

  def is_future_date?
    errors.add(:due_date, "must be future date!") unless due_date > Time.now
  end

end
