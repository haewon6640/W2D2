require_relative 'room'

class Hotel
  attr_reader :rooms

  def initialize(name, hash)
    @name = name
    @rooms = hash.map { |k, v| [k, Room.new(v)] }.to_h
  end

  def name
    @name.split.map { |word| word.capitalize }.join(' ')
  end

  def room_exists?(rName)
    @rooms.has_key?(rName)
  end

  def check_in(person, rName)
    unless self.room_exists?(rName)
      p 'sorry, room does not exist'
      return false
    end
    p @rooms[rName].add_occupant(person) ? 'check in successful' : 'sorry, room is full'
  end

  def has_vacancy?
    @rooms.any? { |_k, room| !room.full? }
  end

  def list_rooms
    @rooms.each do |name, room|
      puts name + ' ' + room.available_space.to_s
    end
  end
end
