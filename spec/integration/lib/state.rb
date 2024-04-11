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
