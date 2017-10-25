ActiveAdmin.register Game do
  permit_params \
    :brief,
    :description,
    :early_email_time,
    :email_time,
    :game_day_time,
    :game_days,
    :game_time,
    :location,
    :name,
    :min_team_size,
    :notify_address,
    :signup_time,
    :subscribe_url,
    :unsubscribe_url
end
