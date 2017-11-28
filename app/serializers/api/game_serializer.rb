# frozen_string_literal: true

module Api
  class GameSerializer < ActiveModel::Serializer
    attributes \
      :id,
      :name,
      :brief,
      :description,
      :location,
      :max_team_size,
      :min_team_size,
      :curr_team_size,
      :signups,
      :status,
      :notify_address,
      :subscribe_url,
      :unsubscribe_url

    def signups
      object.sorted_signups.map do |su|
        {
          id: su.id,
          name: su.player.name,
          team_size: su.team_size,
          comment: su.comment
        }
      end
    end
  end
end
