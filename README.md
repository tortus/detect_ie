# DetectIE

Simple module to add detection of old IE versions to rails controllers and helpers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'detect_ie', :github => 'tortus/detect_ie'
```

And then execute:

    $ bundle

## Usage

```ruby
# app/controllers/application_controller.rb
class ApplicationController
  include DetectIE

  def do_something
    if ie_version < 9
      # do something special for old versions of IE
    else
      # normal code path
    end
  end
end
```

It will detect any unrecognized IE as version 10, both because Microsoft changed the
user agent string after 9, and because 10 actually works enough like "real" browsers that
specific tweaks are not as necessary.

## The following methods are available in both controllers and views:

* ie_version
* force_ie_version!(version)
* ie_8_or_less?
* force_ie_8!
