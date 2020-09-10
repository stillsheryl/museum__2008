class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommendations = []
    @exhibits.find_all do |exhibit|
      patron.interests.find_all do |interest|
        if interest == exhibit.name
          recommendations << exhibit
        end
      end
      recommendations
    end
  end

  def admit(patron)
    @patrons << patron
  end

end
