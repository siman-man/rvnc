RSpec.describe RVNC do
  describe '.variables' do
    it 'node_cvasgn' do
      variables = RVNC.variables(File.expand_path('examples/node_cdecl.rb', __dir__))
      expect(variables).to eq(
        [
          { name: 'FOO', location: 'spec/examples/node_cdecl.rb:1' },
          { name: 'BAR', location: 'spec/examples/node_cdecl.rb:2' },
          { name: 'BAZ', location: 'spec/examples/node_cdecl.rb:3' },
        ]
      )
    end

    it 'node_cvasgn' do
      variables = RVNC.variables(File.expand_path('examples/node_cvasgn.rb', __dir__))
      expect(variables).to eq(
        [
          { name: '@@bar', location: 'spec/examples/node_cvasgn.rb:2' },
          { name: '@@baz', location: 'spec/examples/node_cvasgn.rb:3' },
        ]
      )
    end

    it 'node_lasgn' do
      variables = RVNC.variables(File.expand_path('examples/node_lasgn.rb', __dir__))
      expect(variables).to eq(
        [
          { name: 'a', location: 'spec/examples/node_lasgn.rb:1' },
          { name: 'b', location: 'spec/examples/node_lasgn.rb:2' },
          { name: 'c', location: 'spec/examples/node_lasgn.rb:3' },
          { name: 'd', location: 'spec/examples/node_lasgn.rb:5' },
          { name: 'e', location: 'spec/examples/node_lasgn.rb:5' },
          { name: 'f', location: 'spec/examples/node_lasgn.rb:6' },
          { name: 'g', location: 'spec/examples/node_lasgn.rb:7' },
          { name: 'h', location: 'spec/examples/node_lasgn.rb:8' },
          { name: 'i', location: 'spec/examples/node_lasgn.rb:9' },
        ]
      )
    end

    it 'node_iasgn' do
      variables = RVNC.variables(File.expand_path('examples/node_iasgn.rb', __dir__))
      expect(variables).to eq(
        [
          { name: '@foo', location: 'spec/examples/node_iasgn.rb:3' },
          { name: '@user', location: 'spec/examples/node_iasgn.rb:4' },
          { name: '@a', location: 'spec/examples/node_iasgn.rb:5' },
          { name: 'b', location: 'spec/examples/node_iasgn.rb:5' },
        ]
      )
    end

    it 'node_masgn' do
      variables = RVNC.variables(File.expand_path('examples/node_masgn.rb', __dir__))
      expect(variables).to eq(
        [
          { name: 'foo', location: 'spec/examples/node_masgn.rb:1' },
          { name: 'bar', location: 'spec/examples/node_masgn.rb:1' },
          { name: 'a', location: 'spec/examples/node_masgn.rb:1' },
          { name: 'vars', location: 'spec/examples/node_masgn.rb:2' },
          { name: '_', location: 'spec/examples/node_masgn.rb:2' }
        ]
      )
    end

    it 'node_gasgn' do
      variables = RVNC.variables(File.expand_path('examples/node_gasgn.rb', __dir__))
      expect(variables).to eq(
        [
          { name: '$foo', location: 'spec/examples/node_gasgn.rb:1' },
          { name: '$bar', location: 'spec/examples/node_gasgn.rb:2' }
        ]
      )
    end

    it 'node_op_asgn_or' do
      variables = RVNC.variables(File.expand_path('examples/node_op_asgn_or.rb', __dir__))
      expect(variables).to eq(
        [
          { name: 'foo', location: 'spec/examples/node_op_asgn_or.rb:1' },
        ]
      )
    end
  end
end
