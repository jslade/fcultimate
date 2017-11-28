TOOD:

notification / email senders
jobs - cron-based, or activejob?

test coverage - api
test coverage - web

manifest - how to do android icon?

player persistence
player identity

react-native



Player identification
=====================

Want to be able to have players automatically identified as "known" / repeat
players - prevent spamming / ghost player signups without require authentication

- Player records are persistent, and tied to each game.
- along with the player name, capture an identifying signature
  - IP
  - User Agent
  - ???
- each time a matching signature is used for a signup, the player provenance
  grows
- player provenance is shown in the UI as an icon, color, etc


SEO
===

How to make the game info searchable?




needed env for prod:
DB_ADDRESS=mysql.jkslade.net
DB_NAME=fcultimate_prod_2017
DB_USERNAME=fcultimate_db2
DB_PASSWORD=


What to do next:

  - See the documentation on https://github.com/rails/webpacker/blob/master/docs/webpack.md
    for how to customize the default webpack configuration.

  - Include your webpack assets to your application layout.

      <%= javascript_pack_tag 'hello-world-bundle' %>

  - Run `rails s` to start the Rails server and use Webpacker's default lazy compilation.

  - Visit http://localhost:3000/hello_world and see your React On Rails app running!

  - Run bin/webpack-dev-server to start the Webpack dev server for compilation of Webpack
    assets assets as soon as you save. This default setup with the dev server does not work
    for server rendering

  - Alternately, you may turn off compile in config/webpacker.yml and run the foreman
    command to start the rails server and run webpack in watch mode.

      foreman start -f Procfile.dev

  - To turn on HMR, edit config/webpacker.yml and set HMR to true. Restart the rails server
    and bin/webpack-dev-server. Or use Procfile.dev-server.

  - To server render, change this line app/views/hello_world/index.html.erb to
    `prerender: true` to see server rendering (right click on page and select "view source").

      <%= react_component("HelloWorldApp", props: @hello_world_props, prerender: true) %>
