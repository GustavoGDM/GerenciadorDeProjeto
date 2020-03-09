class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :name
      t.text :description
      t.string :status
      t.datetime :start_date
      t.datetime :done_date

      t.timestamps
    end
  end
end
