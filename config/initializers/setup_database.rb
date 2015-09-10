# Set up the database with the standard values. Check if the things are existent, otherwise just create them.

if Rails.env() == "production"
  puts "Begin checking of database..."
  begin
    puts "The Admin exists with the mail: #{User.first.email}"
  rescue
    puts
    "No Admin exists...
    Creating new user with mail 'example@example.com' and password 'admin'"
    User.create!(
        email: "example@example.com",
        password: "admin",
        password_confirmation: "admin"
    )
  end

  begin
    Config.first
    puts "The configuration exists..."
  rescue
    puts
    "No configuration exists... creating a new one"
    Config.create!(
        user_id: User.first.id,
        filter_range: (60*60*2),
        filter_precision: 30
    )
  end

  begin
    VisualizationType.first
    puts "The visualization types are set..."
  rescue
    "No visualization types found... generating new ones"
    VisualizationType.create!([
    {
        name: "Scatter",
        chart_keyword: "scatter"
    },
    {
        name: "Line",
        chart_keyword: "spline"
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
end