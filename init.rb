config.gem 'factory_girl', :source => 'http://gemcutter.org'

config.after_initialize do
  %w(test spec).each do |dir|
    factories = File.join(RAILS_ROOT, dir, 'factories.rb')
    require factories if File.exists?(factories)
    Dir[File.join(RAILS_ROOT, dir, 'factories', '*.rb')].each do |file|
      require file
    end
  end  
end
