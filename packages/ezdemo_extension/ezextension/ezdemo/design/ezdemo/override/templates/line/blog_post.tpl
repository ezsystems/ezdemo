{* Blog post - Line view *}

<div class="content-view-line">
    <article class="class-blog-post">

    <div class="attribute-header">
        <h2><a href={$node.url_alias|ezurl} title="{$node.data_map.title.content|wash}">{$node.data_map.title.content|wash}</a></h2>
     </div>

    <div class="attribute-byline with-comments">
        <span class="date">{$node.data_map.publication_date.content.timestamp|l10n(shortdatetime)}</span>
        <span class="author">{$node.object.owner.name}</span>
        <span class="tags"> {"Tags:"|i18n("design/ezdemo/line/blog_post")} {foreach $node.data_map.tags.content.keywords as $keyword}
                                           <a href={concat( $node.parent.url_alias, "/(tag)/", $keyword|rawurlencode )|ezurl} title="{$keyword}">{$keyword}</a>
                                           {delimiter}
                                               ,
                                           {/delimiter}
                                     {/foreach}
        </span>
        <a href="{$node.url_alias|ezurl( 'no' )}" class="comments">
            {fetch( 'comment', 'comment_count', hash( 'contentobject_id', $node.contentobject_id,
                                                      'language_id', $node.data_map.comments.language_id,
                                                      'status', '1' ) )}
        </a>
    </div>

        <div class="attribute-body">
            {attribute_view_gui attribute=$node.data_map.body}
        </div>

    </article>
</div>
