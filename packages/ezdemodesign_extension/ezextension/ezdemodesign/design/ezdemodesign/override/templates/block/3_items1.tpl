{def $valid_nodes = $block.valid_nodes}

<div class="block-type-3items block-view-{$block.view}">

    {if ne( $block.name, '' )}
    <div class="attribute-header">
        <h2>{$block.name|wash()}</h2>
    </div>
    {/if}

    <div class="block-content">
    {foreach $valid_nodes as $valid_node}
        {node_view_gui view='block_item' image_class='blockitemimage' content_node=$valid_node}
    {/foreach}
    </div>

</div>

{undef $valid_nodes}
