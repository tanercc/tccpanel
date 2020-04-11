/* Custom Javascript */ 

$(document).ajaxSend(function(event, request, settings) {
    request.setRequestHeader("X-Requested-With", "XMLHttpRequest");
});

$("a.sidebar-toggle").on("click", function() {
    var sc = (localStorage.getItem('sidebar-collapse') == 'true') ? 'false' : 'true';
    localStorage.setItem('sidebar-collapse', sc);
    console.log(localStorage.getItem('sidebar-collapse'))
});

if (localStorage.getItem('sidebar-collapse') == 'true') {
    $("body").addClass("sidebar-collapse");
}

var modal_target_elem = null;

function bs_input_file() {
	$(".input-file").each(function(){
        var element = this;
        $(element).find("button.btn-choose").click(function(){
            modal_target_elem = element;
            loadFileModal(element);
        });
        $(element).find("button.btn-reset").click(function(){
            $(element).find('input').val('');
        });
        $(element).find("button.btn-view").click(function(){
            //$(element).find('input').val('');
        });
        $(element).find('input').css("cursor","pointer");
        $(element).find('input').mousedown(function() {
            $(element).find("button.btn-choose").click();
            return false;
        });
    });
}
$(function() {
	bs_input_file();
});
function modalSelect(filename) {
    $(modal_target_elem).find('input')[0].val(filename);
    $(modal_target_elem).find('input')[1].val(filename.split('/').reverse()[0]);
    $("#modal-panel").modal('hide');
}

function selectFile(filename) {
    $(modal_target_elem).val(filename);
}

