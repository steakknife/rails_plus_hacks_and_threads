# https://labria.github.io/2013/04/28/rails-4-postgres-uuid-pk-guide/
class CreateUuidOsspEnableExtension < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
  end
end
