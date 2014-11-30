committed
=========

[![Dependency Status](https://img.shields.io/gemnasium/akerl/committed.svg)](https://gemnasium.com/akerl/committed)
[![Code Climate](https://img.shields.io/codeclimate/github/akerl/committed.svg)](https://codeclimate.com/github/akerl/committed)
[![Coverage Status](https://img.shields.io/coveralls/akerl/committed.svg)](https://coveralls.io/r/akerl/committed)
[![Build Status](https://img.shields.io/travis/akerl/committed.svg)](https://travis-ci.org/akerl/committed)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Application to quickly check GitHub commit streak information

## Usage

To run this locally, `bundle install` to get the dependencies and then `bundle exec thin start`. This will start the webserver up locally. To specify a custom port, use `bundle exec thin start -p PORT`.

I run this on heroku, at https://akerl-committed.herokuapp.com/

It has an endpoint that responds with Twilio's TwiML, allowing this to respond to text messages with commit information. To set this up, just run it somewhere public and point your Twilio number's SMS endpoint to `https://example.com/sms/`

## License

committed is released under the MIT License. See the bundled LICENSE file for details.

