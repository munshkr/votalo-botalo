$(document).one("ready", function() {

	$("#slider").flexslider({
      	animation: "slide",
      	directionNav: false,
      	controlNav: true
    });

    $('a[rel=interno]').on('click', function() {
        var url = $(this).attr('href');
      //$.scrollTo(url,600); no funciono en chrome!!

      switch (url) {

        case '#slider':
          $('html, body').animate({scrollTop: 0}, 'slow');
          break 

        case '#preventiva':
          $('html, body').animate({scrollTop: 768}, 'slow');
          break 

        case '#deporte':
          $('html, body').animate({scrollTop: 1400}, 'slow');
          break 

        case '#embarazadas':
          $('html, body').animate({scrollTop: 2300}, 'slow');
          break 

        case '#empresarial':
          $('html, body').animate({scrollTop: 3000}, 'slow');
          break 

        case '#contacto':
          $('html, body').animate({scrollTop: 3700}, 'slow');
          break 
      }

      $('#header li').removeClass('presionado');
      //comparamos si el enlace es #contacto para no marcarlo
      if ($(this).attr('href') != '#contacto') {
        $(this).parent().addClass('presionado'); // marca el enlace como presionado
      }
    });


    // detecta la posición del scroll para marcar el menu
    $(window).scroll(function(){
      if($('#header').hittest('#preventiva') == true){
        $('#header li').removeClass('presionado');
        $('#header a[href=#preventiva]').parent().addClass('presionado');
      }
      if($('#header').hittest('#deporte') == true){
        $('#header li').removeClass('presionado');
        $('#header a[href=#deporte]').parent().addClass('presionado');
      }
      if($('#header').hittest('#embarazadas') == true){
        $('#header li').removeClass('presionado');
        $('#header a[href=#embarazadas]').parent().addClass('presionado');
      } 
      if($('#header').hittest('#empresarial') == true){
        $('#header li').removeClass('presionado');
        $('#header a[href=#empresarial]').parent().addClass('presionado');
      }
      if($('#header').hittest('#contacto') == true || $('#header').hittest('#slider') == true){
        $('#header li').removeClass('presionado');
      }      
    });

  // select -------------------------------------------
  /*$('select option:selected').each( function() {
    var txt = $(this).text();
    $(this).parent().parent().prepend('<span>'+txt+'</span>');
  });*/
  $('select').on('change', function() {
    $(this).children('option:selected').each( function() {
      var total = $(this).text();
      $(this).parent().parent().children('span').text(total);
    });
  });
  $('select').focus( function() {
    $(this).parent().css({
      border: '1px solid #aeaeae',
      background: '#f5f5f5 url(img/icon-calendario.png) 8px 5px no-repeat',
      color: '#666'
    });
  });
  $('select').blur( function() {
    $(this).parent().css({
      border: '1px solid #cecece',
      background: '#eeeeee url(img/icon-calendario.png) 8px -25px no-repeat',
      color: '#cecece'
    });
  });
  // fin select -----------------------------------  

  // toma los valores de cada input y los guarda y vacia en focus();
  // los restablece en blur()
      $('form input[type=text], form textarea').each(function(){
        // tomamos el valor actual del input
        var currentValue = $(this).val();
        // en el focus() comparamos si es el mismo por defecto, y si es asi lo vaciamos
        $(this).focus(function(){
          if( $(this).val() == currentValue ) {
            $(this).val('');
          };
        });
        // en el blur, si el usuario dejo el value vacio, lo volvemos a restablecer
        $(this).blur(function(){
          if( $(this).val() == '' ) {
            $(this).val(currentValue);
          };
        });
      });

  $("input[type=submit]").on('click', function() {
    $('.error, .enviado').remove();  
    // validate and process form here  
    var name = $("input[name=nombre]").val(); 
    if (name == "") {  
      $("#contacto form").prepend('<div class="error">Complete los campos requeridos</div>'); 
      $('.error').fadeIn(); 
      $("input[name=nombre]").focus();  
      return false;  
    }  
    //var email = $("input[name=email]").val();
    if($("input[name=email]").val().indexOf('@', 0) == -1 || $("input[name=email]").val().indexOf('.', 0) == -1) {  
      $("#contacto form").prepend('<div class="error">Complete los campos requeridos</div>'); 
      $('.error').fadeIn();   
      $("input[name=email]").focus();   
      return false;  
    } 
    var phone = $("textarea[name=mensaje]").val();
    if (phone == "") {  
      $("#contacto form").prepend('<div class="error">Complete los campos requeridos</div>'); 
      $('.error').fadeIn();   
      $("textarea[name=mensaje]").focus();  
      return false;  
    }  
  });   

  if (enviado == 'si') {
    $('html, body').animate({scrollTop: 3700}, 0);
  };


});// fin ready