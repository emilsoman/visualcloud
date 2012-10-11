(function($) {
  $.widget("graph.EC2Resource", {
    options: {
      instanceHtml: ''
    },
    instanceCount: 0,
    onElementDrop: function(params){
      console.log('EC2 received element drop');
      //Look in app/views/graphs/_dialogs.html.erb to see all dialogs 
      //or to add a dialog for a new resource type
      //
      //
      //var newInstance = addInstanceCloneToGraph(this,params);
      //showConfigurationForm('ec2-configuration', newInstance);
      var droppedPosition = params.args.position
      showConfigurationFormRefactored('ec2-configuration', droppedPosition);
      //newInstance.draggable({containment: 'parent'});
    }
  });
})(jQuery);


//configuration request and response handling
$(document).ready(function(){
  //Add event listeners to Submit button of instance configuration popin
  $('div#ec2-configuration .instance-config-submit').click(function(){
    var xpos = $('#ec2-configuration').data('xpos'); 
    var ypos = $('#ec2-configuration').data('ypos'); 
    $('input#ec2_xpos').val(xpos);
    $('input#ec2_ypos').val(ypos);
    return true;
  });

});

