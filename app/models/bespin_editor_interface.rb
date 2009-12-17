module BespinEditorInterface
  def self.included(base)
    base.class_eval {
      before_filter :add_bespin_editor, :only => [:edit, :new]
      include InstanceMethods
    }
  end

  module InstanceMethods
    def add_bespin_editor
      include_javascript 'admin/bespin.js'
      include_javascript 'admin/bespin/codearea.js'
    end
  end
end
