class Trail < ActiveRecord::Base
  belongs_to :folio

  before_save :set_directions
  # before_save :clean_description

  # validates :city, presence: true
  # validates :activity_type_name # make sure user selected a activity type

  def self.party(activity_type_name=nil, city=nil)
    activity_type_name ||= "hiking"
    activity_type_name = URI.encode(activity_type_name)
    city ||= "park city"
    city = city.split # ["park", "city"]
    city = city.each { |name| name.capitalize! }
    city = city.join("%20") # "Park%20City"
    auth = { query: { api_key: '002d9365e2b316793760654dcad5c865' }}
    search_url = "https://outdoor-data-api.herokuapp.com/api.json?q[activities_activity_type_name_cont]=#{activity_type_name}&q[city_eq]=#{city}"
    response = HTTParty.get search_url, auth  
  end

  def set_directions
    self.directions ||= ""
  end

  # def clean_description
  #   self.description = self.description.gsub("&quot;", '"')
  # end
end
