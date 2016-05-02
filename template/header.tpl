<!DOCTYPE html>
<html lang="{$lang_info.code}" dir="{$lang_info.direction}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset={$CONTENT_ENCODING}">
    <meta name="generator" content="Piwigo (aka PWG), see piwigo.org">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    {if isset($meta_ref) }
        {if isset($INFO_AUTHOR)}
            <meta name="author" content="{$INFO_AUTHOR|@strip_tags:false|@replace:'"':' '}">
        {/if}
        {if isset($related_tags)}
            <meta name="keywords"
                  content="{foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}{$tag.name}{/foreach}">
        {/if}
        {if isset($COMMENT_IMG)}
            <meta name="description"
                  content="{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
        {else}
            <meta name="description" content="{$PAGE_TITLE}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
        {/if}
    {/if}

    <title>{if $PAGE_TITLE!=l10n('Home') && $PAGE_TITLE!=$GALLERY_TITLE}{$PAGE_TITLE} | {/if}{$GALLERY_TITLE}</title>
    <link rel="shortcut icon" type="image/x-icon" href="{$ROOT_URL}{$themeconf.icon_dir}/favicon.ico">
    <link rel="start" title="{'Home'|@translate}" href="{$U_HOME}">
    <link rel="search" title="{'Search'|@translate}" href="{$ROOT_URL}search.php">
    {if isset($first.U_IMG)   }
        <link rel="first" title="{'First'|@translate}" href="{$first.U_IMG}">
    {/if}
    {if isset($previous.U_IMG)}
        <link rel="prev" title="{'Previous'|@translate}" href="{$previous.U_IMG}">
    {/if}
    {if isset($next.U_IMG)}
        <link rel="next" title="{'Next'|@translate}" href="{$next.U_IMG}">
    {/if}
    {if isset($last.U_IMG)}
        <link rel="last" title="{'Last'|@translate}" href="{$last.U_IMG}">
    {/if}
    {if isset($U_UP)}
        <link rel="up" title="{'Thumbnails'|@translate}" href="{$U_UP}">
    {/if}

    {combine_css path="themes/csh/bootstrap/dist/css/bootstrap.min.css" order=-20}
    {foreach from=$themes item=theme}
        {if $theme.load_css}
            {combine_css path="themes/`$theme.id`/theme.css" order=-10}
        {/if}
        {if !empty($theme.local_head)}{include file=$theme.local_head load_css=$theme.load_css}{/if}
    {/foreach}

    {if $theme_config->bootstrap_theme == 'default'}
        {combine_css path="themes/csh/bootstrap/dist/css/bootstrap-theme.min.css" order=0}
    {/if}
    {if $theme_config->bootstrap_theme == 'csh'}
        {combine_css path="themes/csh/bootstrap-csh/release/members-flat.min.css" order=0}
    {/if}
    {if file_exists("local/csh/custom.css")}
        {combine_css path="local/csh/custom.css" order=10}
    {/if}
    {combine_css path="themes/csh/fixplugins.css" order=1000000}
    {get_combined_css}

    {if isset($U_PREFETCH)}
        <link rel="prefetch" href="{$U_PREFETCH}">
    {/if}
    {if not empty($page_refresh)}
        <meta http-equiv="refresh" content="{$page_refresh.TIME};url={$page_refresh.U_REFRESH}">
    {/if}

    {combine_script id='jquery'}
    {combine_script id='jquery-ajaxmanager' require='jquery' path='themes/default/js/plugins/jquery.ajaxmanager.js'}
    {combine_script id='thumbnails-loader' require='jquery-ajaxmanager' path='themes/default/js/thumbnails.loader.js'}
    {combine_script id='bootstrap' require='jquery' path="themes/csh/bootstrap/dist/js/bootstrap.min.js"}
    {combine_script id=$themeconf.name require='bootstrap' path="themes/csh/js/theme.js"}
    {get_combined_scripts load='header'}

    <!--[if lt IE 7]>
    <script type="text/javascript" src="{$ROOT_URL}themes/default/js/pngfix.js"></script>
    <![endif]-->

    {if not empty($head_elements)}
        {foreach from=$head_elements item=elt}{$elt}
        {/foreach}
    {/if}
</head>

<body id="{$BODY_ID}">
<div id="the_page">
    {if $BODY_ID != 'thePicturePage' or $theme_config->picture_page == 'normal'}
        <!-- Bootstrap navbar, moved to the header as variables are missing in menubar.tpl, actual menus remain in menubar.tpl -->
        <nav class="navbar navbar-inverse navbar-fixed-top navbar-main" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#menubar-navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="{$U_HOME}"><img src="{$ROOT_URL}themes/csh/img/csh_logo_white.svg"
                                                                  alt="{$GALLERY_TITLE}" class="logo">
                        <span>{$GALLERY_TITLE}</span></a>
                </div>
                <div class="collapse navbar-collapse navbar-right" id="menubar-navbar-collapse">
                    {$MENUBAR}
                </div>
            </div>
        </nav>
    {/if}

    {if !isset($slideshow) and ($BODY_ID != 'thePicturePage' or $theme_config->picture_page == 'normal') and $theme_config->jumbotron}
        <div class="jumbotron">
            <div class="container">
                <div id="theHeader">{$PAGE_BANNER}</div>
            </div>
        </div>
    {/if}

    {if not empty($header_msgs)}
        {foreach from=$header_msgs item=msg}
        {/foreach}
    {/if}

    {if not empty($header_notes)}
        {foreach from=$header_notes item=note}
        {/foreach}
    {/if}

    <nav class="navbar navbar-default subnav subnav-fixed" role="navigation">
        <div class="container">
            <div>
                <ul class="nav navbar-nav">
                    {if !empty($image_orders)}
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-sort"></span><span
                                        class="glyphicon-text">{'Sort order'|@translate}</span><span
                                        class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                {foreach from=$image_orders item=image_order name=loop}
                                    <li{if $image_order.SELECTED} class="active"{/if}><a href="{$image_order.URL}"
                                                                                         rel="nofollow">{$image_order.DISPLAY}</a>
                                    </li>
                                {/foreach}
                            </ul>
                        </li>
                    {/if}
                    {if !empty($image_derivatives)}
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-picture"></span><span
                                        class="glyphicon-text">{'Photo sizes'|@translate}</span><span
                                        class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                {foreach from=$image_derivatives item=image_derivative name=loop}
                                    <li{if $image_derivative.SELECTED} class="active"{/if}><a
                                                href="{$image_derivative.URL}"
                                                rel="nofollow">{$image_derivative.DISPLAY}</a>
                                    </li>
                                {/foreach}
                            </ul>
                        </li>
                    {/if}
                    {if isset($favorite)}
                        <li>
                            <a href="{$favorite.U_FAVORITE}"
                               title="{'Delete all photos from your favorites'|@translate}"
                               rel="nofollow">
                                <span class="glyphicon glyphicon-heart"></span><span
                                        class="glyphicon-text">{'Delete all photos from your favorites'|@translate}</span>
                            </a>
                        </li>
                    {/if}
                    {if isset($U_EDIT)}
                        <li>
                            <a href="{$U_EDIT}" title="{'Edit album'|@translate}">
                                <span class="glyphicon glyphicon-pencil"></span><span
                                        class="glyphicon-text">{'Edit'|@translate}</span>
                            </a>
                        </li>
                    {/if}
                    {if isset($U_CADDIE)}
                        <li>
                            <a href="{$U_CADDIE}" title="{'Add to caddie'|@translate}">
                                <span class="glyphicon glyphicon-plus-sign"></span><span
                                        class="glyphicon-text">{'Caddie'|@translate}</span>
                            </a>
                        </li>
                    {/if}
                    {if isset($U_SEARCH_RULES)}
                        {combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
                        <li>
                            <a href="{$U_SEARCH_RULES}" onclick="bd_popup(this.href); return false;"
                               title="{'Search rules'|@translate}" rel="nofollow">
                                <span class="glyphicon glyphicon-search"></span><span class="glyphicon-text">(?)</span>
                            </a>
                        </li>
                    {/if}
                    {if isset($U_SLIDESHOW)}
                        <li>
                            {strip}<a href="{$U_SLIDESHOW}" title="{'slideshow'|@translate}" rel="nofollow">
                                <span class="glyphicon glyphicon-play"></span><span
                                        class="glyphicon-text">{'slideshow'|@translate}</span>
                                </a>{/strip}
                        </li>
                    {/if}
                </ul>
            </div>
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                    {if isset($U_MODE_FLAT)}
                        <li>
                            {strip}<a href="{$U_MODE_FLAT}" title="{'display all photos in all sub-albums'|@translate}"
                                      rel="nofollow">
                                <span class="glyphicon glyphicon-th-large"></span><span
                                        class="glyphicon-text">{'display all photos in all sub-albums'|@translate}</span>
                                </a>{/strip}
                        </li>
                    {/if}
                    {if isset($U_MODE_NORMAL)}
                        <li>
                            {strip}<a href="{$U_MODE_NORMAL}" title="{'return to normal view mode'|@translate}">
                                <span class="glyphicon glyphicon-home"></span><span
                                        class="glyphicon-text">{'return to normal view mode'|@translate}</span>
                                </a>{/strip}
                        </li>
                    {/if}
                    {if !empty($PLUGIN_INDEX_BUTTONS)}{foreach from=$PLUGIN_INDEX_BUTTONS item=button}
                        <li>{$button}</li>{/foreach}{/if}
                    {if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
                    {if (!empty($CATEGORIES) && !isset($GDThumb)) || (!empty($THUMBNAILS) && !isset($GThumb) && !isset($GDThumb)) }
                        <li id="btn-grid"{if $smarty.cookies.view != 'list'} class="active"{/if}><a href="#"><span
                                        class="glyphicon glyphicon-th"></span></a></li>
                        <li id="btn-list"{if $smarty.cookies.view == 'list'} class="active"{/if}><a href="#"><span
                                        class="glyphicon glyphicon-th-list"></span></a></li>
                    {/if}
                </ul>
            </div>
        </div>
    </nav>

    <!-- End of header.tpl -->