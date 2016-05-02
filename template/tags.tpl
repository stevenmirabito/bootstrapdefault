<nav class="navbar navbar-default subnav subnav-fixed" role="navigation">
    <div class="container">
        <div class="navbar-right">
            <ul class="nav navbar-nav">
                {if $display_mode == 'letters'}
                    <li>
                        <a href="{$U_CLOUD}" title="{'show tag cloud'|@translate}">
                            <span class="glyphicon glyphicon-cloud"></span><span
                                    class="glyphicon-text">{'Cloud'|@translate}</span>
                        </a>
                    </li>
                {/if}
                {if $display_mode == 'cloud'}
                    <li>
                        <a href="{$U_LETTERS}" title="{'group by letters'|@translate}" rel="nofollow">
                            <span class="glyphicon glyphicon-sort-by-alphabet"></span><span
                                    class="glyphicon-text">{'Letters'|@translate}</span>
                        </a>
                    </li>
                {/if}
            </ul>
        </div>
    </div>
</nav>

{include file='infos_errors.tpl'}

{if $display_mode == 'cloud' and isset($tags)}
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="{$U_HOME}">{'Home'|@translate}</a></li>
            <li>{'Tags'|@translate}</li>
        </ol>

        {if $theme_config->tag_cloud_type == 'basic'}
            <div id="tagCloud">
                {foreach from=$tags item=tag}
                    <span><a href="{$tag.URL}" class="tagLevel{$tag.level}"
                             title="{$tag.counter|@translate_dec:'%d photo':'%d photos'}">{$tag.name}</a></span>
                {/foreach}
            </div>
        {else}
            {combine_script id='jquery.awesomeCloud' load='footer' path="themes/csh/js/jquery.awesomeCloud.js"}
            {footer_script require='jquery.awesomeCloud'}{strip}
                $(document).ready(function(){
                $("#tagCloudCanvas").awesomeCloud({
                "size" : {
                "grid": 12,
                "factor": 0,
                "normalize": false
                },
                "options": {
                "color": "gradient",
                "rotationRatio": 0.2,
                },
                "color": {
                "start": $('#tagCloudGradientStart').css('color'),
                "end": $('#tagCloudGradientEnd').css('color')
                },
                "font": "'Helvetica Neue',Helvetica,Arial,sans-serif",
                "shape": "circle"
                });
                });
            {/strip}{/footer_script}
            <div id="tagCloudCanvas">
                {foreach from=$tags item=tag}
                    <span data-weight="{$tag.counter}"><a href="{$tag.URL}">{$tag.name}</a></span>
                {/foreach}
            </div>
            <div id="tagCloudGradientStart"></div>
            <div id="tagCloudGradientEnd"></div>
        {/if}
    </div>
{/if}

{if $display_mode == 'letters' and isset($letters)}
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="{$U_HOME}">{'Home'|@translate}</a></li>
            <li>{'Tags'|@translate}</li>
        </ol>

        <div id="tagLetters">
            <div class="menu row">
                {foreach from=$letters item=letter}
                    <div class="menu-category">
                        <div class="menu-category-name list-group-item active">{$letter.TITLE}</div>
                        {foreach from=$letter.tags item=tag}
                            <a href="{$tag.URL}" class="menu-item list-group-item" title="{$tag.name}">{$tag.name}<span
                                        class="badge">{$tag.counter|@translate_dec:'%d photo':'%d photos'}</span></a>
                        {/foreach}
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
{/if}

</div> <!-- content -->
