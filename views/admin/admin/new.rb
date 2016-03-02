# encoding: UTF-8
require_relative 'admin'

module Views
  module Admin
    module Admin
      class New < Admin
        def page_title
          'Create a new Admin'
        end

        def body_content
          form('/admin/create')
        end
      end
    end
  end
end
