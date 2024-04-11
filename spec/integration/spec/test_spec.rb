require_relative '../lib/app'

RSpec.describe do
  let(:state) { App::State.new(items: []) }
  let(:store) { LeanRedux::Store.new(state) }

  describe 'counter' do
    specify do
      expect(store.state.counter).to eq(0)
      store.dispatch(App::Actions::Increment.new(value: 1))
      expect(store.state.counter).to eq(1)
      store.dispatch(App::Actions::Increment.new(value: -1))
      expect(store.state.counter).to eq(0)
    end
  end

  describe 'items' do
    specify do
      expect(store.state.items).to eq([])
      store.dispatch(App::Actions::AddItem.new(item: 1))
      expect(store.state.items).to eq([1])
      store.dispatch(App::Actions::AddItem.new(item: 2))
      expect(store.state.items).to eq([1, 2])
      store.dispatch(App::Actions::RemoveItem.new(item: 1))
      expect(store.state.items).to eq([2])
    end
  end
end
