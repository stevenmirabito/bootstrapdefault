<nav class="navbar navbar-default subnav subnav-fixed" role="navigation"></nav>

{include file='infos_errors.tpl'}

<div class="container">
    <ol class="breadcrumb">
        <li><a href="{$U_HOME}">{'Home'|@translate}</a></li>
        <li>{'About'|@translate}</li>
    </ol>

    <div class="panel panel-primary">
        <div class="panel-heading">
            {'About'|@translate}
        </div>
        <div class="panel-body">
            {$ABOUT_MESSAGE}
            {if isset($THEME_ABOUT) }
                <ul>
                    <li>{$THEME_ABOUT}</li>
                </ul>
            {/if}
            {if not empty($about_msgs)}
                {foreach from=$about_msgs item=elt}
                    {$elt}
                {/foreach}
            {/if}
        </div>
    </div>
</div>
