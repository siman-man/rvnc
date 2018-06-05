# frozen_string_literal: true

require 'rvnc/source_file'
require 'rvnc/version'

module RVNC
  VARIABLE_NODES = %w[
    NODE_CDECL
    NODE_CVASGN
    NODE_DASGN_CURR
    NODE_GASGN
    NODE_IASGN
    NODE_MASGN
  ].freeze

  def self.collect(root)
    if File.directory?(root)
      Dir.glob("#{root}/**/*.rb").map do |path|
        variables(path)
      end.flatten
    else
      variables(root)
    end
  end

  def self.variables(path)
    SourceFile.new(File.expand_path(path)).variables
  end
end
