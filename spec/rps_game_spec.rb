require 'spec_helper'

describe RPSGame do
  describe "#new" do
    it "should accept valid play types" do
      expect { RPSGame.new(:rock)     }.to_not raise_error
      expect { RPSGame.new(:paper)    }.to_not raise_error
      expect { RPSGame.new(:scissors) }.to_not raise_error
    end

    it "should raise an error for invalid types" do
      expect { RPSGame.new(:dynamite) }.to raise_error(RPSGame::PlayTypeError)
    end
  end

  describe "#valid_play?" do
    it "should return true for the symbol :paper" do
      RPSGame.valid_play?(:paper)
    end

    it "should return true for the symbol :rock" do
      RPSGame.valid_play?(:rock)
    end

    it "should return true for the symbol scissors" do
      RPSGame.valid_play?(:scissors)
    end

    it "should return false for other values" do
      RPSGame.valid_play?(:dynamite)
    end
  end

  describe "#computer_play" do
    it "should return the computer's play" do
      expect(RPSGame.valid_play?(RPSGame.new(:rock).computer_play)).to eq(true)
    end
  end

  describe "#won?" do
    it "should return true if the player won" do
      game = RPSGame.new(:rock)
      allow(game).to receive(:computer_play) { :scissors }

      expect(game.won?).to eq(true)
    end

    it "should return false if the player lost" do
      game = RPSGame.new(:rock)
      allow(game).to receive(:computer_play) { :paper }

      expect(game.won?).to eq(false)
    end

    it "should return false if the player tied" do
      game = RPSGame.new(:rock)
      allow(game).to receive(:computer_play) { :rock }

      expect(game.won?).to eq(false)
    end
  end

  describe "#tied?" do
    it "should return true if the player tied" do
      game = RPSGame.new(:rock)
      allow(game).to receive(:computer_play) { :rock }

      expect(game.tied?).to eq(true)
    end

    it "should return false if the player won" do
      game = RPSGame.new(:rock)
      allow(game).to receive(:computer_play) { :scissors }

      expect(game.tied?).to eq(false)
    end

    it "should return false if the player lost" do
      game = RPSGame.new(:rock)
      allow(game).to receive(:computer_play) { :paper }

      expect(game.tied?).to eq(false)
    end
  end

  describe "#lost?" do
    it "should return true if the player lost" do
      game = RPSGame.new(:rock)
      allow(game).to receive(:computer_play) { :paper }

      expect(game.lost?).to eq(true)
    end

    it "should return false if the player won" do
      game = RPSGame.new(:rock)
      allow(game).to receive(:computer_play) { :scissors }

      expect(game.lost?).to eq(false)
    end

    it "should return false if the player tied" do
      game = RPSGame.new(:rock)
      allow(game).to receive(:computer_play) { :rock }

      expect(game.lost?).to eq(false)
    end
  end
end
