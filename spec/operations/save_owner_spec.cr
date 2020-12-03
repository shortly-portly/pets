require "../spec_helper"

describe SaveOwner do
  it "should create an owner" do
    owner = SaveOwner.create!(first_name: "Dave", last_name: "Simmons", age: 22)
    owner.first_name.should eq "Dave"
  end

  it "should return an error if mandatory fields are not specified" do
    SaveOwner.create() do |operation, owner|
      owner.should eq nil
      operation.first_name.errors.should eq ["is required"]
      operation.last_name.errors.should eq ["is required"]
      operation.age.errors.should eq ["is required"]
    end
  end

  it "should error if the first name + last name already exist" do
    params = Avram::Params.new({"first_name" => "Dave", "last_name" => "Simmons", "age" => "22"})
    owner = SaveOwner.create!(params)
    owner.first_name.should eq "Dave"

    SaveOwner.create(params) do |operation, owner|
      owner.should eq nil
      operation.first_name.errors.should eq ["This name has already been taken"]
    end
  end

  it "should error if age is less than 18" do
    params = Avram::Params.new({"first_name" => "Dave", "last_name" => "Simmons", "age" => "15"})
    SaveOwner.create(params) do |operation, owner|
      owner.should eq nil
      operation.age.errors.should eq ["An owner must be over 18 years of age"]
    end
  end
end