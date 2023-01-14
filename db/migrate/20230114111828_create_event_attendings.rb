class CreateEventAttendings < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendings do |t|
      t.references :attendee, references: :users, index: true
      t.references :attended_event, references: :events, index: true

      t.timestamps
    end
  end
end
