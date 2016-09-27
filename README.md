committed
=========

[![Dependency Status](https://img.shields.io/gemnasium/akerl/committed.svg)](https://gemnasium.com/akerl/committed)
[![Build Status](https://img.shields.io/circleci/project/akerl/committed/master.svg)](https://circleci.com/gh/akerl/committed)
[![Coverage Status](https://img.shields.io/codecov/c/github/akerl/committed.svg)](https://codecov.io/github/akerl/committed)
[![Code Quality](https://img.shields.io/codacy/4bbc0285042f48049c16938ef2d395e0.svg)](https://www.codacy.com/app/akerl/committed)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Application to quickly check GitHub commit streak information

## Usage

To run this locally, `bundle install` to get the dependencies and then `bundle exec thin start`. This will start the webserver up locally. To specify a custom port, use `bundle exec thin start -p PORT`.

I've written a Docker container for this: [dock0/committed](https://github.com/dock0/committed).

It has an endpoint that responds with Twilio's TwiML, allowing this to respond to text messages with commit information. To set this up, just run it somewhere that Twilio can hit it and point your Twilio number's SMS endpoint to `http://example.com/sms/`

### SMS commands

(all commands are case insensitive)

* `user NAME` -- will check commits for NAME on github and return their results
* `register NAME` -- will register your user name for your phone number, so the server knows to default to your username for your future requests
* Anything else -- will respond with results for your username (set via `register NAME`) or the app's global default user

## License

committed is released under the MIT License. See the bundled LICENSE file for details.

