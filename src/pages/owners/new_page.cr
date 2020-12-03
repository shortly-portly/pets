class Owners::NewPage < MainLayout
  needs operation : SaveOwner
  needs pet : SavePet
  

  def content
    render_form(@operation)
  end

  private def render_form(op) 
    form_for Owners::Create do 
      mount Shared::Field, op.first_name
      mount Shared::Field, op.last_name
      mount Shared::Field, op.age 


      # text_input pet.name, name: "wibble[0]:name"
      # text_input pet.type, name: "wibble[1]:type"
      # text_input pet.type, name: "wibble[1]:id"
      
      submit "Create Owner"
    end
  end
end