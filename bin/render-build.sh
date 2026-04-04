#!/usr/bin/env bash
set -o errexit

bundle install
npm install
npm run build
bundle exec rails db:migrate
RAILS_ENV=production bundle exec rails runner "puts 'App loads OK'"