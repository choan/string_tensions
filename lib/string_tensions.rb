require "string_tensions/version"
require "string_tensions/convert"
require "note_frequencies"

module StringTensions
  
  K = 386.4
  
  def self.tension(uw, length, freq)
    uw_lbs_inch = Convert.auto(uw, 'lbs/in').scalar
    length_in_inches = Convert.auto(length, 'in').scalar
    # T (Tension) =  (UW  x (2 x L x F)**2) / 386.4
    t = (uw_lbs_inch * (2 * length_in_inches * freq)**2) / K
    Convert.unit(t, 'lbs')
  end
  
  def self.tension_for_pitch(uw_lbs_inch, length_in_inches, pitch)
    tension(uw_lbs_inch, length_in_inches, freq_from_pitch(pitch))
  end
  
  def self.uw(tension, length_inches, freq)
    tension_lbs = Convert.auto(tension, 'lbs').scalar
    length_inches = Convert.auto(length_inches, 'in').scalar
    # UW (unit weight) =  (T x 386.4) / (2 x L x F)**2
    uw = ((tension_lbs * K) / (2 * length_inches * freq)**2).to_f
    Convert.unit(uw, 'lbs/in')
  end
  
  def self.uw_from_density(density, gauge)
    # TODO
    # volume for 1 inch lineal length
    density_lbs_inch3 = Convert.auto(density, 'lbs/in^3')
    gauge_inch = Convert.auto(gauge, 'in')
    puts density_lbs_inch3.scalar.to_f
    volume = Math::PI * (gauge_inch / 2)**2 * ::Unit.new("1 in")
    uw = volume * density_lbs_inch3 / ::Unit.new("1 in")
    puts uw
    uw
  end
  
  def self.uw_for_pitch(tension_lbs, length_inches, pitch)
    uw(tension_lbs, length_inches, freq_from_pitch(pitch))
  end
    
  def self.freq_from_pitch(pitch)
    NoteFrequencies.frequency_from_name(pitch)
  end
  
end
