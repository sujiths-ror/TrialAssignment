class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question, null: false
      t.integer :priority
      t.integer :teaming_stages
      t.integer :appears
      t.string :question_type
      t.boolean :required
      t.integer :conditions
      t.integer :frequency

      t.timestamps
    end
  end
end
