class Owners::EditPage < MainLayout
  needs save_owner : SaveOwner
  needs owner : Owner

  def content
    render_form(@save_owner)
  end

  private def render_form(so)
    form_for Owners::Update.with(@owner.id) do
      mount Shared::Field, so.first_name
      mount Shared::Field, so.last_name
      mount Shared::Field, so.age
    
      submit "Update Owner"
    end
  end
end