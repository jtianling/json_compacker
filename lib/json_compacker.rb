#!/usr/bin/ruby
require "json_compacker/version"
require 'optparse'
require 'json'
require 'pathname'

module JsonCompacker
  def self.main
    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: ./json_compacker -s src_path -o output_file"

      opts.on("-s", "--src_path", "define the src path where are json files") do |v|
        options[:src_path] = v
      end

      opts.on("-o", "--output_file", "define the output file compacked") do |v|
        options[:output_file] = v
      end
    end.parse!

    p options
    p ARGV
  end



end
