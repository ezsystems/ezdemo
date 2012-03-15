<div class="attribute-image">
    {attribute_view_gui href=$node.url_alias|ezurl() attribute=$node.data_map.image image_class=$image_class}
</div>

<div class="attribute-caption">
    {if $node.data_map.caption.has_content}
        {attribute_view_gui attribute=$node.data_map.caption}
    {else}
        <p>{$node.name|wash()}</p>
    {/if}
</div>
