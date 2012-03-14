{def $valid_nodes = $block.valid_nodes}
<div class="block-type-2items">
    <div class="row">
        {foreach $valid_nodes as $valid_node}
        <div class="span4">
            {node_view_gui view='block_item' image_class='blockitemimage' content_node=$valid_node}
        </div>
        {/foreach}
    </div>
</div>
{undef $valid_nodes}
