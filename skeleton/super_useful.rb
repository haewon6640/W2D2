# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = %w[apple banana orange]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  begin
    puts 'Hello, I am a friendly monster. :)'

    puts 'Feed me a fruit! (Enter the name of a fruit:)'
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue => error
    if maybe_fruit == "coffee"
      retry
    end
    p error.message
  end
end
# feed_me_a_fruit
# PHASE 4
class FriendZoneError < StandardError
end
class EmptyStringError < StandardError
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if (name.length <= 0 || yrs_known <= 0)
      raise EmptyStringError
    end
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    raise FriendZoneError if @yrs_known < -100
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
