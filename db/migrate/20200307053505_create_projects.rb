class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :delivery_estimate
      t.datetime :delivered_date
      t.decimal :budgeted
      t.decimal :cost_done
      t.string :status

      t.timestamps
    end
  end
end
