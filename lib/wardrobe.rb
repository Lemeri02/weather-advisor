class Wardrobe
  attr_reader :garments

  def self.get_garment(file)
    garments = file.map { |data| Garment.from_file(data) }
    new(garments)
  end

  def initialize(garments)
    @garments = garments
  end

  def type
    @garments.map(&:type).uniq
  end

  def select_garment_by_type(temp)
    @garments.map(&:type).uniq.map do |type|
      garments_for_dress(temp).select { |item| item.type == type }.sample
    end.compact
  end

  def garments_for_dress(temp)
    @garments.select { |item| item.can_it_wear?(temp) }
  end

  def add_garment(params)
    puts params
  end
end
