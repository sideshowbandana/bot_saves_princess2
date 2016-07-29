require 'spec_helper'

describe BotSavesPrincess2::Bot do
  let(:bot){ BotSavesPrincess2::Bot.new }
  let(:state){
    [
      "---",
      "m-p",
      "---"
    ]
  }

  before(:each) do
    bot.state = state
  end

  it "can move to the right " do
    expect(bot.next_move).to eq BotSavesPrincess2::Bot::RIGHT
  end

  it "knows princess position" do
    expect(bot.princess_pos.x).to eq 2
    expect(bot.princess_pos.y).to eq 1
  end

  it "knows it's own position" do
    expect(bot.position.x).to eq 0
    expect(bot.position.y).to eq 1
  end
end
