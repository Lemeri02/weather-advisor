class Wardrobe
  attr_reader :garments

  def self.get_garment(file)
    garments = file.map { |data| Garment.from_file(data) }
    new(garments)
  end

  def initialize(garments)
    @garments = garments
  end

  def garments_for_dress(temp)
    @garments.select { |item| item.can_it_wear?(temp) }
  end

  def include_garment?(name)
    @garments.map { |garment| garment.name.downcase }.include?(name.downcase)
  end

  def names
    @garments.map(&:name)
  end

  def select_garment_by_type(temp)
    types.map do |type|
      garments_for_dress(temp).select { |item| item.type == type }.sample
    end.compact
  end

  def types
    @garments.map(&:type).uniq
  end
end
