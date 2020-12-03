class Owners::ShowPage < MainLayout
  needs owner : Owner

  def content
    h1 "Owner Details"

    h3 "First Name: #{@owner.first_name}"
    h3 "Last Name: #{@owner.last_name}"
    h3 "Age: #{@owner.age}"

    table do 
      thead do 
        tr do 
          th "Name"
          th "DOB"
          th "Type"
        end
      end

      tbody do 
        @owner.pets.each do |pet|
          tr do 
            td pet.name
            td pet.dob.to_s("%d/%m/%Y")
            td pet.type 
          end
        end      
      end


    end

    h3 @owner.pets[0].name 
    link "Add Pet", to: Pets::New.with(@owner.id)

  end
end