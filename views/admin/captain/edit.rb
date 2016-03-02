# encoding: UTF-8
require_relative 'captain'

module Views
  module Admin
    module Captain
      class Edit < Captain
        def page_title
          "Edit captain #{captain.name}"
        end

        def body_content
          unless captain.errors.empty?
            div :class => 'error-messages' do
              ul do
                captain.errors.full_messages.each do |message|
                  li message
                end
              end
            end
          end
          form(captain.show_path, 'Save', 'put')
        end
      end
    end
  end
end
