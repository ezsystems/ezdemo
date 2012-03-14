{def $valid_node = $block.valid_nodes[0]}

<div class="block-type-mainstory">
    <div class="attribute-image">
        {attribute_view_gui href=$valid_node.url_alias|ezurl() attribute=$valid_node.data_map.image image_class='mainstory1'}
    </div>
    <div class="overlay">
    {if $valid_node.data_map.author.content.is_empty|not()}
        <div class="attribute-author">
            {attribute_view_gui attribute=$valid_node.data_map.author}
        </div>
    {/if}
        <div class="attribute-link">
            <h2><a href="{$valid_node.url_alias|ezurl(no)}">{$valid_node.name|wash()}</a></h2>
        </div>
    </div>
</div>

{undef $valid_node}
