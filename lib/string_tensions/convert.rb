require 'ruby-units'

module StringTensions
  module Convert
  
    def self.kg_to_lbs(kg)
      unit(kg, 'kg').to('lbs').scalar.to_f
    end
    
    def self.lbs_to_kg(pounds)
      unit(pounds, 'lbs').to('kg').scalar.to_f
    end
  
    def self.inches_to_mm(inches)
      unit(inches, 'inch').to('mm').scalar.to_f
    end
    
    def self.mm_to_inches(mm)
      unit(mm, 'mm').to('inch').scalar.to_f
    end
    
    def self.g_m_to_lbs_inch(g)
      unit(g, 'g/m').to('lbs/inch').scalar.to_f
    end

    def self.lbs_inch_to_g_m(lbs)
      unit(lbs, 'lbs/inch').to('g/m').scalar.to_f
    end
  
    def self.unit(qty, dim = nil)
      ::Unit.new("#{qty} #{dim}")
    end
    
    def self.auto(qty, units)
      u = unit(qty)
      if u.units.empty?
        u = unit(qty, units)
      end
      if u.units != units
        u = u.to(units)
      end
      u
    end
  
  end  
end
