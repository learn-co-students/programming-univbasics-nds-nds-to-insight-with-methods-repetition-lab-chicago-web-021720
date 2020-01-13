def directors_totals(source)
  result = {}
  for director in source do
    result[director[:name]] = gross_for_director(director)
  end
  result
end

def gross_for_director(d)
  total = 0
  for movie in d[:movies] do
    total += movie[:worldwide_gross]
  end
  total
end