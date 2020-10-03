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
    config.developer_public_key = '58737dfe4a44de11b86b0d46738da1d2'
    config.member_token = 'd0ce9cef56605cc2ed6f4ae6cec8e6067a055a6113768a7b9c33d0e49c553c0f'
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