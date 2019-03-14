class AddBelongsToFieldsToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :role_id, :bigint
    add_column :questions, :mapping_id, :bigint
  end
end
