module Kernel
  def with_retry(args = {})
    count   ||= 0
    options ||= WithRetry::Functions.build_options(args)
    yield
  rescue options[:on]
    if (count += 1) > options[:limit]
      options[:before_giving_up].call
      raise (options[:failed] || options[:on])
    else
      options[:before_retrying].call
      sleep options[:sleep]
      retry
    end
  end
end
