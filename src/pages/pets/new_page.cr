class Pets::NewPage < MainLayout
  needs owner : Owner
  needs save_pet : SavePet 

  def content 
    h2 "Create a Pet for #{@owner.first_name} #{@owner.last_name}"
    render_form(@save_pet)
  end

  private def render_form(op) 
    form_for Pets::Create.with(@owner.id) do 
      mount Shared::Field, op.name 
      mount Shared::Field, op.dob 
      select_input op.type do 
        options_for_select(op.type, types)
      end

      submit "Create Pet"
    end
  end

  private def types 
    [{"Dog", 1}, {"Cat", 2}, {"Other", 3}]
  end
end