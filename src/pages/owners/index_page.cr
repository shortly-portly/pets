class Owners::IndexPage < MainLayout
  needs owners : Array(Owner)
  

  def content
    table do 
      thead do 
        tr do 
          th "First Name"
          th "Last Name"
          th "Age"
        end
      end

      tbody do 
        @owners.each do |owner|
          tr do 
            td owner.first_name
            td owner.last_name
            td owner.age 
            td  do  
              link "Details", to: Owners::Show.with(owner.id)
            end
            td do 
              link "Edit", to: Owners::Edit.with(owner.id)
            end
            td do 
              link "Delete", to: Owners::Delete.with(owner.id)
            end
          end
        end      
      end
    end

    link "New Owner", to: Owners::New  
 end
end
