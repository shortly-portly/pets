class Owners::New < BrowserAction
  get "/owners/new/" do 
    
    html NewPage, operation: SaveOwner.new, pet: SavePet.new
  end
end