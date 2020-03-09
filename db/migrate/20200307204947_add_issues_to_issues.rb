class AddIssuesToIssues < ActiveRecord::Migration[5.0]
  def change
    add_reference :issues, :project, foreign_key: true
  end
end
