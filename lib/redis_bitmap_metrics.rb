require 'redis'

class RedisBitmapMetrics
  def initialize(config)
    @redis = Redis.new(config)
  end

  def log_access(key, user_id)
    @redis.setbit(key, user_id, 1)
  end

  def count(key)
    # NOTE It's very slow for large value.
    #   One way to overcome this is using C extension module.
    #   ref. https://github.com/tyler/bitset
    #   It seems to have a critical bug though it's resolved by forked source.
    #   ref. https://github.com/tyler/bitset/issues/6
    #   ...and I found an example source code at
    #   https://github.com/cmdrkeene/bitmap-counter
    #   Another way is counting in redis server, it requires to change redis source.
    #   I don't know how it is hard.
    @redis.get(key).unpack('C*').inject(0) do |a, e|
      (0...8).each do |offset|
        a += 1 if ((e >> offset) & 1) == 1
      end
      a
    end
  end

  def clear!(key)
    @redis.del(key)
  end
end
