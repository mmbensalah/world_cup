require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def test_it_exists
    france = Team.new("France")
    assert_instance_of Team, france
  end

  def test_attribute
    france = Team.new("France")
    assert_equal "France", france.country
  end

  def test_empty_array_players
    france = Team.new("France")
    assert_equal [], france.players
  end

  # def test_if_eliminated?
  #   france = Team.new("France")
  #   assert_equal false, france.eliminated?
  # end

  def test_if_eliminated
    france = Team.new("France")
    assert_equal true, france.eliminated
  end

  def test_returns_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    assert_equal [mbappe, griezmann, pogba], france.players
  end

  def test_player_positions
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    assert_equal pogba, france.players_by_position(:midfielder)
  end

  def test_player_positions
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    assert_equal [mbappe, griezmann], france.players_by_position
  end
end
