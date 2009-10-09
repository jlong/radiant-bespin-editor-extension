var BespinCodeAreaBehavior = Behavior.create({
  initialize: function() {
    new BespinCodeArea(this.element);
  }
});

var BespinCodeArea = Class.create({
  initialize: function(element) {
    var tab = element.up('tab');
    var height = element.getHeight();
    if (height == 0) height = 250;
    var div = $div({style: 'cursor: text; height: ' + height + 'px'});
    element.setStyle("position: absolute; left: -8000em");
    element.insert({after: div});
    this.editor = new bespin.editor.Component(
      div.identify(),
      {
        content: element.value,
        dontstealfocus: true,
        language: 'html'
      }
    );
    element.up('form').observe('submit', function() {
      element.value = this.editor.getContent();
    }.bind(this));
  }
});

// Remove the old behavior
delete Event.addBehavior.rules['form textarea'];

// Add the new
Event.addBehavior({
  'form textarea' : BespinCodeAreaBehavior()
});