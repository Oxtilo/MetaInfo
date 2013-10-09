# MetaInfo

Simple gem for extracting meta information from web page using opengraph tags, twitter cards tags or normal meta tags

## Installation

Add this line to your application's Gemfile:

    gem 'meta_info'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install meta_info

## Usage

document = MetaInfo.parse(open("http://www.rottentomatoes.com/m/1217700-kick_ass/").read)

document.title       => "Kick-Ass"

document.description => "Not for the faint of heart, Kick-Ass takes the comic adaptation genre to new levels of visual style, bloody violence, and gleeful profanity."

document.image       => "http://content9.flixster.com/movie/11/17/37/11173707_800.jpg"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
