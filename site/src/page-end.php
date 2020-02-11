<?php

defined('BASEPATH') or exit('No direct script access allowed');

?>

<footer>
    <div class="footer">
        <div class="container">
            <div class="col-md-4 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.2s">
                <h2>Multi</h2>
                <p>In a elit in lorem congue varius. Sed nec arcu. Etiam sit amet augue. Fusce fermen tum neque a rutrum varius odio pede ullamcorp-er tellus ut dignissim nisi risus non tortor. Aliquam mollis neque.</p>

                <ul class="social-network">
                    <li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook fa-1x"></i></a></li>
                    <li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter fa-1x"></i></a></li>
                    <li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin fa-1x"></i></a></li>
                    <li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest fa-1x"></i></a></li>
                    <li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus fa-1x"></i></a></li>
                </ul>
            </div>

            <div class="col-md-4 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.4s">
                <h3>RECENT POSTS</h3>
                <ul>
                    <li>Awesome Design with Overviews</li>
                    <hr>
                    <li>Great Design with Features </li>
                    <hr>
                    <li>Limitless functions & Works </li>
                    <hr>
                    <li>Multi is simple and clean design</li>
                </ul>
            </div>

            <div class="col-md-4 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.6s">
                <h3>CONTACT INFO</h3>
                <ul>
                    <li><i class="fa fa-home fa-2x"></i> Office # 38, Suite 54 Elizebth Street, Victoria State Newyork, USA 33026</li>
                    <hr>
                    <li><i class="fa fa-phone fa-2x"></i> +38 000 129900</li>
                    <hr>
                    <li><i class="fa fa-envelope fa-2x"></i> info@domain.net</li>
                </ul>
            </div>

        </div>
    </div>

    <div class="sub-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    &copy; Multi Theme. All Rights Reserved.
                    <div class="credits">
                        <!--
                All the links in the footer should remain intact.
                You can delete the links only if you purchased the pro version.
                Licensing information: https://bootstrapmade.com/license/
                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Multi
              -->
                        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <ul class="pull-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Services</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Portfolio</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
            <div class="pull-right">
                <a href="#home" class="scrollup"><i class="fa fa-angle-up fa-3x"></i></a>
            </div>
        </div>
    </div>
</footer>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<?= BASEPATH ?>/js/jquery-2.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<?= BASEPATH ?>/js/bootstrap.min.js"></script>
<script src="<?= BASEPATH ?>/js/wow.min.js"></script>
<script src="<?= BASEPATH ?>/js/fancybox/jquery.fancybox.pack.js"></script>
<script src="<?= BASEPATH ?>/js/jquery.easing.1.3.js"></script>
<script src="<?= BASEPATH ?>/js/jquery.bxslider.min.js"></script>
<script src="<?= BASEPATH ?>/js/jquery.prettyPhoto.js"></script>
<script src="<?= BASEPATH ?>/js/jquery.isotope.min.js"></script>
<script src="<?= BASEPATH ?>/js/functions.js"></script>
<script>
    wow = new WOW({}).init();
</script>

<?php

if (isset($page_script)) {
    echo $page_script;
}

if (file_exists(dirname(__FILE__) . "routes/$request_route/script.php")) {
    include_once(dirname(__FILE__) . "routes/$request_route/script.php");
}

?>

</body>

</html>