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
  
    def self.unit(qty, dim)
      ::Unit.new("#{qty} #{dim}")
    end
  
  end  
end
