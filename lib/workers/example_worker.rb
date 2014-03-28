class ExampleWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(name, count)
    puts "IT WORKS = #{name} #{count}"
  end
end
