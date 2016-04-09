class Role
  def self.for_options(_)
    all
  end

  def self.all
    DataLoader.load_file("roles").map do |data|
      new data
    end
  end

  attr_reader :name, :hotkey, :races, :alignments, :starting_attributes,
   :attribute_probabilities, :hitpoints, :power, :rand_power

  def initialize data
    data.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def to_s
    name
  end
end
