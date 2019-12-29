class Cart
  def initialize(params)
    @name = params[:name]
    @type = params[:type]
    @temp_range = params[:temp_range]
    @wardrobe = params[:wardrobe]
    add_garment
  end

  def add_garment
    File.open("./data/#{@wardrobe.garments.size + 1}.txt", 'w') do |file|
      file.puts @name
      file.puts @type
      file.puts "(#{@temp_range[0]}, #{@temp_range[1]})"
    end
  end
end
