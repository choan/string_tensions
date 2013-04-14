require 'test/unit'
require 'helpers'
require 'string_tensions'

class StringTensionsTest < Test::Unit::TestCase

  def test_tension
    assert_equal 10.4, round(StringTensions.tension_for_pitch(0.00001418, 25.5, "e'"), 1)
    assert_equal 11.6, round(StringTensions.tension_for_pitch(0.00001418, 25.5, "f'"), 1)
  end
  
  def test_uw
    assert_equal 0.000014219248492925078, StringTensions.uw_for_pitch(10.4, 25.5, "e'").to_f
    assert_equal 0.00001793812886799779, StringTensions.uw_for_pitch(13.12, 25.5, "e'").to_f
  end  
  
end