module TrailsHelper
  def city(place)
    place["city"]
  end

  def activity_selector
    select_tag :activity_type_name, options_for_select(activity_options)
  end

  def activity_options
    [ 
      ["Choose One",""], 
      ["Hiking","hiking"], 
      ["Mountain biking","mountain biking"],
      ["Caving","caving"]
      # ["Campgrounds","campgrounds"], 
      # ["Trail Running","trail running"], 
      # ["Skiing / Snowboarding","snow sports"], 
      # ["Horseback Riding","horseback riding"] 
    ]
  end
end
