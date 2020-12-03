class CreatePets::V20201201174200 < Avram::Migrator::Migration::V1
  def migrate
    # Read more on migrations
    # https://www.luckyframework.org/guides/database/migrations
    #
    # create table_for(Thing) do
    #   primary_key id : Int64
    #   add_timestamps
    #
    #   add title : String
    #   add description : String?
    # end

    # Run custom SQL with execute
    #
    # execute "CREATE UNIQUE INDEX things_title_index ON things (title);"
    create table_for(Pet) do 
      primary_key id : Int64 
      add name : String 
      add dob : Time 
      add type : Int32 
      add_belongs_to owner : Owner, on_delete: :cascade
      add_timestamps
    end
  end

  def rollback
    drop table_for(Pet)
  end
end
