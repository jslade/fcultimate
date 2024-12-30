# frozen_string_literal: true
require 'redcarpet'

class ServerSideGamesController < ApplicationController
    include Concerns::WithGame
  
    def show
      game
      markdown
    end

    private

    # TODO: Move to Concerns::WithMarkdown ?
    def markdown
        @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end
  end
  