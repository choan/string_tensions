require 'test/unit'
require 'helpers'
require 'string_tensions/convert'

class ConvertTest < Test::Unit::TestCase
  def test_mm_to_inches
    assert_equal 1, StringTensions::Convert.mm_to_inches(25.4)
  end
  
  def test_inches_to_mm
    assert_equal 25.4, StringTensions::Convert.inches_to_mm(1)
  end
  
  def test_kg_to_lbs
    assert_equal 2.20462262, round(StringTensions::Convert.kg_to_lbs(1), 8)
  end
  
  def test_lbs_to_kg
    assert_equal 4, round(StringTensions::Convert.lbs_to_kg(2.20462262 * 4), 0)
  end
  
  def test_g_m_to_lbs_inch
    assert_equal 0.00055997, round(StringTensions::Convert.g_m_to_lbs_inch(10), 8)
  end
  
end