require "string_tensions/version"
require "ruby-units"
require "note_frequencies"

module StringTensions
  
  def self.tension(uw, length, freq)
    uw_lbs_inch = to_unit(uw, 'lbs/in')
    length_in_inches = to_unit(length, 'in')
    freq_hz = to_unit(freq, "Hz")
    # T (Tension) =  (UW  x (2 x L x F)**2) / 386.4
    t = (uw_lbs_inch * (2 * length_in_inches * freq_hz)**2)
    t.to('lbf')
  end
  
  def self.tension_for_pitch(uw_lbs_inch, length_in_inches, pitch)
    tension(uw_lbs_inch, length_in_inches, freq_from_pitch(pitch))
  end
  
  def self.uw(tension, length_inches, freq)
    tension_lbs = to_unit(tension, 'lbf')
    length_inches = to_unit(length_inches, 'in')
    freq_hz = to_unit(freq, "Hz")
    # UW (unit weight) =  (T x 386.4) / (2 x L x F)**2
    uw = ((tension_lbs) / (2 * length_inches * freq_hz)**2)
    uw.to('lbs/in')
  end
  
  def self.uw_from_density(density, gauge)
    # TODO
    # volume for 1 inch lineal length
    density_lbs_inch3 = to_unit(density, 'lbs/in^3')
    gauge_inch = to_unit(gauge, 'in')
    volume = Math::PI * (gauge_inch / 2)**2 * ::Unit.new("1 in")
    uw = volume * density_lbs_inch3 / ::Unit.new("1 in")
    uw
  end
  
  def self.uw_for_pitch(tension_lbs, length_inches, pitch)
    uw(tension_lbs, length_inches, freq_from_pitch(pitch))
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