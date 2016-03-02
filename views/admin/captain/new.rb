# encoding: UTF-8
require_relative 'captain'

module Views
  module Admin
    module Captain
      class New < Captain
        def page_title
          'Create a new captain'
        end

        def body_content
          form('/admin/captain')
        end
      end
    end
  end
end
