def find_kevin_bacon(first_actor)
  final_array = []
  quantity_of_movies = 0

  if first_actor.name == "Kevin Bacon"
    return final_array
  end

  find_kevin_bacon.film_actor_hash do |movie|
    if first_actor.film_actor_hash[movie].any?
      final_array << movie
      find_kevin_bacon(Kevin_Bacon)
    else
      unless quantity_of_movies > 6
        first_actor.film_actor_hash[movie].each do |actor|
          quantity_of_movies += 1
          final_array << movie
          find_kevin_bacon(actor)
        end
      else
        final_array = []
        quantity_of_movies = 0
      end
    end
  end
end
