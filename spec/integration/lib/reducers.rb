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
