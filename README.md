# Lean Redux

## Usage
```ruby
module App::Actions
  class Increment < LeanRedux::Action
    attribute :value, LeanRedux::Types::Integer.default(1)
  end

  class AddItem < LeanRedux::Action
    attribute :item, LeanRedux::Types::Integer
  end

  class RemoveItem < LeanRedux::Action
    attribute :item, LeanRedux::Types::Integer
  end
end

module App::Reducers
  class Increment
    def self.call(state, action)
      state.counter + action.value
    end
  end

  class AddItem
    def self.call(state, action)
      state.items + [action.item]
    end
  end

  class RemoveItem
    def self.call(state, action)
      state.items.reject { |item| item == action.item }
    end
  end
end

class App::State < LeanRedux::State
  attribute :counter, LeanRedux::Types::Integer.default(0)
  attribute :items, LeanRedux::Types::Array

  def map
    {
      counter: {
        App::Actions::Increment => App::Reducers::Increment,
      },

      items: {
        App::Actions::AddItem => App::Reducers::AddItem,
        App::Actions::RemoveItem => App::Reducers::RemoveItem,
      },
    }
  end
end

state = App:State.new(items: [])
store = LeanRedux::Store.new(state)

store.dispatch(App::Actions::Increment)
store.state.counter # 1
```
