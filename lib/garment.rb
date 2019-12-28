class Garment
  attr_accessor :name, :type, :first_temp, :last_temp

  def self.from_file(path)
    data = File.readlines(path, encoding: 'UTF-8', chomp: true)
    new(
      name: data[0],
      type: data[1],
      first_temp: data[2].gsub(/[()]/, '').split(',')[0],
      last_temp: data[2].gsub(/[()]/, '').split(',')[1]
    )
  end

  def initialize(params)
    @name = params[:name]
    @type = params[:type].downcase
    @first_temp = params[:first_temp].to_i
    @last_temp = params[:last_temp].to_i
  end

  def can_it_wear?(temp)
    (@first_temp..@last_temp).include?(temp)
  end

  def to_s
    "#{name} (#{type}) #{first_temp}..#{last_temp}"
  end
end
