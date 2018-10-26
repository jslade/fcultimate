# frozen_string_literal: true

ActiveAdmin.register Notification do
  permit_params \
    :game_id,
    :what,
    :sent_at
end
