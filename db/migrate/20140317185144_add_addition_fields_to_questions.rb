class AddAdditionFieldsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_type, :string, default: 'text'
    add_column :answers, :correct, :boolean, default: false
  end
end
