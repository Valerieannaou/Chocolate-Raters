ThinkingSphinx::Index.define :chocolate, :with => :active_record do
  indexes name , sortable: true
  indexes chocolatier.name , :as => :chocolatier_name
  set_property :enable_star => 1
  set_property :min_infix_len => 2
  has created_at
end