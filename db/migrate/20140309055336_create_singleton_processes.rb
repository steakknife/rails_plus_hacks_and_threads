class CreateSingletonProcesses < ActiveRecord::Migration
  def change
    create_table :singleton_processes do |t|
      t.string :process_type, null: false
      t.string :hostname, null: false
      t.integer :pid, null: false

      t.timestamps
    end
    add_index :singleton_processes, :process_type, unique: true
    add_index :singleton_processes, [:process_type, :hostname, :pid]
  end
end
