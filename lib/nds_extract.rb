$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pp'

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
    name = source[name_index]
    result << name[:name]
    name_index +=1
  end 
result
end

def total_gross(source)
  total = 0
  index = 0
  while index < source.length do 
    list_name = list_of_directors(directors_database)
    dir_name = list_name[index]
    name_total_hash = directors_totals(directors_database)
    total += name_total_hash[dir_name]
    index += 1 
  end 
 total
end


