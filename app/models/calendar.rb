class Calendar < ActiveRecord::Base
  validates :current_day_id, presence: true
  validates :date, presence: true

  def make_current
    old_date = date
    new_date = Date.today
    self.update(date: new_date)
    (old_date..new_date).each do |d|
      unless d.wday == 0 || d.wday == 6
        current_day_id = (current_day_id + 1) % 0
      end
    end
  end
end