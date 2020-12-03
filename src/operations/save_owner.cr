class SaveOwner < Owner::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  #
  # permit_columns column_1, column_2

  permit_columns first_name, last_name, age

  before_save do 
    if first_name.changed? || last_name.changed?
      validate_uniqueness_of_fullname
    end
    
    validate_age
  end

  def validate_uniqueness_of_fullname
    if OwnerQuery.new.first_name.nilable_eq(first_name.value).last_name.nilable_eq(last_name.value).first?
      first_name.add_error("This name has already been taken")
    end
  end

  def validate_age
    age.value.try do |value| 
      if value < 18 
        age.add_error "An owner must be over 18 years of age"
      end
    end
  end
end
