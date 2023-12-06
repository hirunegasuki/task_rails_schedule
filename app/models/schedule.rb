class Schedule < ApplicationRecord
    validates :name, presence: true, length: {maximum: 20}
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :memo, length: {maximum: 500}
    validate :date_check

    def date_check
        return false if end_date.blank? || start_date.blank?
        
        errors.add(:end_date, "は開始日以降の日付を指定ください") unless
        self.start_date <= self.end_date
    end

end
