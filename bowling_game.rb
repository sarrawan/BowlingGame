class BowlingGame
    PerfectGame = 300

    # scores param is the score of all the rolls from the game
    # example: 10 7 3 9 0 10 0 8 8 2 0 6 10 10 10 8 1 
    def score_game(scores)
        _totalScore = 0
        # converts the string into an array of ints
        _scoreArray = scores.split(",").map { |s| s.to_i }
        if(_scoreArray.count < 12 || _scoreArray.count > 21)
            raise ArgumentError, "Number of scores entered is invalid"
        end 
        if(_scoreArray.all?{|x| x == 10})
            _totalScore = PerfectGame
        elsif
            _scoreArrayCount = _scoreArray.count
            _index = 0
            while _index < _scoreArrayCount do
                rollScore = _scoreArray[_index]
                if(rollWasAStrike(rollScore, _index, _scoreArrayCount))
                    _totalScore += 10 + _scoreArray[_index + 1] + _scoreArray[_index + 2]
                    _index += 1
                elsif (rollWasASpare(rollScore, _index, _scoreArray))
                    _totalScore += 10 + _scoreArray[_index + 2]
                    _index += 2
                elsif (rollWasNormal(_index, _scoreArrayCount))
                    _totalScore += _scoreArray[_index] + _scoreArray[_index + 1]
                    _index += 2
                else # we have a bonus roll in 10th frame
                    _totalScore += _scoreArray[_index] 
                    _index += 1
                end 
                puts "total score at index #{_index} = #{_totalScore}"
            end  
            puts scores
            _totalScore # this is the return value 
        end 
    end 

    def rollWasAStrike(rollScore, index, totalNumberOfRolls)
        rollScore == 10 && index + 2 < totalNumberOfRolls - 1
    end 

    def rollWasASpare(rollScore, index, allScores)
        totalNumberOfRolls = allScores.count
        index + 2 < totalNumberOfRolls - 1 && rollScore + allScores[index + 1] == 10  
    end 

    def rollWasNormal(index, totalNumberOfRolls)
        index + 1 < totalNumberOfRolls - 1
    end
end 