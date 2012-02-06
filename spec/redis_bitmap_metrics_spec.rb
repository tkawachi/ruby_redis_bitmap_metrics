require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RedisBitmapMetrics" do
  before(:all) do
    @metrics = RedisBitmapMetrics.new(host: '127.0.0.1', port: 6379)
  end

  it "should be able to count DAU" do
    user_ids = [1, 2, 5, 10, 10000]
    user_ids.each do |user_id|
      @metrics.log_access('day1', user_id)
    end
    @metrics.count('day1').should == user_ids.size
    @metrics.clear!('day1')
  end

  it "should count same user id once" do
    user_ids = [1, 2, 5, 2, 1]
    user_ids.each do |user_id|
      @metrics.log_access('day1', user_id)
    end
    @metrics.count('day1').should == user_ids.uniq.size
    @metrics.clear!('day1')
  end
end
