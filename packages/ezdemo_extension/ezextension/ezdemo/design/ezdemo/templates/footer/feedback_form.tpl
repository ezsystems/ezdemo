<h3>{'Get in touch'|i18n('design/ezdemo/footer/feedback_form')}</h3>
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
        <div class="actions">
            <button type="submit" class="btn btn-mini btn-warning pull-right" name="ActionCollectInformation">{'Send'|i18n('design/ezdemo/footer/feedback_form')}</button>
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
            <input type="hidden" name="ViewMode" value="full" />
        </div>
    </fieldset>
</form>
