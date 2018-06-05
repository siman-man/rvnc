require 'pathname'

module RVNC
  class SourceFile
    def initialize(path)
      @path = path
      @relative_path = Pathname.new(path).relative_path_from(Pathname.new(Dir.pwd))
      @source = File.readlines(path)
      @variables = []
    end

    def variables
      ast = RubyVM::AST.parse(@source.join)
      traverse(ast)
      @variables.flatten
    end

    private

    def traverse(parent)
      if RVNC::VARIABLE_NODES.include?(parent.type)
        extract_variables(parent)
      end

      parent.children.compact.each do |child|
        traverse(child)
      end
    end

    def extract_variables(node)
      first_lineno = node.first_lineno - 1
      first_column = node.first_column
      last_lineno = node.last_lineno - 1
      last_column = node.last_column

      if first_lineno == last_lineno
        src = @source[first_lineno][first_column..last_column]
      else
        src = @source[first_lineno][first_column..]
        ((first_lineno + 1)...(last_lineno)).each do |lineno|
          src << @source[lineno]
        end
        src << @source[last_lineno][0..last_column]
      end

      return unless src.include?('=')

      location = [@relative_path, node.first_lineno].join(':')
      vars = src
               .partition('=')
               .first
               .split(',')
               .map { |v| v.delete('*+-/%|&') }
               .map(&:strip)
               .map { |v| { name: v, location: location } }
      @variables << vars
    end
  end
end