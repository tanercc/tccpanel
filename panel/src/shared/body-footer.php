<?php

defined('BASEPATH') or exit('No direct script access allowed');

?>
<!-- Main Footer -->
<footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
        Taner ÇETİN
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2019 <a>tanercetin.net</a>.</strong> All rights reserved.
</footer>
</div>

<div class="modal fade" id="modal-panel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Panel Modal</h4>
            </div>
            <div class="modal-body">
                <p>Modal body&hellip;</p>
            </div>
            <div class="modal-footer">
                <button id="modal-close" type="button" class="btn btn-default pull-left" data-dismiss="modal"><?=lang('close')?></button>
                <!--button id="modal-sec" type="button" class="btn btn-primary"><?=lang('sec')?></button-<>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script>
    var modal_target_elem = null;
    function modalSelect(filename) {
        modal_target_elem.val(filename);
        $("#modal-panel").modal('hide');
    }
    $('#modal-sec').click(function(){});
</script>