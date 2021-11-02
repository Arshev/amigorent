class AddQuestionsMainToTexts < ActiveRecord::Migration[6.1]
  def change
    add_column :texts, :main_question_1, :text, default: "empty"
    add_column :texts, :main_question_2, :text, default: "empty"
    add_column :texts, :main_question_3, :text, default: "empty"
    add_column :texts, :main_question_1_en, :text, default: "empty"
    add_column :texts, :main_question_2_en, :text, default: "empty"
    add_column :texts, :main_question_3_en, :text, default: "empty"
    add_column :texts, :main_question_title_1, :text, default: "empty"
    add_column :texts, :main_question_title_2, :text, default: "empty"
    add_column :texts, :main_question_title_3, :text, default: "empty"
    add_column :texts, :main_question_title_1_en, :text, default: "empty"
    add_column :texts, :main_question_title_2_en, :text, default: "empty"
    add_column :texts, :main_question_title_3_en, :text, default: "empty"
  end
end
