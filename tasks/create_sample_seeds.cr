require "../spec/support/boxes/**"

# Add sample data helpful for development, e.g. (fake users, blog posts, etc.)
#
# Use `Db::CreateRequiredSeeds` if you need to create data *required* for your
# app to work.
class Db::CreateSampleSeeds < LuckyCli::Task
  summary "Add sample database records helpful for development"

  def call
    OwnerBox.create &.first_name("Homer").last_name("Simpson")
    OwnerBox.create &.first_name("Marge").last_name("Simpson")

    puts "Done adding sample data"
  end
end
