def round(q, precision)
  pow = 10**precision
  (q * pow).round / pow.to_f
end