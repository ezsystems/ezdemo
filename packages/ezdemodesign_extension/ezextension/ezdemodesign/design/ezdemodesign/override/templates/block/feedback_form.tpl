{def $node = $block.valid_nodes[0]}
<div class="block-type-feedback-form">
    <div class="attribute-header">
        <h2>{$block.name|wash()}</h2>
    </div>
    <article>
        <form method="post" action={"content/action"|ezurl} class="contact-form">
            <fieldset>
                <label>
                    <span class="hidden">$node.data_map.sender_name.contentclass_attribute.name</span>
                    {attribute_view_gui attribute=$node.data_map.sender_name placeholder=$node.data_map.sender_name.contentclass_attribute.name}
                </label>
                <label>
                    <span class="hidden">$node.data_map.email.contentclass_attribute.name</span>
                    {attribute_view_gui attribute=$node.data_map.email placeholder=$node.data_map.email.contentclass_attribute.name}
                </label>
                <label>
                    <span class="hidden">$node.data_map.subject.contentclass_attribute.name</span>
                    {attribute_view_gui attribute=$node.data_map.subject placeholder=$node.data_map.subject.contentclass_attribute.name}
                </label>
                <label>
                    <span class="hidden">$node.data_map.message.contentclass_attribute.name</span>
                    {attribute_view_gui attribute=$node.data_map.message placeholder=$node.data_map.message.contentclass_attribute.name}
                </label>
            </fieldset>
            <div class="content-action">
                <input type="submit" class="btn btn-warning pull-right" name="ActionCollectInformation" value="{"Send form"|i18n("design/ezdemodesign/block/feedback_form")}" />
                <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
                <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
                <input type="hidden" name="ViewMode" value="full" />
            </div>
        </form>
    </article>
</div>
{undef $node}
