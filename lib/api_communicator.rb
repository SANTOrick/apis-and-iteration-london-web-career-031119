require 'rest-client'
require 'json'
require 'pry'

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

  def get_character_movies_from_api(character_name)
    #make the web request
    response_string = RestClient.get('http://www.swapi.co/api/people/')
    response_hash = JSON.parse(response_string)

   response_hash["results"].each do |person|

     if person["name"] == character_name
       puts  "Matching"
            person["films"].each do |film|
             response_string_film = RestClient.get(film)
             response_film = JSON.parse(response_string_film)
             puts " #{response_film["title"]}"
             end
       end
        if person["name"] != character_name
          puts "No match"
        end

       break
    end
  end


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
def print_movies(calm)
  puts calm
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
