// jumpToArea(sel) ->
//   if (sel.selectedIndex < 1)
//     sel
//   area = sel.options[sel.selectedIndex].value
//   
//   if (document.location.pathname.match(/^\/accounts\/\d+/))
//     document.location.href = document.location.pathname.replace(/\d+/, area)
//   else
//     document.location.href = '/operator/accounts/' + area + '/edit'

// Area drop down selector
function jumpToArea(sel) {
    if (sel.selectedIndex < 1) return;
    area = sel.options[sel.selectedIndex].value;
    
    if (document.location.pathname.match(/^\/accounts\/\d+/)) {
        document.location.href = document.location.pathname.replace(/\d+/, area)
    } else {
        document.location.href = '/operator/accounts/' + area + '/edit'
    }
}
