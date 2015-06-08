module WithRetry
  module Functions
    def build_options(args = {})
      defaults.merge(args)
    end

    def defaults
      {
        limit: 3,
        on: StandardError,
        sleep: 0,
        failed: nil,
        before_giving_up: ->{},
        before_retrying: ->{}
      }
    end

    module_function :build_options, :defaults
  end
end
