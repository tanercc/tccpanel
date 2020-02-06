<?php

defined('BASEPATH') or exit('No direct script access allowed');

?>
<!-- iCheck -->
<script>
    $(function() {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '0%' /* optional */
        });
    });
</script>

<!-- Login -->
<script>
    $("#loginform").submit(function(e) {
        e.preventDefault();
        if (!this.checkValidity()) {
            this.reportValidity();
            return;
        }
        $.ajax({
            url: this.action,
            type: this.method,
            data: $(this).serialize(),
            beforeSend: function() {
                $('.fa.fa-spinner').show();
            }
        }).done(function(data) {
            if (data.success) {
                window.location.replace("<?= set_href('home') ?>");
            }
            console.log('OK');
            $('.fa.fa-spinner').hide();
        }).fail(function() {
            console.log('ER');
            $('.fa.fa-spinner').hide();
        });
    });
</script>