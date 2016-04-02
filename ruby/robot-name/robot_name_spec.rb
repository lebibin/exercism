#!/usr/bin/env ruby
# frozen_string_literal: false

gem 'rspec'
require 'rspec/core'
require_relative 'robot_name'

NAME_REGEXP = /^[A-Z]{2}\d{3}$/

COMMAND_QUERY = <<-MSG.freeze
    Command/Query Separation:
    Query methods should generally not change object state.
MSG

RSpec.describe Robot do

  it 'has name' do
    expect(subject.name).to match(NAME_REGEXP)
  end

  it 'name sticks' do
    robot = Robot.new
    robot.name
    expect(robot.name).to eq(robot.name)
  end

  it 'gives different names to different robots' do
    expect(Robot.new.name).not_to eq(Robot.new.name)
  end

  it 'can reset name' do
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    expect(name).to_not eq(name2)
    expect(name2).to eql(robot.name), COMMAND_QUERY
    expect(name2).to match(NAME_REGEXP)
  end

end
