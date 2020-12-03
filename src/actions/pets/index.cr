class Pets::Index < BrowserAction
  get "/pets/" do
    pets = PetQuery.all.preload_owner.results
    html IndexPage, pets: pets
  end
end
