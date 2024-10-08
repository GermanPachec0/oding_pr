def create_favorite_hash(color, number)
  {
    color: color,
    number: number
  }
end

def favorite_color(favorite_list)
  favorite_list[:color]
end

def favorite_number(favorite_list)
  favorite_list.fetch(:number, 42)
end

def update_favorite_movie(favorite_list, _movie)
  favorite_list.merge!({ movie: _movie })
  # Step 1: add/update the key of movie (as a symbol)

  # Step 2: return the hash (because Step 1 returns the value of the movie key)
  favorite_list
end

def remove_favorite_number(favorite_list)
  # Step 1: delete the number data
  favorite_list.delete(:number)
  # Step 2: return the hash (because Step 1 returns the value of the number key)
  favorite_list
end

def favorite_categories(favorite_list)
  # return the keys of favorite_list
  favorite_list.keys
end

def favorite_items(favorite_list)
  # return the values of favorite_list
  favorite_list.values
end

def merge_favorites(original_list, additional_list)
  original_list.merge!(additional_list)
  original_list
  # merge the two hashes: original_list and additional_list
end
