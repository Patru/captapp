# encoding: UTF-8


module Views
  module Admin
    module Captain
      class Index < Page
        needs :captains

        def page_title
          'List of all captains'
        end
        def body_content
          h1 page_title

          captains_table
          a href:'/admin/captain/new' do
            text 'New Captain'
          end
        end

        def captains_table
          table 'class' => 'captains' do
            thead do
              th 'Name'
              th 'E-mail'
              th colspan:2 do
                'Actions'
              end
            end
            tbody do
              captains.each do |captain|
                tr do
                  td do
                    #a href:captain.show_path, title: 'show details' do
                      text captain.name
                    #end
                  end
                  td captain.email
                  td do
                    #a href:admin.edit_path, title: 'edit' do
                      text 'edit'
                    #end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
