class ComputerPlayer
  attr_reader :name
  attr_accessor :known_cards

  def initialize(name)
    @name = name
    @known_cards = {}
    (0..9).each {|num| known_cards[num] = []}
  end

  def get_move
    p known_cards
    if known_cards.values.any? {|letter| known_cards.values.count(letter).odd?}

      possible_moves1 = known_cards.select {|k,v| known_cards.values.count(v).odd? }.keys
      p possible_moves1

      moves1 = possible_moves1.sample
      moves2 = unknown_places.sample
      until moves2 != moves1
        moves2 = unknown_places.sample
      end

      return [moves1,moves2]
    else
        moves1,moves2 = unknown_places.sample(2)
    end
  end

  def unknown_places
    known_cards.select {|k,v| v == []}.keys
  end

  def update_cpu_blacklist(move1, move2)
    @known_cards[move1.first] = move1.last
    @known_cards[move2.first] = move2.last
  end

end
