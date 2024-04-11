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
