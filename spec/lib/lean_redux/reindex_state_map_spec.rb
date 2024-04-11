RSpec.describe LeanRedux::ReindexStateMap, '.for' do
  subject { described_class.for(state_map) }

  let(:state_map) do
    {
      state_key: {
        action => reducer,
        action_2 => reducer_2,
      },
      state_key_2: {
        action_3 => reducer_3
      },
    }
  end

  let(:action) { double(:action) }
  let(:action_2) { double(:action_2) }
  let(:action_3) { double(:action_3) }

  let(:reducer) { double(:reducer) }
  let(:reducer_2) { double(:reducer_2) }
  let(:reducer_3) { double(:reducer_3) }

  let(:config) do
    {
      action   => [:state_key, reducer],
      action_2 => [:state_key, reducer_2],
      action_3 => [:state_key_2, reducer_3],
    }
  end

  it { is_expected.to eq(config) }
end
