class Record < ApplicationRecord
  belongs_to :user
  belongs_to :recorder, class_name: 'Recorder', foreign_key: 'recorder_id', optional: true  # Recorderとの関連に修正
  belongs_to :flight_category, optional: false
end
