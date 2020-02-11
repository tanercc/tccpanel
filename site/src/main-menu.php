<?php

defined('BASEPATH') or exit('No direct script access allowed');

// Anamenu bootstrap .dropdown .dropdown-menu .dropdown-submenu

function make_cat_menu()
{
    global $datacats;
    $result = "";
    foreach ($datacats as $j => $cat) {
        if (!$cat["upper_id"]) {
            $result .= '<li class="nav-item"><a class="nav-link" href="' . href_cat($cat) . '">' . $cat["name"] . '</a></li>' . "\r\n";
        }
    }
    return $result;
}

function make_main_menu($menu_id, $type_id = 1)
{
    global $menus;
    $result = "";
    foreach ($menus as $j => $menu) {
        if ($menu["upper_id"] == $menu_id) {
            if ($menu["link"] == "cats") {
                $sub_menu = make_cat_menu();
            } else {
                $sub_menu = make_main_menu($menu["id"]);
            }
            if ($sub_menu) {
                $sub_menu = '<ul class="dropdown-menu">' . $sub_menu . '</ul>' . "\r\n";
                $result .= '<li class="nav-item dropdown' . (($menu["UstAydi"]) ? ' dropdown-submenu' : '') . '"><a class="nav-link" data-toggle="dropdown" href="' . href_menu($menu) . '">' . $menu["name"] . '</a>' . $sub_menu . '</li>' . "\r\n";
            } else $result .= '<li class="nav-item"><a class="nav-link" href="' . href_menu($menu) . '">' . $menu["dataAd"] . '</a></li>' . "\r\n";
        }
    }
    return $result;
}
$ustMenu = 0;
$zDataMenu = make_main_menu($ustMenu);
echo $zDataMenu;
?>

<script type="text/javascript">
    // <![CDATA[
    function toggleDropdown(e) {
        const _d = $(e.target).closest('.dropdown'),
            _m = $('.dropdown-menu', _d);
        setTimeout(function() {
            const shouldOpen = e.type !== 'click' && _d.is(':hover');
            _m.toggleClass('show', shouldOpen);
            _d.toggleClass('show', shouldOpen);
            $('[data-toggle="dropdown"]', _d).attr('aria-expanded', shouldOpen);
        }, e.type === 'mouseleave' ? 0 : 0);
    }

    $('body')
        .on('mouseenter mouseleave', '.dropdown', toggleDropdown)
        .on('click', '.dropdown-menu a', toggleDropdown);

    /* not needed, prevents page reload for SO example on menu link clicked */
    //$('.dropdown a').on('click tap', e => e.preventDefault())
    //]]>
</script>