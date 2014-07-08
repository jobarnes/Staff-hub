<script src="./?a=1066805"></script><!-- jQuery.js -->
<script src="./?a=1066794"></script><!-- bootstrap.js -->
<script src="./?a=1066768"></script><!-- Handlebars.js -->
<script src="./?a=1066745"></script><!-- Typeahead.js -->

<script>
var initTA = function(){
    $('#comboform .typeahead').typeahead({
    highlight: true,
      hint: true,
    minLength: 2
  }, {
    name: 'sitesearch',
    displayKey: 'name',
    source: sitesearch.ttAdapter(),
    templates: {
    
      suggestion: Handlebars.compile('<p><a href="{{url}}">{{value}}</p>')
  }
  }); 
  };
  
$('input.typeahead').on('typeahead:selected', function(event, selection) {
  window.location.href = selection.url;
});
  $("input[name=s-type]").change(function(){
    if ($(this).attr("id")=="s-type-what") {
      $("#comboform").attr("action","http://search.unimelb.edu.au");
      $("#q").attr("placeholder","What are you looking for?").attr("name","q");
      $("#q").attr("aria-label","Site Search");
      $('#q').off( 'click.p');
      initTA();
      $('#comboform').submit(function(){$("#comboform").attr("action","http://search.unimelb.edu.au");});
    
    }else{
     
      $("#q").attr("placeholder","Who are you looking for?");
      $("#q").attr("aria-label","People Search");
      $('#comboform .typeahead').typeahead('destroy');
      $('#comboform').submit(function(){$("#comboform").attr("action","https://staff.unimelb.edu.au/preview/directory/index.html#/search/" + $('#q').val());});
    }
  });
  
   var sitesearch = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: './?a=1061021',
    limit: 10,
  });

  sitesearch.initialize();
  initTA();
</script>