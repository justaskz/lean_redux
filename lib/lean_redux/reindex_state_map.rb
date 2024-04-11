class LeanRedux::ReindexStateMap
  def self.for(state_map)
    state_map.each_with_object({}) do |(state_key, action_to_reducer_map), config|
      action_to_reducer_map.each do |action, reducer|
        config[action] = [state_key, reducer]
      end

      config
    end
  end
end
