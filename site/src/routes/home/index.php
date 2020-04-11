<?php

defined('BASEPATH') or exit('No direct script access allowed');

$sliders = db_get_table_with_lang('slider', $lang_id);
$slidertypes = db_get_table_data('slidertype','*');

?>

<div class="slider">
    <div class="img-responsive">
        <ul class="bxslider">
            <?php
            foreach ($sliders as $slider) {
                echo "<li><img src='" . $slider["image"] . "' alt /></li>";
            }
            ?>
        </ul>
    </div>
</div>