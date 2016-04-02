#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'phone_number'

NUMBERS_TO_TEST = [
  {
    raw: '(123) 456-7890',
    clean: '1234567890'
  },
  {
    raw: '(987) 654-3210',
    clean: '9876543210'
  },
  {
    raw: '456.123.7890',
    clean: '4561237890'
  },
  {
    raw: '123-abc-1234',
    clean: '0000000000'
  },
  {
    raw: '123456789',
    clean: '0000000000'
  },
  {
    raw: '19876543210',
    clean: '9876543210'
  },
  {
    raw: '1234567890',
    clean: '1234567890'
  },
  {
    raw: '21234567890',
    clean: '0000000000'
  },
  {
    raw: '112345678901',
    clean: '0000000000'
  },
  {
    raw: '1a2a3a4a5a6a7a8a9a0a',
    clean: '0000000000'
  }
]

AREA_CODES_TO_TEST = [
  {
    raw: '1234567890',
    code: '123'
  },
  {
    raw: '9876543210',
    code: '987'
  }
]

PRETTY_PRINT_TO_TEST = [
  {
    raw: '5551234567',
    pretty: '(555) 123-4567'
  },
  {
    raw: '11234567890',
    pretty: '(123) 456-7890'
  }
]

RSpec.describe PhoneNumber do
  context '#number' do
    NUMBERS_TO_TEST.each do |number|
      it "should clean '#{number[:raw]}' to '#{number[:clean]}'" do
        clean_number = PhoneNumber.new(number[:raw]).number
        expect(clean_number).to eq(number[:clean])
      end
    end
  end

  context '#area_code' do
    AREA_CODES_TO_TEST.each do |number|
      it "should parse code of '#{number[:raw]}' to '#{number[:code]}'" do
        phone_number = PhoneNumber.new(number[:raw])
        expect(phone_number.area_code).to eq(number[:code])
      end
    end
  end

  context '#to_s' do
    PRETTY_PRINT_TO_TEST.each do |number|
      it "should pretty print '#{number[:raw]}' to '#{number[:pretty]}'" do
        phone_number = PhoneNumber.new(number[:raw])
        expect(phone_number.to_s).to eq(number[:pretty])
      end
    end
  end
end
