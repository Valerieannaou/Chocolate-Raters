ThinkingSphinx::Index.define :chocolate, :with => :real_time do
  indexes name , sortable: true, :infixes => true
  indexes chocolatier.name , :as => :chocolatier_name, :infixes => true
  set_property :enable_star => 1
  set_property :min_infix_len => 3
end