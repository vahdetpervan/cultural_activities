# Cultural Activity Events

## Getting started
- `bundle install` to install gems.
- Ensure redis is up and running with Homebrew, otherwise run `brew install redis`.

### Ruby version
`2.7.2`

### Database seeding
To seed the database (specifically the `events` table), run `rails events:fetch`.

### UI

Start the rails server and visit `localhost:3000/events`. 
You can now view event data, as well as filter through them through
title, start date, end date and web source.

### Tests
`bundle exec rspec`
