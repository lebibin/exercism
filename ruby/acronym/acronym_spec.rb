#!/usr/bin/env ruby

gem 'rspec'

require 'rspec/core'
require_relative 'acronym'

ACRONYM_PAIRS =
  {
    'Portable Network Graphics' => 'PNG',
    'Ruby on Rails' => 'ROR',
    'HyperText Markup Language' => 'HTML',
    'First In, First Out' => 'FIFO',
    'PHP: Hypertext Preprocessor' => 'PHP',
    'Complementary metal-oxide semiconductor' => 'CMOS'
}.freeze

RSpec.describe Acronym do
  context ".abbreviate" do
    ACRONYM_PAIRS.each do |given, expected|
      it "shortens #{given} to #{expected}" do
        expect(Acronym.abbreviate(given)).to eq(expected)
      end
    end
  end

  it "has VERSION constant of 1" do
    expect(Acronym::VERSION).to eq(1)
  end
end
