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
    @exhibits.each do |exhibit|
      patron.interests.each do |interest|
        if interest == exhibit.name
          recommendations << exhibit
        end
      end
    end
    recommendations
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibits_info = {}
    @exhibits.each do |exhibit|
      exhibits_info[exhibit] = []
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          exhibits_info[exhibit] << patron
        end
      end
    end
    exhibits_info
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    players = ticket_lottery_contestants(exhibit)
    players.sample.name
  end

  def announce_lottery_winner(exhibit)
    winner = draw_lottery_winner(exhibit)
    "#{winner} has won the #{exhibit.name} exhibit lottery"
  end
end
