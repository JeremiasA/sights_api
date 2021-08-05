class AddContinentToCities < ActiveRecord::Migration[6.1]
  def change
    add_reference :cities, :continent, foreign_key: true
  end
end
