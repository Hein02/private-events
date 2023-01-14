class Event < ApplicationRecord
  has_many :event_attendings, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendings, source: :attendee, dependent: :destroy
  belongs_to :creator, class_name: :User

  scope :past, -> { where('date <= ?', Time.now) }
  scope :upcoming, -> { where('date > ?', Time.now) }
end
