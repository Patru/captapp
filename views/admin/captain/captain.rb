# encoding: UTF-8
require_relative '../../page'

module Views
  module Admin
    module Captain
      class Captain < Page
        needs :captain
        def form action, button='Create', method='post'
          frm= Forme.form(captain, {action: action, method: 'post'},
              hidden_tags: [{_method: method}, csrf_token]) do |f|
              f.inputs([:email, :name], legend: 'Captain data') do
                f.input(:password, type: :password)
                f.button(value: button, name: 'send')
              end
            end
          rawtext frm.to_s
        end
      end
    end
  end
end
