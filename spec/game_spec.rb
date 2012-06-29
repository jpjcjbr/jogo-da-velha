require 'spec_helper'

describe Game do
  
  before(:each) do
    @game = Game.new
  end
  
  it "should mark one position" do
    @game.mark_position 0
    @game.marked?(0).should be_true
  end
  
  it "shouldn't mark any other position" do
    @game.mark_position 0
    (1..8).each do |position|
      @game.marked?(position).should be_false
    end
  end
  
  it "shouldn't mark any marked position" do
    @game.mark_position 0
    @game.mark_position(0).should be_false
  end
  
  it "should mark the first move with O" do
    @game.mark_position 0
    @game.marked_with?(0).should eq('O')
  end
  
  it "should mark the second move with X" do
    @game.mark_position 0
    @game.mark_position 1
    @game.marked_with?(1).should eq('X')
  end
  
  it "should mark the third move with O" do
    @game.mark_position 0
    @game.mark_position 1
    @game.mark_position 2
    @game.marked_with?(2).should eq('O')
  end
  
  it "should detect that the game has ended by filling the first row" do
    @game.mark_position 0 # O
    @game.mark_position 3 # X
    @game.mark_position 1 # O
    @game.mark_position 4 # X
    @game.mark_position 2 # O
    
    @game.ended?.should be_true
  end
  
  it "should detect that the game has ended by filling the second row" do
    @game.mark_position 3 # O
    @game.mark_position 1 # X
    @game.mark_position 4 # O
    @game.mark_position 2 # X
    @game.mark_position 5 # O
    
    @game.ended?.should be_true
  end
  
  it "should detect that the game has ended by filling the third row" do
    @game.mark_position 6 # O
    @game.mark_position 1 # X
    @game.mark_position 7 # O
    @game.mark_position 2 # X
    @game.mark_position 8 # O
    
    @game.ended?.should be_true
  end
  
  it "should detect that the game has ended by filling the first column" do
    @game.mark_position 0 # O
    @game.mark_position 1 # X
    @game.mark_position 3 # O
    @game.mark_position 2 # X
    @game.mark_position 6 # O
    
    @game.ended?.should be_true
  end
  
  it "should detect that the game has ended by filling the second column" do
    @game.mark_position 1 # O
    @game.mark_position 2 # X
    @game.mark_position 4 # O
    @game.mark_position 3 # X
    @game.mark_position 7 # O
    
    @game.ended?.should be_true
  end
  
  it "should detect that the game has ended by filling the third column" do
    @game.mark_position 2 # O
    @game.mark_position 1 # X
    @game.mark_position 5 # O
    @game.mark_position 3 # X
    @game.mark_position 8 # O
    
    @game.ended?.should be_true
  end
  
  it "should detect that the game has ended by filling the diagonal from upper left to bottom right" do
    @game.mark_position 0 # O
    @game.mark_position 1 # X
    @game.mark_position 4 # O
    @game.mark_position 3 # X
    @game.mark_position 8 # O
    
    @game.ended?.should be_true
  end
  
  it "should detect that the game hasn't ended" do
    @game.mark_position 0
    @game.ended?.should be_false
  end
end