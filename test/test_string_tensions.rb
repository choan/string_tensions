require 'test/unit'
require 'helpers'
require 'string_tensions'

class StringTensionsTest < Test::Unit::TestCase

  def test_tension_returns_newtons_accepts_unitless
    ex = ::Unit.new("46.17 N")
    res = StringTensions.tension_for_pitch(0.253226, 647.7, "e'")
    assert_equal ex.scalar, round(res.scalar, 2)
    assert_equal ex.units, res.units
    
    ex = ::Unit.new("51.8 N")
    res = StringTensions.tension_for_pitch(0.253226, 647.7, "f'")
    assert_equal ex.scalar, round(res.scalar, 1)
  end
  
  def test_tension_accepts_both_unit_and_unitless_params
    ex = ::Unit.new("46.17 N")
    res = StringTensions.tension_for_pitch("0.00001418 lbs/inch", 647.7, "e'")
    assert_equal ex.scalar, round(res.scalar, 2) 

    res = StringTensions.tension_for_pitch(0.253226, "25.5 in", "e'")
    assert_equal ex.scalar, round(res.scalar, 2) 
  end
  
  def test_tension_autoconverts_units
    ex = ::Unit.new("46.17 N")
    res = StringTensions.tension_for_pitch("0.253226 g/m", 647.7, "e'")
    assert_equal ex.scalar, round(res.scalar, 2) 
  end
  
  def test_mpl_returns_grams_per_meter_and_accepts_unitless
    ex = ::Unit.new("0.25372222373180225 g/m")
    res = StringTensions.mpl_for_pitch(46.2615047987092, 647.7, "e'")
    assert_equal 'g/m', res.units
    assert_equal round(ex.scalar, 8), round(res.scalar, 8)
  end

  def test_mpl_accepts_unit_params
    ex = ::Unit.new("0.25372222373180225 g/m")
    res = StringTensions.mpl_for_pitch("10.4 lbf", "25.5 in", "e'")
    assert_equal 'g/m', res.units
    assert_equal round(ex.scalar, 8), round(res.scalar, 8)
  end
  
  def test_mpl_autoconverts_units
    ex = ::Unit.new("0.02587246 g/m")
    res = StringTensions.mpl_for_pitch("4.71736 N", "25.5 in", "e'")
    assert_equal 'g/m', res.units
    assert_equal round(ex.scalar, 8), round(res.scalar, 8)
  end
  
  def test_mpl_from_density
    # TODO we need actual data to compare, next test assert this indirectly    
  end
  
  def test_tension_from_density_and_gauge
    # Arto's calculator says this should be "8.513 kg"
    ex = ::Unit.new("8.50932 N")
    res = StringTensions.tension_for_pitch(StringTensions.mpl_from_density("1300 kg/m^3", "0.5 mm"), "650 mm", "a'").to('N')
    # assert_equal round(ex.scalar, 4), round(res.scalar, 4)
    assert_equal ex.units, res.units
  end
  
end