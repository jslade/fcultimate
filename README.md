# fcultimate

## What

Provides a website for managing pickup ultimate (and other sports) games. The
basic idea is: people go to the website in the morning before the game to sign
up and say they're ready to play. Prior to the game, the site sends out an email
to the accompanying mailing list whether the game is on (enough people signed
up) or not.

This is used primarily for a twice-weekly pickup game at the HP campus in Fort
Collins, CO, a game that has been running continuously for over twenty years.
This is now the third iteration of the signup website.

## Why

This app was built for [fcultimate.net](http://fcultimate.net), replacing an old
version based on rails 2, last updated in 2009. The goal with the remake was to
use some newer technologies, focusing more on the UI, and also to build it such
that it could potentially be used as a white-label product to let other people
embed the signup functonality into their own websites.

To that end, it is split into an API backend in Rails, and a (for now at least)
a web frontend using React. The backend is totally site-agnostic and could
easily be repurposed for someone with similar needs

## api/

### Rails

Rails 5 backend

Initially setup following
[this tutorial](https://medium.com/superhighfives/a-top-shelf-web-stack-rails-5-api-activeadmin-create-react-app-de5481b7ec0b),
though I ended up deviating from it a lot. I should go back and see if I can get
ActiveAdmin to work now with an API-only rails setup? Or how to clean up all the
extra cruft I got by doing `rails new --webpack`. But having `ActiveAdmin` for
the admin side (creating content blocks and game definitions) is definitely
notice

### Defining Games

Using the `ActiveAdmin` interface (`http://yourdomain.com/admin`), games can be
easily created or edited.

### Defining Content blocks

The backend provides a very rudimentary CMS capability for defining the text
blocks rendered in the frontend. Each text block is defined by a `Content`
record on the backend. Each `Content` is uniquely named, and can contain
markdown-formatted text to render when embedded in the UI using the `<Content>`
component.

The API only provides read access to the content blocks, via `GET
/api/content/:name`. Creating and editing the blocks must be done via the
`ActiveAdmin` Interface

## web/

The web frontend was created with `create-react-app` which made it very easy to
get going. I haven't had to `eject` yet, but that may come soon.

`Bootstrap` is used for the UI components / styling / theming, though that is an
area I'm still pretty weak at, so it is not all very clean yet.

## Development

## Deployment

There are no credentials stored in the code. The only credentials currently
required for using the app are for the admin interface, and the initial admin
user must be seeded manually...

### fcultimate.net

`fcultimate.net` is hosted by [Heroku](heroku.com) on a free-dev plan.

#### Sendgrid add-on

```bash
heroku addons:create sendgrid:starter
```

#### Scheduler add-on

```bash
heroku addons:create scheduler:standard
```

## White-label / Embedding

The goal is to provide the API as a service, and an `npm` package with the
necessary UI components for others to potentially use these facilities to manage
registrations for whatever other pickup games they want.

### Existing sites / 'competition'

## TODO
