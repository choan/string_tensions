require "string_tensions/version"
require "string_tensions/convert"
require "note_frequencies"

module StringTensions
  
  K = 386.4
  
  def self.tension(uw_lbs_inch, length_in_inches, freq)
    # T (Tension) =  (UW  x (2 x L x F)**2) / 386.4
    (uw_lbs_inch * (2 * length_in_inches * freq)**2) / K
  end
  
  def self.tension_for_pitch(uw_lbs_inch, length_in_inches, pitch)
    tension(uw_lbs_inch, length_in_inches, freq_from_pitch(pitch))
  end
  
  def self.uw(tension_lbs, length_inches, freq)
    # UW (unit weight) =  (T x 386.4) / (2 x L x F)**2
    ((tension_lbs * K) / (2 * length_inches * freq)**2).to_f
  end
  
  def self.uw_for_pitch(tension_lbs, length_inches, pitch)
    uw(tension_lbs, length_inches, freq_from_pitch(pitch))
  end
    
  def self.freq_from_pitch(pitch)
    NoteFrequencies.frequency_from_name(pitch)
  end
  
end
