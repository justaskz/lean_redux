RSpec.describe LeanRedux::State do
  subject(:state) { described_class.new }

  describe '#map' do
    specify do
      expect { subject.map }.to raise_error(NotImplementedError)
    end
  end
end
