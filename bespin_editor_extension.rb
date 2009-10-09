# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class BespinEditorExtension < Radiant::Extension
  version "1.0"
  description "Replaces textareas with the Bespin text editor from Mozilla. Only works in Web browsers that support the canvas tag."
  url "https://bespin.mozilla.com/"
  
  def activate
    Admin::ResourceController.send :include, BespinEditorInterface
  end
end