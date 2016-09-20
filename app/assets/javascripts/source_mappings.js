// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {
  $('.dataSourceTableSelect').change(function(){
    $('.dataSource').find('.card').addClass('hidden');
    $('.dataSource').find('#table-'+$(this).val()).removeClass('hidden');
  });

  $('.sourceColumn').change(function(){
    var $sourceColumn = $(this);
    var sourceColumnName = $sourceColumn.val();
    // console.log($sourceColumn.is(':checked'));
    // console.log(sourceColumnName);
    if($sourceColumn.is(':checked')) {
      $('.dataTranslations > tbody').append(
        '<tr id="translation-'+sourceColumnName+'"><td>'+sourceColumnName+'</td><td><input type="text" class="form-control" value="'+sourceColumnName+'"></td><td></td><td></td></tr>'
      );
    } else {
      $('#translation-'+sourceColumnName).remove();
    }
  });

  $('.addCsvColumnButton').click(function(){
    console.log('clicked');
    $('.csvColumns').append(
      '<div class="form-group"><label>Column Name</label><input type="text" class="form-control">'
    );
  });
});
