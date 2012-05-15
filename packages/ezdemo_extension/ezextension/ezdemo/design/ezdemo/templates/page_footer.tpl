<!-- Footer area: START -->
{def $feedback_form_class = fetch( 'content', 'class', hash( 'class_id', 'feedback_form' ) )
     $feedback_form = $feedback_form_class.object_list[0]}
<footer>
    <div class="claim-wrapper">
        <div class="container">
            <div class="nav-collapse">
                Powered by <a href="http://ez.no/ezpublish" title="eZ Publish&#8482; CMS Open Source Web Content Management">eZ Publish&#8482; CMS Open Source Web Content Management</a>.
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="span4">
                {include uri='design:footer/address.tpl' node=$feedback_form}
            </div>
            <div class="span4 nav-collapse">
                {include uri='design:footer/latest_news.tpl'}
            </div>
            <div class="span4 nav-collapse">
                {include uri='design:footer/feedback_form.tpl' object=$feedback_form}
            </div>
        </div>
    </div>
</footer>
<!-- Footer area: END -->
{undef $feedback_form_class $feedback_form}
