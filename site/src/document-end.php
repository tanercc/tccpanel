<?php

defined('BASEPATH') or exit('No direct script access allowed');

?>
<!-- JsTree -->
<script src="/node_modules/jstree/dist/jstree.min.js"></script>
<!-- Select2 -->
<script src="/node_modules/select2/dist/js/select2.min.js"></script>
<!-- DataTables -->
<script src="/node_modules/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/node_modules/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- Bootstrap Confirmation 2 -->
<script src="/node_modules/bootstrap-confirmation2/bootstrap-confirmation.js"></script>
<!-- SlimScroll -->
<script src="/node_modules/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/node_modules/fastclick/lib/fastclick.js"></script>
<!-- iCheck -->
<script src="/node_modules/icheck/icheck.min.js"></script>
<!-- Summernote -->
<script src="/node_modules/summernote/dist/summernote.js"></script>
<!-- include summernote-tr-TR -->
<script src="/node_modules/summernote/dist/lang/summernote-tr-TR.js"></script>
<!-- Dropzone -->
<script src="/node_modules/dropzone/dist/dropzone.js"></script>
<!-- AdminLTE App -->
<script src="<?= BASEPATH ?>/dist/js/adminlte.min.js"></script>
<!-- Custom Script -->
<script src="<?= BASEPATH ?>/js/script.js"></script>

<script>
    function uploadSummerImage(image, editor) {
        var data = new FormData();
        data.append("file", image);
        $.ajax({
            url: '<?= set_href('files', 'upload') ?>',
            cache: false,
            contentType: false,
            processData: false,
            data: data,
            type: "post",
            success: function(data) {
                if (data.success) {
                    var image = $('<img>').attr('src', data.result);
                    $(editor).summernote("insertNode", image[0]);
                } else {
                    alert(data.result);
                }
            },
            error: function(data) {
                console.log(data);
            }
        });
    }

    async function deleteFile(file) {
        var result = "";
        var data = new FormData();
        data.append("folder", '<?= $request_route ?>');
        data.append("id", '<?= $request_id ?>');
        data.append("file", file);
        $.ajax({
            url: '<?= set_href('files', 'delete') ?>',
            cache: false,
            contentType: false,
            processData: false,
            data: data,
            type: "post",
            success: function(data) {
                if (data.success) {
                    result = data.result;
                } else {
                    alert(data.result);
                }
            },
            error: function(data) {
                console.log(data);
            }
        });
        return result;
    }

    $(document).ready(function() {
        $('.summernote').summernote({
            lang: 'tr-TR', // default: 'en-US'
            height: 200,
            callbacks: {
                onImageUpload: function(image) {
                    uploadSummerImage(image[0], this);
                }
            }
        });
    });
</script>

<?php

if (isset($page_script)) {
    echo $page_script;
}

if (file_exists("src/routes/$request_route/script.php")) {
    include_once("src/routes/$request_route/script.php");
}

?>
</body>

</html>