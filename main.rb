require 'trello'
require 'pry-byebug'

# def puts_todos
#   configure
#   cards = get_cards

#   puts '---------------------------'
#   puts '【TODO】'
#   cards.each do |card|
#     puts card.name
#   end
#   puts '---------------------------'
# end

# def configure
#   Trello.configure do |config|
#     config.developer_public_key = ENV['TRELLO_PUBLIC_KEY']
#     config.member_token = ENV['TRELLO_MEMBER_TOKEN']
#   end
# end

# def get_cards
#   member = Trello::Member.find('account')
#   boards = member.boards
#   board = boards.find { |board| board.name == 'TODO' }
#   list = board.lists[0]
#   cards = list.cards
#   cards
# end

# puts_todos

class TodaManager
  attr_reader :account, :board_name

  def initialize()
    @account = account
    @board_name = board_name
    Trello.configure do |config|
      config.developer_public_key = ENV['TRELLO_PUBLIC_KEY']
      config.member_token = ENV['TRELLO_MEMBER_TOKEN']
    end
  end

  def puts_todos
    cards = get_cards
    
    puts '---------------------------'
    puts '【TODO】'
    cards.each do |card|
      puts card.name
    end
      puts '---------------------------'
  end
    
  private
    
  def get_cards
    member = Trello::Member.find('account')
    boards = member.boards
    board = boards.find { |board| board.name == board_name }
    list = board.lists[0]
    cards = list.cards
  end
end
  
tm = TodaManager.new('acount', 'TODO アプリ')
puts_todos