$(document).ready(function(){
  function input(elem1, elem2){
    elem1.click(function(){
      elem2.modal({backdrop: "static"})
    })
  }
  input($('.chi'), $('#new-chi'))
  input($('.thu'), $('#new-thu'))
  input($('.edit_daily_cash'), $('#new-chi'))
  input($('.edit_input_money'), $('#new-thu'))

  function ajax_edit(elem1, url){
    elem1.click(function(){
      id_js = $(this).parent('td').siblings('td.stt').text()
      $.get({
        url: url,
        data: {id_js: id_js}
      })  
    })
  }

  ajax_edit($('button.edit_daily_cash'),'/daily_cashes/edit_out_js')
  ajax_edit($('button.edit_input_money'),'/input_moneys/edit_in_js')

  function toggle(button,elem){
    button.click(function(){
      elem.toggle(800)
    })
  }

  $('div.today').hide()
  $('div.month').toggle()
  $('button.today').one('click',function(){
    $('div.today').toggle('show')
  })
  $('button.month').one('click',function(){
    $('div.month').toggle('show')
  })

  $("input.month").datepicker({
    format: "mm/yyyy",
    viewMode: "months", 
    minViewMode: "months",
    todayHighlight: true,
    endDate: '0d',
    autoclose: true,
  });

  $('button.today').one('click',function(){
    $.get({
      url: "/daily_cashes/total_money_inday_js"
    })
  })

  $('input.month').change(function(){
    month = $(this).val()
    $.get({
      url: '/daily_cashes/money_with_month_js',
      data: {month: month}
    })
  })
})  