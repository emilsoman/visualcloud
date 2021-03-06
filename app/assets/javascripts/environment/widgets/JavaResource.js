(function($) {
  $.widget("environment.JavaResource", {
    options: {
      resourceName: null,
      roles: []
    },
    onElementDrop: function(params){
      //Look in app/views/environments/_dialogs.html.erb to see all dialogs
      //or to add a dialog for a new resource type
      var droppedElement = params.args.helper ;
      var stage = params.droppable;
      var droppedPosition = {} ;
      var resourceName = this.options.resourceName ;
      droppedPosition.top = droppedElement.position().top - stage.position().top ;
      droppedPosition.left = droppedElement.position().left - stage.position().left ;
      if(!document.getElementById("Java_version"))
        this.addDropDownForJavaVersion();
      addSlider(resourceName+"-slider");
      showConfigurationForm(resourceName+ '-configuration', droppedPosition);
    },
    addDropDownForJavaVersion: function(){
        addJavaVersionDropDown();
    },
    _create: function(){
      this.setDialog();
    },
    setDialog: function(){
      var resourceName = this.options.resourceName ;
      var roles = this.options.roles ;
      var self = this;
      $(document).ready(function(){
        //Add event listeners to Submit button of instance configuration popin
        $('div#'+ resourceName  +'-configuration .instance-config-submit').click(function(){
          var xpos = $('#' + resourceName  + '-configuration').data('xpos');
          var ypos = $('#'+ resourceName  + '-configuration').data('ypos');
          var editElement = $('#' + resourceName + '-configuration').data('editElement');
          var label = $('input#' + resourceName  + '_label').val().trim();
          var parents_list = $('#' + resourceName + '_parents_list').val();
          var amiId = parseInt($('#' + resourceName + '_ami_id').val());
          var InstanceTypeId = parseInt($('#' + resourceName + '_instance_type_id').html());
          var elasticIp = $('input#'+ resourceName +'_elasticIp')[0].checked;
          var labelIcon = getInstanceTypeLabel(ec2InstanceTypes,InstanceTypeId);
          var java_version = $('#' + resourceName + '_version').val();
          var config_attributes = {};
          config_attributes = {elasticIp:elasticIp,roles:roles, parents_list:parents_list, label:labelIcon,ami_id:amiId,java_version:java_version};
          if ( self.validate(label) ){
            if (editElement == null) {
              var newInstance = addInstanceCloneToGraph();
              newInstance.instance({xpos: xpos, ypos: ypos, label: label, resourceType: resourceName, InstanceType: InstanceTypeId, configAttributes: config_attributes});
            }
            else {
              var existingInstance = $('#'+editElement);
              existingInstance.instance("option", {label: label, InstanceType: InstanceTypeId, configAttributes: config_attributes});
            }
            $('#' + resourceName + '-configuration').modal('hide');
          }
          return false;
        });

      });
    },
    validate: function(label){
      if(label == "")
      {
        addMessagesToDiv($('#' + this.options.resourceName + '-config-error-messages'), getErrorMessage('Label cannot be empty'));
        return false;
      }
      return true;
    }
  });
})(jQuery);
