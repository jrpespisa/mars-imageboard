class Seeder
  attr_accessor :rover_name, :rover_photo, :rover_name, :rover_description, :id, :image_counter, :page_counter

  def initialize(rover_name, image_counter, page_counter)
    @image_counter = image_counter
    @page_counter = page_counter
    @rover_name = rover_name
    @key = ENV["API_KEY"]
    @uri = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/#{@rover_name}/photos?sol=40&page=#{@page_counter}&api_key=#{@key}")
    @response = Net::HTTP.get_response(@uri)
    @rover_info = JSON.parse(@response.body)
  end

  def image
    @rover_photo = @rover_info["photos"][@image_counter]["img_src"]
  end

  def name
    @rover_name = @rover_info["photos"][@image_counter]["rover"]["name"]
  end

  def description
    @rover_description = @rover_info["photos"][@image_counter]["camera"]["full_name"]
  end

  def id
    if @rover_name == "Curiosity"
      @id = 3
    elsif @rover_name == "Opportunity"
      @id = 2
    elsif @rover_name == "Spirit"
      @id = 1
    end
  end

  def add_image
    image
    name
    description
    id
    Image.create(
      image: "#{@rover_photo}",
      name: "#{@rover_name}",
      description: "#{@rover_description}",
      rover_id: @id
    )
  end
end
