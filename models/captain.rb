# encoding: UTF-8
require 'sequel/model'
require 'forme'
require 'shield'

class Captain < Sequel::Model
  include Shield::Model
  plugin :forme
  plugin :validation_helpers

  def validate
    validates_presence [:name, :email]
  end

  def show_path
    "/admin/captain/#{id}"
  end

  def edit_path
    show_path+"/edit"
  end
end