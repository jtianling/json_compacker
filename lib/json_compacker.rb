#!/usr/bin/env ruby
require "json_compacker/version"
require 'optparse'
require 'json'
require 'pathname'

module JsonCompacker
  @options = {}

  def self.parse_argv(argv)
    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: ./json_compacker -s src_path -o output_file"

      opts.on("-s", "--src_path=SRC_PATH", "define the src path where are json files") do |v|
        @options[:src_path] = v
      end

      opts.on("-o", "--output_file=OUTPUT_FILE", "define the output file compacked") do |v|
        @options[:output_file] = v
      end

      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end
    end

    opt_parser.parse! argv

    if !@options[:src_path] or !@options[:output_file] then
      opt_parser.parse! ['--help']
    end

  end

  def self.get_file_as_string(filename)
    data = ''
    f = File.open(filename, "r") 
    f.each_line do |line|
      data += line
    end
    return data
  end

  def self.main
    parse_argv ARGV

    src_path = @options[:src_path]
    output_file = @options[:output_file]

    output_json_obj = {}
    Dir.foreach(src_path) { |filename|
      if (filename == '.' || filename == '..' || filename == '.DS_Store') then
        next
      end

      content = get_file_as_string(src_path + '/' + filename)
      json = JSON.parse(content)

      base_filename = File.basename(filename, File.extname(filename)) 
      output_json_obj[base_filename] = json
    }

    open(output_file, 'w') { |f|
      f.puts JSON.dump(output_json_obj)
    }
  end
end
