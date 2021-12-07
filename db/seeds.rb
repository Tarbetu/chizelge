# frozen_string_literal: true

# This user will be created on `db:setup`.
# Don't hesiate about changing the usage below this comment except the "role" part.
# You may trigger this file again with `bin/rails db:seed`
User.create!({
              email: "the_best_example_ever@example.com",
              password: "1997.5",
              password_confirmation: "1997.5",
              role: "admin"
             })
