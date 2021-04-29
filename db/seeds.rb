# frozen_string_literal: true

user = Users::CreateUser.run!(email: "test@example.org", password: "testtest",
                       password_confirmation: "testtest")

Categories::CreateCategory.run!(user: user, title: "Test", color: "#123456")
