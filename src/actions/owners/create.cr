class Owners::Create < BrowserAction
  post "/owners/" do 
    # puts "params : #{params.many_nested("wibble")}"
    SaveOwner.create(params) do |operation, owner|
      if owner
        redirect to: Owners::Index
      else
        html NewPage, operation: operation, pet: SavePet.new

      end
    end
  end
end