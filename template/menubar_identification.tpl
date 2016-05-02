<li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img
                src="https://profiles.csh.rit.edu/image/{$USERNAME}" class="profile-picture"> {$USERNAME} <span
                class="caret"></span></a>
    <ul class="dropdown-menu" role="menu">
        {strip}
            {if isset($U_LOGIN)}
                <div class="navbar-form-desktop">
                    <form class="navbar-form" method="post" action="{$U_LOGIN}" id="quickconnect">
                        <div class="form-group">
                            <input class="form-control" type="text" name="username" id="username" value=""
                                   placeholder="{'Username'|@translate}">
                            <input class="form-control" type="password" name="password" id="password"
                                   placeholder="{'Password'|@translate}">
                            {if $AUTHORIZE_REMEMBERING}
                                <label for="remember_me">
                                    <input type="checkbox" name="remember_me" id="remember_me"
                                           value="1"> {'Auto login'|@translate}
                                </label>
                                <br/>
                            {/if}
                            <input type="hidden" name="redirect" value="{$smarty.server.REQUEST_URI|@urlencode}">
                            <input class="btn btn-primary" type="submit" name="login" value="{'Login'|@translate}">
                        </div>
                    </form>
                    <li class="divider"></li>
                </div>
            {/if}
            {if isset($U_REGISTER)}
                <li><a href="{$U_REGISTER}" title="{'Create a new account'|@translate}"
                       rel="nofollow">{'Register'|@translate}</a></li>
            {/if}
            {if isset($U_LOGIN)}
                <li><a href="{$U_LOGIN}" rel="nofollow">{'Login'|@translate}</a></li>
            {/if}
            {if isset($U_LOGOUT)}
                <li><a href="{$U_LOGOUT}">{'Logout'|@translate}</a></li>
            {/if}
            {if isset($U_PROFILE)}
                <li><a href="{$U_PROFILE}"
                       title="{'customize the appareance of the gallery'|@translate}">{'Customize'|@translate}</a></li>
            {/if}
            {if isset($U_ADMIN)}
                <li><a href="{$U_ADMIN}"
                       title="{'available for administrators only'|@translate}">{'Administration'|@translate}</a></li>
            {/if}
        {/strip}
    </ul>
</li>