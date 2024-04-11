class LeanRedux::Store
  attr_reader :state

  def initialize(state)
    @state = state
    @state_map = LeanRedux::ReindexStateMap.for(state.map)
  end

  def dispatch(action)
    state_key, reducer = @state_map.fetch(action.class, nil)

    raise LeanRedux::UndefinedActionError unless reducer

    state = @state
    new_value = reducer.call(state, action)
    @state = state.new(state_key => new_value)

    true
  end
end
