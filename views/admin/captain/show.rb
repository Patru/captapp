# encoding: UTF-8
require_relative '../../page'

module Views
  module Admin
    module Captain
      class Show < Page
        needs :captain
        def captain_detail
          table class:'captain' do
            tbody do
              tr do
                td 'Name:'
                td captain.name
              end
              tr do
                td 'Email:'
                td captain.email
              end
            end
          end
        end

        def item_navigation
          nav 'class' =>'item' do
            ul do
              li do
                a href:captain.edit_path do
                  text 'Edit'
                end
              end
=begin            li do
              a href:captain.delete_path do
                text 'Delete'
              end
=end
            end
          end
        end

        def page_title
          "Details for captain #{captain.name}"
        end

        def body_content
          captain_detail
          item_navigation
        end
      end
    end
  end
end
