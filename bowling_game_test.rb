require "test/unit"
require_relative "bowling_game"

class BowlingGameTest < Test::Unit::TestCase

    def test_all_strike_game
        _rolls = '10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10'
        bowlingGame = BowlingGame.new()
        _result = bowlingGame.score_game(_rolls)
        _expected = 300
        assert_equal(_expected, _result)
    end 

    def test_game_one
        _rolls = "10, 7, 3, 9, 0, 10, 0, 8, 8, 2, 0, 6, 10, 10, 10, 8, 1"
        bowlingGame = BowlingGame.new()
        _result = bowlingGame.score_game(_rolls)
        _expected = 167
        assert_equal(_expected, _result)
    end 

    def test_game_two
        _rolls = "10, 7, 3, 7, 2, 9, 1, 10, 10, 10, 2, 3, 6, 4, 7, 3, 3"
        bowlingGame = BowlingGame.new()
        _result = bowlingGame.score_game(_rolls)
        _expected = 168
        assert_equal(_expected, _result)
    end

    def test_game_too_few_scores
        _rolls = "10, 7, 3"
        bowlingGame = BowlingGame.new()
        _exception = assert_raise(ArgumentError) {bowlingGame.score_game(_rolls)}
        assert_equal("Number of scores entered is invalid", _exception.message)
    end 

    def test_game_too_many_scores
        _rolls = "10, 7, 3, 10, 7, 3, 7, 2, 9, 1, 10, 10, 10, 2, 3, 6, 4, 7, 3, 3, 1, 2, 5"
        bowlingGame = BowlingGame.new()
        _exception = assert_raise(ArgumentError) {bowlingGame.score_game(_rolls)}
        assert_equal("Number of scores entered is invalid", _exception.message)
    end
end 