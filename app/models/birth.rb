class Birth < ActiveRecord::Base
  belongs_to :users

  validate :due_date_acceptable

  private
    def due_date_acceptable
        errors.add("The due date", "must be between today and 300 days from now.") unless (Date.today...Date.today+300) === due_date
    end
end
