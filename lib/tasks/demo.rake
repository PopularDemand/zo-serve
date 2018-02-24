require 'fileutils'

namespace "demo" do

  desc 'Start the Websocket Demo'
  task :start do
    demo_dir = "#{Rails.root}/demo"
    sh "cd #{demo_dir} && ruby -run -e httpd . -p 8000"
  end

end