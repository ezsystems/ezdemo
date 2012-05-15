<h3>{'Get in touch'|i18n('design/ezdemo/footer/feedback_form')}</h3>
<form method="post" action={"content/action"|ezurl} class="contact-form">
    <fieldset>
        <label>
            <span class="hidden">$object.data_map.sender_name.contentclass_attribute.name</span>
            {attribute_view_gui attribute=$object.data_map.sender_name placeholder=$object.data_map.sender_name.contentclass_attribute.name}
        </label>
        <label>
            <span class="hidden">$object.data_map.email.contentclass_attribute.name</span>
            {attribute_view_gui attribute=$object.data_map.email placeholder=$object.data_map.email.contentclass_attribute.name}
        </label>
        <label>
            <span class="hidden">$object.data_map.subject.contentclass_attribute.name</span>
            {attribute_view_gui attribute=$object.data_map.subject placeholder=$object.data_map.subject.contentclass_attribute.name}
        </label>
        <label>
            <span class="hidden">$object.data_map.message.contentclass_attribute.name</span>
            {attribute_view_gui attribute=$object.data_map.message placeholder=$object.data_map.message.contentclass_attribute.name}
        </label>
        <div class="actions">
            <button type="submit" class="btn btn-mini btn-warning pull-right" name="ActionCollectInformation">{'Send'|i18n('design/ezdemo/footer/feedback_form')}</button>
            <input type="hidden" name="ContentNodeID" value="{$object.main_node.node_id}" />
            <input type="hidden" name="ContentObjectID" value="{$object.id}" />
            <input type="hidden" name="ViewMode" value="full" />
        </div>
    </fieldset>
</form>
