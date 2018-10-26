# frozen_string_literal: true

# TODO: This is specific to the listman email list manager as used by dreamhost,
# so it needs to be made flexible / configurable in some way...

require 'net/http'
require 'nokogiri'

class SubscriptionManager
  include Traceable

  attr_reader :game

  def initialize(game)
    @game = game
    trace "SubscriptionManager for game=#{game.name}"
  end

  def subscribe(email:, name:)
    trace "Subscribe: #{name} <#{email}>"
    do_request(
      url: game.subscribe_url,
      body: { email: email, fullname: name },
      expected: /has been received/o
    )
  end

  def unsubscribe(email:)
    trace "Unsubscribe: <#{email}"
    do_request(
      url: game.unsubscribe_url,
      body: { email: email },
      expected: /confirmation email has been sent/o
    )
  end

  private

  def do_request(url:, body:, expected:)
    return unless url

    trace "Request: #{url} #{body}"
    http_res = Net::HTTP.post_form(URI.parse(url), body)
    doc = Nokogiri::HTML(http_res.body)
    body = doc.css('body').to_s
    trace "Response: #{body}"

    return { ok: true } if body =~ expected
    { failed: true, response: body, url: url }
  end
end
