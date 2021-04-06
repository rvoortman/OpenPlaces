# frozen_string_literal: true

Users::CreateUser.run!(email: "test@example.org", password: "testtest",
                       password_confirmation: "testtest")
