<?php

function lang($langvar = '') {
    global $langs;

    if (isset($langs[$langvar])) {
        return $langs[$langvar];
    } else {
        return $langvar;
    }
}

function set_href($route = null, $func = null, $idslug = 0, $data = null)
{
    global $request_lang;
    $basepath = BASEPATH;
    $link = $basepath . '/' . $request_lang;
    if ($route) {
        $link .= '/' . $route;
        if ($func) {
            $link .= '/' . $func;
            if ($idslug) {
                $link .= '/' . $idslug;
                if ($data) {
                    $link .= '/' . $data;
                }
            }
        }
    }
    return $link;
}

function set_href_lang($lang_table = null)
{
    global $request_lang, $request_id;
    $basepath = BASEPATH;
    $link = $basepath . '/' . $request_lang;
    if ($lang_table) {
        $link .= "/$lang_table/lang";
    }
    return $link;
}

function is_menu_active($route)
{
    global $request_route;
    if ($route == $request_route) {
        return 'active';
    } else {
        return '';
    }
}

// eger sayfa($route) istenen sayfa($request_route) ile başlarsa menü seçilmiştir
function is_treemenu_active($route)
{
    global $request_route;
    if (strpos($request_route, $route) === 0) {
        return 'active';
    } else {
        return '';
    }
}

function jstree_html($datas, $start_id = 0, $selected = 0)
{
    $html = "";
    foreach ($datas as $id => $row) {

        if ($row['upper_id'] == $start_id) {
            $inner_html = jstree_html($datas, $id, $selected);
            $jstree_options = ['icon' => 'fa fa-circle-o', 'opened' => true];
            if ($id == $selected) $jstree_options['selected'] = true;
            $data_jstree = json_encode($jstree_options);
            if ($inner_html) {
                $inner_html = "<ul>{$inner_html}</ul>\r\n";
                $html .= "<li data-id='$id' data-jstree='{$data_jstree}'>{$row['name']}{$inner_html}</li>\r\n";
            } else {
                $html .= "<li data-id='$id' data-jstree='{$data_jstree}'>{$row['name']}</li>\r\n";
            }
        }
    }
    return $html;
}

function post_value($key) {
    if (isset($_POST[$key])) {
        return trim($_POST[$key]);
    } else {
        return false;
    }
}

function slugify($text)
{
  // replace non letter or digits by -
  $text = preg_replace('~[^\pL\d]+~u', '-', $text);

  // transliterate
  $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

  // remove unwanted characters
  $text = preg_replace('~[^-\w]+~', '', $text);

  // trim
  $text = trim($text, '-');

  // remove duplicate -
  $text = preg_replace('~-+~', '-', $text);

  // lowercase
  $text = strtolower($text);

  if (empty($text)) {
    return 'n-a';
  }

  return $text;
}