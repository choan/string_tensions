require "string_tensions/version"
require "string_tensions/convert"
require "note_frequencies"

module StringTensions
  
  K = ::Unit.new("1 gee")
  
  def self.tension(uw, length, freq)
    uw_lbs_inch = Convert.auto(uw, 'lbs/in')
    length_in_inches = Convert.auto(length, 'in')
    freq_hz = Convert.auto(freq, "Hz")
    # T (Tension) =  (UW  x (2 x L x F)**2) / 386.4
    t = (uw_lbs_inch * (2 * length_in_inches * freq_hz)**2)
    t.to('lbf')
  end
  
  def self.tension_for_pitch(uw_lbs_inch, length_in_inches, pitch)
    tension(uw_lbs_inch, length_in_inches, freq_from_pitch(pitch))
  end
  
  def self.uw(tension, length_inches, freq)
    tension_lbs = Convert.auto(tension, 'lbf')
    length_inches = Convert.auto(length_inches, 'in')
    freq_hz = Convert.auto(freq, "Hz")
    # UW (unit weight) =  (T x 386.4) / (2 x L x F)**2
    uw = ((tension_lbs) / (2 * length_inches * freq_hz)**2)
    uw.to('lbs/in')
  end
  
  def self.uw_from_density(density, gauge)
    # TODO
    # volume for 1 inch lineal length
    density_lbs_inch3 = Convert.auto(density, 'lbs/in^3')
    gauge_inch = Convert.auto(gauge, 'in')
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
  
end
