{* Adding comment START *}
{def $user=fetch( 'user', 'current_user' )}
{def $anonymous_user_id=ezini('UserSettings', 'AnonymousUserID' )}
{def $is_anonymous=$user.contentobject_id|eq( $anonymous_user_id )}
{def $comment_notified=ezini( 'GlobalSettings', 'EnableNotification', 'ezcomments.ini' )}
{def $fields = ezini( 'FormSettings', 'AvailableFields', 'ezcomments.ini' )}
{def $fieldRequiredText = '<span class="ezcom-field-mandatory">*</span>'}

<form method="post" action={'/comment/add'|ezurl} name="CommentAdd">
<input type="hidden" name="ContentObjectID" value="{$contentobject_id}" />
<input type="hidden" name="CommentLanguageCode" value="{$language_code}" />
<input type="hidden" name="RedirectURI" value={$redirect_uri|ezurl} />

<div class="ezcom-add">
        <div class="ezcom-function-title">
            <h3>
             {'Post a comment'|i18n( 'ezcomments/comment/add/form' )}
            </h3>
        </div>

        {if $fields|contains( 'title' )}
        {def $titleRequired = ezini( 'title', 'Required', 'ezcomments.ini' )|eq( 'true' )}
        <div class="row">
            <div class="ezcom-field ezcom-field-title span8">
                <label>
                    {'Title:'|i18n( 'ezcomments/comment/add/form' )}{if $titleRequired}{$fieldRequiredText}{/if}
                </label>
                <input type="text" class="box span8" maxlength="100" name="CommentTitle" />
            </div>
        </div>
        {undef $titleRequired}
        {/if}

        <div class="row">
        {if $fields|contains( 'name' )}
        {def $nameRequired = ezini( 'name', 'Required', 'ezcomments.ini' )|eq( 'true' )}
            <div class="ezcom-field ezcom-field-name span4">
                <div class="ezcom-filed-error"></div>
                <label>
                    {'Name:'|i18n( 'ezcomments/comment/add/form' )}{if $nameRequired}{$fieldRequiredText}{/if}
                </label>
                <input type="text" class="box span4" maxlength="50" id="CommentName" name="CommentName" />
            </div>
        {undef $nameRequired}
        {/if}

        {if $fields|contains( 'website' )}
        {def $websiteRequired = ezini( 'website', 'Required', 'ezcomments.ini' )|eq( 'true' )}
            <div class="ezcom-field ezcom-field-website span4">
                <label>
                    {'Website:'|i18n( 'ezcomments/comment/add/form' )}{if $websiteRequired}{$fieldRequiredText}{/if}
                </label>
                <input type="text" class="box span4" maxlength="100" id="CommentWebsite" name="CommentWebsite" />
            </div>
        {undef $websiteRequired}
        {/if}
        </div>

        {if $fields|contains( 'email' )}
        {def $emailRequired = ezini( 'email', 'Required', 'ezcomments.ini' )|eq( 'true' )}
        <div class="row">
            <div class="ezcom-field ezcom-field-email span8">
                <label>
                    {'Email:'|i18n( 'ezcomments/comment/add/form' )}{if $emailRequired}{$fieldRequiredText}{/if}&nbsp;<span class="ezcom-field-emailmessage">{'(The email address will not be shown)'|i18n( 'ezcomments/comment/add/form' )}</span>
                </label>
                {if $is_anonymous|not}
                    <input type="text" maxlength="100" class="box span8" id="CommentEmail" disabled="disabled" />
                    <input type="hidden" name="CommentEmail" />
                {else}
                    <input type="text" maxlength="100" class="box span8" id="CommentEmail" name="CommentEmail" />
                {/if} 
            </div>
        </div>
        {undef $emailRequired}
        {/if}

        <div class="row">
            <div class="ezcom-field ezcom-field-content span8">
                <label>
                    {'Content:'|i18n( 'ezcomments/comment/add/form' )}{$fieldRequiredText}
                </label>
                <textarea class="box span8" name="CommentContent" rows="6" cols=""></textarea>
            </div>
        </div>
        <div class="row">
            <div class="span4">
        {if $fields|contains( 'notificationField' )}
            {* When email is enabled or email is enabled but user logged in *}
            {if or( $fields|contains( 'email' ), and( $fields|contains( 'email' )|not, $is_anonymous|not ) )}
                <div class="ezcom-field ezcom-field-notified">
                    <label class="checkbox">
                        <input type="checkbox" name="CommentNotified" {if $comment_notified|eq('true')}checked="checked"{/if} value="1" />
                        {'Notify me of new comments'|i18n( 'ezcomments/comment/add/form' )}
                    </label>
                </div>
            {/if}
        {/if}
        {if $fields|contains( 'recaptcha' )}
            {*Fetch captcha limitation*}
             {def $bypass_captcha = fetch( 'comment', 'has_access_to_security', hash( 'limitation', 'AntiSpam',
                                                                                        'option_value', 'bypass_captcha' ) )}
             {if $bypass_captcha|not}
                <div class="ezcom-field">
                  <fieldset>
                  <legend>{'Security text:'|i18n( 'ezcomments/comment/add/form' )}{$fieldRequiredText}</legend>
                  {if ezini( 'RecaptchaSetting', 'PublicKey', 'ezcomments.ini' )|eq('')}
                        <div class="message-warning">
                            {'reCAPTCHA API key missing.'|i18n( 'ezcomments/comment/add' )}
                        </div>
                  {else}
                      <script type="text/javascript">
                                {def $theme = ezini( 'RecaptchaSetting', 'Theme', 'ezcomments.ini' )}
                                {def $language = ezini( 'RecaptchaSetting', 'Language', 'ezcomments.ini' )}
                                {def $tabIndex = ezini( 'RecaptchaSetting', 'TabIndex', 'ezcomments.ini' )}
                                var RecaptchaOptions = {literal}{{/literal} theme : '{$theme}',
                                                         lang : '{$language}',
                                                         tabindex : {$tabIndex} {literal}}{/literal};
                      </script>
                      {if $theme|eq('custom')}
                          {*Customized theme start*}
                          <p>
                               {'Enter both words below, with or without a space.'|i18n( 'ezcomments/comment/add/form' )}<br />
                               {'The letters are not case-sensitive.'|i18n( 'ezcomments/comment/add/form' )}<br />
                               {'Can\'t read this?'|i18n( 'ezcomments/comment/add/form' )}
                               <a href="javascript:;" onclick="Recaptcha.reload();">
                                {'Try another'|i18n( 'ezcomments/comment/add/form' )}
                               </a>
                          </p>
                          <div id="recaptcha_image"></div>
                          <p>
                               <input type="text" class="box" id="recaptcha_response_field" name="recaptcha_response_field" />
                          </p>
                          {*Customized theme end*}
                       {/if}
                       {fetch( 'comment', 'recaptcha_html' )}
                  {/if}
                 </fieldset>
                </div>
             {/if}
             {undef $bypass_captcha}
        {/if}
            </div>
            <div class="span4">
        {if $is_anonymous}
            <div class="ezcom-field ezcom-field-remember">
                <label class="checkbox">
                    <input type="checkbox" name="CommentRememberme" checked="checked" value="1" />
                    {'Remember me'|i18n( 'ezcomments/comment/add/form' )}
                </label>
            </div>
        {/if}
            </div>
        </div>
        <div class="row">
            <div class="ezcom-field actions span8">
                <input type="submit" value="{'Add comment'|i18n( 'ezcomments/comment/add/form' )}" class="btn btn-warning pull-right" name="AddCommentButton" />
                <input type="reset" class="btn btn-danger" value="{'Reset form'|i18n( 'ezcomments/comment/add/form' )}" />
            </div>
        </div>
</div>
</form>

{ezscript_require( array( 'ezjsc::yui3', 'ezjsc::yui3io', 'ezcomments.js' ) )}

<script type="text/javascript">
eZComments.cfg = {ldelim}
                    postbutton: '#ezcom-post-button',
                    postform: '#ezcom-comment-form',
                    postlist: '#ezcom-comment-list',
                    postcontainer: '#ezcom-comment-list',
                    sessionprefix: '{ezini('Session', 'SessionNamePrefix', 'site.ini')}',
                    sortorder: '{ezini('GlobalSettings', 'DefaultEmbededSortOrder', 'ezcomments.ini')}',
                    fields: {ldelim} 
                                name: '#CommentName',
                                website: '#CommentWebsite',
                                email: '#CommentEmail' 
                            {rdelim}
                 {rdelim};
eZComments.init();
</script>

{undef $comment_notified $fields}
{undef $user $anonymous_user_id $is_anonymous}
{* Adding comment END *}
