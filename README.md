# StringTensions

A library for various musical string calculations:

* Tension (from known unit weight, length and pitch)

* Mass per length (from known tension, length and pitch).

* Mass per length (from known density and gauge)

TODO:

* Gauge (from known unit weight and density)

## Installation

Add this line to your application's Gemfile:

    gem 'string_tensions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_tensions

## Usage

[ruby-units](https://github.com/olbrich/ruby-units) is used internally for all operations, so any combination of imperial and SI units is acceptable. Results are returned as `Unit` instances (with imperial units, use `to` in order to convert to anything you are interested in).

The following units are used for return values and unitless arguments:

* N for tensions
* kg/m3 for densities
* mm for lengths and gauges
* g/m for mass per length
* Hz for frequencies

StringTensions uses [NoteFrequencies](https://github.com/choan/note_frequencies) internally for converting pitches to frequencies.

Get tension for known unit weight, length and pitch:

    StringTensions.tension_for_pitch(0.00001418, 25.5, "e'")
    StringTensions.tension_for_pitch("0.253226 g/m", "0.6477 m", "e'")

Get unit weight for known tension, length and pitch:

    StringTensions.mpl_for_pitch(10.4, 25.5, "e'")

Get unit weight for known density and gauge:

    StringTensions.mpl_from_density("1300 kg/m^3", "0.5 mm")


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
