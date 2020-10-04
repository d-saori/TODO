require 'trello'
require 'pry-byebug'

def puts_todos
  configure
  cards = get_cards

  puts '---------------------------'
  puts '【TODO】'
  cards.each do |card|
    puts card.name
  end
  puts '---------------------------'
end

def configure
  Trello.configure do |config|
    config.developer_public_key = ENV['TRELLO_PUBLIC_KEY']
    config.member_token = ENV['TRELLO_MEMBER_TOKEN']
  end
end

def get_cards
  member = Trello::Member.find('sdx53779616')
  boards = member.boards
  board = boards.find { |board| board.name == 'TODO' }
  list = board.lists[0]
  cards = list.cards
  cards
end

puts_todos