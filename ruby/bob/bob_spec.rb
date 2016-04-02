#!/usr/bin/env ruby
gem 'rspec'

require 'rspec/core'
require_relative 'bob'

WHATEVER = 'Whatever.'
CHILL = 'Whoa, chill out!'
SURE = 'Sure.'
FINE = 'Fine. Be that way!'

WHATEVER_REMARKS = [
  'Tom-ay-to, tom-aaaah-to.',
  'Let\'s go make out behind the gym!',
  'It\'s OK if you don\'t want to go to the DMV.',
  '1, 2, 3',
  'Ending with ? means a question.',
  """
    Does this cryogenic chamber make me look fat?
    no
  """
]

CHILL_REMARKS = [
  'WATCH OUT!',
  ('A'..'Z').to_a.sample(10).join,
  'WHAT THE HELL WERE YOU THINKING?',
  '1, 2, 3 GO!',
  'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!)',
  'I HATE YOU',
]

SURE_REMARKS = [
  'Does this cryogenic chamber make me look fat?',
  'You are, what, like 15?',
  ('a'..'z').to_a.sample(10).join << '?',
  '4?',
  'Wait! Hang on. Are you going to be OK?',
]

FINE_REMARKS = [
  '',
  ' ' * rand(1..10),
  "\t" * rand(1..10),
]

RSpec.describe Bob do
  context "reply: #{WHATEVER.inspect}" do
    WHATEVER_REMARKS.each do |remark|
      it "remark: #{remark.inspect}" do
        expect(subject.hey(remark)).to eql(WHATEVER)
      end
    end
  end
  context "reply: #{CHILL.inspect}" do
    CHILL_REMARKS.each do |remark|
      it "remark: #{remark.inspect} with #{CHILL.inspect}" do
        expect(subject.hey(remark)).to eql(CHILL)
      end
    end
  end
  context "reply: #{SURE.inspect}" do
    SURE_REMARKS.each do |remark|
      it "remark: #{remark.inspect} with #{SURE.inspect}" do
        expect(subject.hey(remark)).to eql(SURE)
      end
    end
  end
  context "reply: #{FINE.inspect}" do
    FINE_REMARKS.each do |remark|
      it "remark: #{remark.inspect} with #{FINE.inspect}" do
        expect(subject.hey(remark)).to eql(FINE)
      end
    end
  end
end
