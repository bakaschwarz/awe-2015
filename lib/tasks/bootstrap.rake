namespace :bootstrap do
  desc "Add the default user"
  task :default_user => :environment do
    User.create!(
        email: "example@example.com",
        password: "admin",
        password_confirmation: "admin"
    )
  end

  desc "Create the default configuration"
  task :default_config => :environment do
    Config.create!(
        user_id: 1,
        filter_range: (60*60*2),
    )
  end

  desc "Create the default visualization types"
  task :default_visualization => :environment do
    VisualizationType.create!([
      {
          name: "Line",
          chart_keyword: "spline"
      },
      {
        name: "Scatter",
            chart_keyword: "scatter"
      },
      {
          name: "Bar",
          chart_keyword: "column"
      },
      {
          name: "Area",
          chart_keyword: "areaspline"
      }
  ])
  end

  desc "Create a random api token"
  task :api_token => :environment do
    ApiToken.create!(
                token: SecureRandom.hex
    )
  end

  desc "Run all bootstrapping tasks"
  task :all => [:default_user, :default_config, :default_visualization, :api_token]
end