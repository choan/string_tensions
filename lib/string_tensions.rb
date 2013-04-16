require "string_tensions/version"
require "ruby-units"
require "note_frequencies"

module StringTensions

  def self.tension(mpl, length, freq)
    mpl = to_unit(mpl, 'g/m')
    length = to_unit(length, 'mm')
    freq = to_unit(freq, "Hz")
    # T (Tension) =  (mpl  x (2 x L x F)**2) / 386.4
    t = (mpl * (2 * length * freq)**2)
    t.to('lbf')
  end

  def self.tension_for_pitch(mpl, length, pitch)
    tension(mpl, length, freq_from_pitch(pitch))
  end

  def self.mpl(tension, length, freq)
    tension = to_unit(tension, 'N')
    length = to_unit(length, 'mm')
    freq = to_unit(freq, "Hz")
    # mpl (unit weight) =  (T x 386.4) / (2 x L x F)**2
    mpl = ((tension) / (2 * length * freq)**2)
    mpl.to('lbs/in')
  end

  def self.mpl_for_pitch(tension, length, pitch)
    mpl(tension, length, freq_from_pitch(pitch))
  end

  def self.mpl_from_density(density, gauge)
    # TODO
    # volume for 1 inch lineal length
    density = to_unit(density, 'kg/m^3')
    gauge = to_unit(gauge, 'mm')
    volume = Math::PI * (gauge / 2)**2 * ::Unit.new("1")
    mpl = volume * density / ::Unit.new("1")
    mpl
  end

  def self.freq_from_pitch(pitch)
    NoteFrequencies.frequency_from_name(pitch)
  end

  def self.to_unit(qty, dimension)
    u = unit(qty)
    if u.units.empty?
      u = unit(qty, dimension)
    end
    if u.units != dimension
      u = u.to(dimension)
    end
    u
  end

  def self.unit(qty, dim = nil)
    ::Unit.new("#{qty} #{dim}")
  end
end