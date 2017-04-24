// wait for the DOM to be loaded 
$(document).ready(function() { 
    // bind 'myForm' and provide a simple callback function 
    $('#form').ajaxSubmit(function() { 
      
      $(this).submit(); 
      return false;
    }); 
}); 
