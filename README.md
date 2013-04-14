# StringTensions

A library for calculating musical string tension (from known unit weight, length and pitch) and unit weight (from known tension, length and pitch).

## Installation

Add this line to your application's Gemfile:

    gem 'string_tensions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_tensions

## Usage

Currently the library only accepts input in imperial units (length in inches, unit weight in lbs/inch, tension in lbs). Output is imperial too (unit weight in lbs/inch, tension in lbs).

Should you need output in International System units, there are some conversors included.

StringTensions uses [NoteFrequencies](https://github.com/choan/note_frequencies) internally for converting pitches to frequencies.

Get tension for known unit weight, length and pitch:

    StringTensions.tension_for_pitch(0.00001418, 25.5, "e'")

Get unit weight for known tension, length and pitch:

    StringTensions.uw_for_pitch(10.4, 25.5, "e'")


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
