# encoding: UTF-8
require_relative '../models/admin'
require_relative '../models/captain'
require_relative '../views/admin/captain/all'
require_relative '../views/forbidden_request'

class CaptainRoutes < Cuba
  define do
    on get do
      on 'index' do
        res.write forti(Views::Admin::Captain::Index, captains:Captain.all)
      end

      on 'new' do
        res.write forti(Views::Admin::Captain::New, captain:Captain.new)
      end

      on ':id' do |id|
        cpt=Captain[:id]
        if cpt
          on root do
            res.write forti(Views::Admin::Captain::Show, captain:cpt)
          end
          on 'edit' do
            res.write forti(Views::Admin::Captain::Edit, captain:cpt)
          end
        else
          flash[:error]='Could not find captain'
          res.redirect '/admin/captain/index'
        end
      end
    end

    on post, root, param('captain') do |captain|
      cpt = Captain.new(captain)
      if cpt.save
        res.redirect cpt.show_path
      else
        res.write forti(Views::Admin::Captain::New, captain:cpt)
      end
    end

    on put, ':id', param('captain') do |id, captain|
      cpt=Captain[id:id]
      if cpt
        cpt.set_fields(captain, ['name', 'email'])
        if cpt.valid? && cpt.save
          res.write forti(Views::Admin::Captain::Show, captain:cpt)
        else
          flash[:error]="captain could not be saved"
          res.write forti(Views::Admin::Captain::Edit, captain:cpt)
        end
      else
        flash[:error]='Could not find captain #{id}'
        res.redirect '/admin/captain/index'
      end
    end
  end

end
