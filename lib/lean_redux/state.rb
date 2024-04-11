class LeanRedux::State < Dry::Struct
  def map
    raise NotImplementedError
  end
end
