{* Article - Line view *}

<div class="content-view-line">
    <article class="class-article">

    {section show=$node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class=articlethumbnail href=$node.url_alias|ezurl attribute=$node.data_map.image}
        </div>
    {/section}

    <div class="attribute-header">
        <h2>
            <a href="{$node.url_alias|ezurl( 'no' )}" class="teaser-link">{$node.data_map.title.content|wash()}</a>
        </h2>
    </div>

    <div class="attribute-byline with-comments">
        <span class="date">
            {$node.object.published|l10n(shortdatetime)}
        </span>
    {if $node.data_map.author.content.is_empty|not()}
        <span class="author">
            {attribute_view_gui attribute=$node.data_map.author}
        </span>
    {/if}
        <a href="{$node.url_alias|ezurl( 'no' )}" class="comments">
            {fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id,
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', array( 'comment' ) ) )}
        </a>
    </div>

    {section show=$node.data_map.intro.content.is_empty|not}
    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.intro}
    </div>
    {/section}

    </article>
</div>
