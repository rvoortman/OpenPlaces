# frozen_string_literal: true

group :test do
  guard :rspec, cmd: 'bin/spring rspec --color', failed_mode: :none do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})                  {|m| "spec/lib/#{m[1]}_spec.rb" }
    watch(%r{^spec/support/(.+_context)\.rb$}) {|m| "spec/test_helpers/#{m[1]}_spec.rb" }

    watch(%r{^spec/(support/shared_examples/.+?)\.rb$}) do |match|
      `grep #{match[1]} -rl spec`.split(/\s+/)
    end

    watch(%r{^app/(.+)\.rb$})                           {|m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^app/(.*)(\.erb|\.haml)$})                 {|m| "spec/#{m[1]}#{m[2]}_spec.rb" }
    watch(%r{^app/controllers/(.+)_(controller)\.rb$})  do |m|
      [
        "spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
        "spec/acceptance/#{m[1]}_spec.rb"
      ]
    end
    watch('app/controllers/application_controller.rb') { "spec/controllers" }
  end
end

scope group: :test
