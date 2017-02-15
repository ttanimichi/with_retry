module Kernel
  def with_retry(args = {})
    count   ||= 0
    options ||= WithRetry::Functions.build_options(args)
    yield
  rescue options[:on] => e
    if (count += 1) > options[:limit]
      options[:before_giving_up].call
      raise (options[:failed] || e)
    else
      options[:before_retrying].call
      sleep options[:sleep]
      retry
    end
  end
end
