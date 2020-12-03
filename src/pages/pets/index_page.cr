class Pets::IndexPage < MainLayout
  needs pets : Array(Pet)
  
  def content
    table do 
      thead do 
        tr do 
          th "Name"
          th "Owner"
        end
      end

      tbody do 
        @pets.each do |pet|
          tr do 
            td pet.name
            td pet.owner.first_name
          end
        end      
      end
    end

 end
end
