describe Game do

  subject(:game)         { described_class.new(player)        }
  let(:player)           { double :player                     }
  let(:rock_chooser)     { double :player, choice: "rock"     }
  let(:paper_chooser)    { double :player, choice: "paper"    }
  let(:scissors_chooser) { double :player, choice: "scissors" }

  it "Knows it's player" do
    expect(game.player1).to eq player
  end

  describe "#winner" do
    context "Rock beats scissors" do
      it "Returns the the player if player wins" do
        game = Game.new(rock_chooser, scissors_chooser)
        expect(game.winner).to eq rock_chooser
      end
      it "Returns the the computer if computer wins" do
        game = Game.new(scissors_chooser, rock_chooser)
        expect(game.winner).to eq rock_chooser
      end
    end
    context "Paper beats rock" do
      it "Returns the the player if player wins" do
        game = Game.new(paper_chooser, rock_chooser)
        expect(game.winner).to eq paper_chooser
      end
      it "Returns the the computer if computer wins" do
        game = Game.new(rock_chooser, paper_chooser)
        expect(game.winner).to eq paper_chooser
      end
    end
    context "Scissors beats paper" do
      it "Returns the the player if player wins" do
        game = Game.new(scissors_chooser, paper_chooser)
        expect(game.winner).to eq scissors_chooser
      end
      it "Returns the the computer if computer wins" do
        game = Game.new(paper_chooser, scissors_chooser)
        expect(game.winner).to eq scissors_chooser
      end
    end
  end

  describe "#tie_game?" do
    it "returns true if the game was a tie" do
      game = Game.new(rock_chooser, rock_chooser)
      expect(game.tie_game?).to be true
    end
    it "returns false if the game was not a tie" do
      game = Game.new(rock_chooser, scissors_chooser)
      expect(game.tie_game?).to be false
    end
  end

end
