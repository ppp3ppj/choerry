# frozen_string_literal: true

SimpleCov.start 'rails' do
  # to ignore some file in coverage
  add_filter [
    'app/mailers/application_mailer.rb',
    'app/jobs/application_job.rb',
    'app/channels/application_cable/connection.rb',
    'app/channels/application_cable/channel.rb',
    'app/controllers/api/v1/example_controller.rb'
  ]
end

SimpleCov.at_exit do
  SimpleCov.result.format!
  SimpleCov.minimum_coverage 90
end
