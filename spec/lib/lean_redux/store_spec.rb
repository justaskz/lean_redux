RSpec.describe LeanRedux::Store do
  subject(:store) { described_class.new(state) }

  before do
    state = Class.new(LeanRedux::State) do
      attribute :counter, LeanRedux::Types::Integer.default(0)

      def map
        {
          counter: {
            TestApp::Actions::Increment => TestApp::Reducers::Increment
          }
        }
      end
    end

    reducer = Class.new do
      def self.call(state, action)
        state.counter + 1
      end
    end

    increment_action = Class.new(LeanRedux::Action)
    undefined_action = Class.new(LeanRedux::Action)

    stub_const('TestApp::State', state)
    stub_const('TestApp::Actions::Increment', increment_action)
    stub_const('TestApp::Actions::Undefined', undefined_action)
    stub_const('TestApp::Reducers::Increment', reducer)
  end

  let(:state) { TestApp::State.new }

  describe '#state' do
    subject { store.state }

    it { is_expected.to eq(state) }
  end

  describe '#dispatch' do
    let(:increment_action) { TestApp::Actions::Increment.new }

    specify do
      expect(store.state.counter).to eq(0)
      store.dispatch(increment_action)
      expect(store.state.counter).to eq(1)
    end

    context 'when action is not defined in state map' do
      let(:undefined_action) { TestApp::Actions::Undefined.new }

      specify do
        expect { store.dispatch(undefined_action) }.to raise_error(LeanRedux::UndefinedActionError)
      end
    end
  end
end
