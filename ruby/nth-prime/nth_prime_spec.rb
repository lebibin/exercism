#!/usr/bin/env ruby
# frozen_string_literal: true

gem 'rspec'
require 'rspec/core'

require 'prime'
ERROR_MESSAGE = <<-MSG.freeze
Using Ruby's Prime class is probably the best way to do this in a
'real' application; but this is an exercise, not a real application,
so you're expected to implement this yourself.
MSG

class Prime
  [:each, :new, :prime?, :take].each do |m|
    define_method(m) { |*_| fail ERROR_MESSAGE }
  end
end

class Integer
  [:prime?, :each_prime].each do |m|
    define_method(m) { |*_| fail ERROR_MESSAGE }
  end
end

require_relative 'nth_prime'

RSpec.describe Prime do
  describe '.nth(n)' do
    it 'returns 1st prime correctly as 2' do
      expect(Prime.nth(1)).to eq(2)
    end

    it 'returns 2nd prime correctly as 3' do
      expect(Prime.nth(2)).to eq(3)
    end

    it 'returns 6th prime correctly as 13' do
      expect(Prime.nth(6)).to eq(13)
    end

    it 'returns 10_001th prime correctly as 104_743' do
      expect(Prime.nth(10_001)).to eq(104_743)
    end

    it 'raises ArgumentError for 0th prime' do
      expect{Prime.nth(0)}.to raise_error(ArgumentError)
    end
  end
end
