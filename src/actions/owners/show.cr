class Owners::Show < BrowserAction
  get "/owners/:owner_id" do 
  owner = OwnerQuery.new.preload_pets.find(owner_id)
   # owner = OwnerQuery.new.find(owner_id)

    html ShowPage, owner: owner
  end
end