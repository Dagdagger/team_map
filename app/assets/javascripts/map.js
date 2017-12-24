
ready = function() {
 var script = document.createElement('script');
 script.type = 'text/javascript';
 script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +'libraries=places&'+'callback=initialize';
   document.body.appendChild(script);
  };
