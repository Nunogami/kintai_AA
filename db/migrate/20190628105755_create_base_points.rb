class CreateBasePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :base_points do |t|
      t.string :base_point_name
      t.string :time_classification

      t.timestamps
    end
  end
end
