class CreateTeacherStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_students do |t|
      t.references :student, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
