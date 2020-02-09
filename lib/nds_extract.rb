$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pry'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

# def directors_totals(source)
#   result = {}
#   director_index = 0
#   while director_index < source.size do
#     director = source[director_index]
#     binding.pry
#     result[director][:name] = gross_for_director(director)
#     director_index += 1
#   end
#   result
# end





def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  result = []
  name_index = 0
  while name_index < source.length do
    result << source[name_index][:name]
    name_index += 1
  end
  result
end

def total_gross(source)
  gross_result = 0
  totals_index = 0
  dir_names = list_of_directors(source)
  dir_var = directors_totals(source) 
    while totals_index < dir_names.length do
      dir_name = dir_names[totals_index]
      gross_result += dir_var[dir_name]
      totals_index += 1
    end
    gross_result
end
 
 


  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total

