Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Replace with your server's IP
    origins 'http://142.93.187.199:8080'

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
