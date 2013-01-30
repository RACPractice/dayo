Given(/^a route exists with origin: (.*?) and destination: (.*?)$/) do |origin, destination|
  Route.create! origin: origin, destination: destination
end
