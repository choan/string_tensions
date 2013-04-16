require 'test/unit'
require 'helpers'
require 'string_tensions'

class StringTensionsTest < Test::Unit::TestCase

  def test_tension_returns_lbs_accepts_unitless
    ex = ::Unit.new("10.37 lbs")
    res = StringTensions.tension_for_pitch(0.00001418, 25.5, "e'")
    assert_equal ex.scalar, round(res.scalar, 2)
    
    ex = ::Unit.new("11.6 lbs")
    res = StringTensions.tension_for_pitch(0.00001418, 25.5, "f'")
    assert_equal ex.scalar, round(res.scalar, 1)
  end
  
  def test_tension_accepts_both_unit_and_unitless_params
    ex = ::Unit.new("10.37 lbs")
    res = StringTensions.tension_for_pitch("0.00001418 lbs/inch", 25.5, "e'")
    assert_equal ex.scalar, round(res.scalar, 2) 

    res = StringTensions.tension_for_pitch("0.00001418", "25.5 in", "e'")
    assert_equal ex.scalar, round(res.scalar, 2) 
  end
  
  def test_tension_autoconverts_units
    ex = ::Unit.new("10.37 lbs")
    res = StringTensions.tension_for_pitch("0.253226 g/m", 25.5, "e'")
    assert_equal ex.scalar, round(res.scalar, 2) 
  end
  
  def test_uw_returns_lbs_per_inch_and_accepts_unitless
    ex = ::Unit.new("0.000014219248492925078 lbs/in")
    res = StringTensions.uw_for_pitch(10.4, 25.5, "e'")
    assert_equal 'lbs/in', res.units
    assert_equal ex, res
  end

  def test_uw_accepts_unit_params
    ex = ::Unit.new("0.000014219248492925078 lbs/in")
    res = StringTensions.uw_for_pitch("10.4 lbs", "25.5 in", "e'")
    assert_equal 'lbs/in', res.units
    assert_equal ex, res
  end
  
  def test_uw_autoconverts_units
    ex = ::Unit.new("0.000014219248492925078 lbs/in")
    res = StringTensions.uw_for_pitch("4.71736 kg ", "25.5 in", "e'")
    assert_equal 'lbs/in', res.units
    assert_equal round(ex.scalar, 2), round(res.scalar, 2)
  end
  
  
  
end