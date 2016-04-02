#!/usr/bin/env ruby

gem 'rspec'

require 'rspec/core'
require_relative 'bob'

WHATEVER = 'Whatever.'
CHILL = 'Whoa, chill out!'
SURE = 'Sure.'
FINE = 'Fine. Be that way!'

TESTS = [
  {
    remark:  'Tom-ay-to, tom-aaaah-to.',
    reply: WHATEVER
  },
  {
    remark:  'WATCH OUT!',
    reply: CHILL
  },
  {
    remark:  ('A'..'Z').to_a.sample(10).join,
    reply: CHILL
  },
  {
    remark:  'Does this cryogenic chamber make me look fat?',
    reply: SURE
  },
  {
    remark:  'You are, what, like 15?',
    reply: SURE
  },
  {
    remark:('a'..'z').to_a.sample(10).join << '?',
    reply: SURE
  },
  {
    remark:  'Let\'s go make out behind the gym!',
    reply: WHATEVER
  },
  {
    remark:  'It\'s OK if you don\'t want to go to the DMV.',
    reply: WHATEVER
  },
  {
    remark:  'WHAT THE HELL WERE YOU THINKING?',
    reply: CHILL
  },
  {
    remark:  '1, 2, 3 GO!',
    reply: CHILL
  },
  {
    remark:  '1, 2, 3',
    reply: WHATEVER
  },
  {
    remark:  '4?',
    reply: SURE
  },
  {
    remark:  'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!)',
    reply: CHILL
  },
  {
    remark:  'I HATE YOU',
    reply: CHILL
  },
  {
    remark:  'Ending with ? means a question.',
    reply: WHATEVER
  },
  {
    remark:  'Wait! Hang on. Are you going to be OK?',
    reply: SURE
  },
  {
    remark:  '',
    reply: FINE
  },
  {
    remark:  ' ' * rand(1..10),
    reply: FINE
  },
  {
    remark: "\t" * rand(1..10),
    reply: FINE
  },
  {
    remark:  """
    Does this cryogenic chamber make me look fat?
    no
    """,
      reply: WHATEVER
  },
]

RSpec.describe Bob do
  TESTS.each do |test|
    it "replies to '#{test[:remark]}' accordingly with '#{test[:reply]}'" do
      expect(subject.hey(test[:remark])).to eql(test[:reply])
    end
  end
end
