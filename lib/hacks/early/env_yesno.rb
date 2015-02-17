ENV.instance_eval do
  YES_REGEX = /(?:yes)|(?:on)|(?:true)|(?:enable)|[y1+t]/i

  def y?(key)
    ENV.key?(key) && !!(ENV[key] =~ YES_REGEX)
  end

  def n?(*args)
    !y?(*args)
  end
end
