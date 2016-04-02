#!/usr/bin/env ruby
gem 'rspec'
require 'rspec/core'
require_relative 'scrabble_score'

WORDS_TO_SCORE = [
  {
    raw: '',
    score: 0
  },
  {
    raw: " \t\n",
    score: 0
  },
  {
    raw: nil,
    score: 0
  },
  {
    raw: 'a',
    score: 1
  },
  {
    raw: 'f',
    score: 4
  },
  {
    raw: 'street',
    score: 6
  },
  {
    raw: 'quirky',
    score: 22
  },
  {
    raw: 'oxyphenbutazone',
    score: 41
  },
]

RSpec.describe Scrabble do
  context '#score' do
    WORDS_TO_SCORE.each do |word|
      it "#{word[:raw].inspect} for #{word[:score]} points" do
        expect(Scrabble.new(word[:raw]).score).to eq(word[:score])
      end
    end
  end

  it 'allows convenient scoring via .score' do
    expect(Scrabble.score('alacrity')).to eq(13)
  end
end
