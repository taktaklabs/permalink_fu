require 'rails'

module PermalinkFu
  
  class Railtie < ::Rails::Railtie
    
    initializer 'permalink_fu.insert_into_active_record' do
      ::ActiveSupport.on_load :active_record do
        include PermalinkFu::ActiveRecord
      end
    end

    # rake_tasks do
    #  load "tasks/permalink_fu.rake"
    # end

  end

end
