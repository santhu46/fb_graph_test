class Renamecolumnusers < ActiveRecord::Migration
  def up
        change_table :users do |t|  
             t.change :identifier, :text 
      end
  end

  def down
change_table :users do |t|  
             t.change :identifier, :integer 
      end
  end
end
