{* Geo Article - Full view *}

<div class="content-view-full">
    <div class="class-geo-article">

        <div class="attribute-header">
            <h1>{$node.data_map.title.content|wash()}</h1>
        </div>

        <div class="attribute-byline">
        {if $node.data_map.author.content.is_empty|not()}
            <p class="author">
                {attribute_view_gui attribute=$node.data_map.author}
            </p>
        {/if}
            <p class="date">
            {$node.object.published|l10n(shortdatetime)}
            </p>
        </div>

    {if eq( ezini( 'article', 'ImageInFullView', 'content.ini' ), 'enabled' )}
        {if $node.data_map.image.has_content}
            <div class="attribute-image">
                {attribute_view_gui attribute=$node.data_map.image image_class=medium}

                {if $node.data_map.caption.has_content}
                    <div class="caption">
                        {attribute_view_gui attribute=$node.data_map.caption}
                    </div>
                {/if}
            </div>
        {/if}
    {/if}

    {if eq( ezini( 'article', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
        {if $node.data_map.intro.content.is_empty|not}
            <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.intro}
            </div>
        {/if}
    {/if}

    {if $node.data_map.body.content.is_empty|not}
        <div class="attribute-long">
            {attribute_view_gui attribute=$node.data_map.body}
        </div>
    {/if}

        <div class="attribute-location">
        {attribute_view_gui attribute=$node.data_map.location}
        </div>

        <div class="attribute-star-rating">
        {attribute_view_gui attribute=$node.data_map.star_rating}
        </div>

    {if $node.data_map.tags.content.related_objects}
        <div class="attribute-relatedcontent">
            <h1>{"Related content"|i18n("design/ezdemo/full/article")}</h1>
            <ul>
                {foreach $node.data_map.tags.content.related_objects|reverse() as $related_object max 7}
                    <li><a href="{$related_object.url_alias|ezurl( 'no' )}" title="{$related_object.name|wash()}">{$related_object.name|wash()}</a></li>
                {/foreach}
            </ul>
        </div>
    {/if}

    {if is_unset( $versionview_mode )}
        {if $node.data_map.enable_comments.data_int}
            <h1>{"Comments"|i18n("design/ezdemo/full/article")}</h1>
            <div class="content-view-children">
                {foreach fetch_alias( comments, hash( parent_node_id, $node.node_id ) ) as $comment}
                        {node_view_gui view='line' content_node=$comment}
                    {/foreach}
            </div>

            {if fetch( 'content', 'access', hash( 'access', 'create',
            'contentobject', $node,
            'contentclass_id', 'comment' ) )}
                <form method="post" action={"content/action"|ezurl}>
                    <input type="hidden" name="ClassIdentifier" value="comment" />
                    <input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}" />
                    <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
                    <input class="button new_comment" type="submit" name="NewButton" value="{'New comment'|i18n( 'design/ezdemo/full/article' )}" />
                </form>
                {else}
                {if ezmodule( 'user/register' )}
                    <p>{'%login_link_startLog in%login_link_end or %create_link_startcreate a user account%create_link_end to comment.'|i18n( 'design/ezdemo/full/article', , hash( '%login_link_start', concat( '<a href="', '/login'|ezurl(no), '">' ), '%login_link_end', '</a>', '%create_link_start', concat( '<a href="', "/user/register"|ezurl(no), '">' ), '%create_link_end', '</a>' ) )}</p>
                    {else}
                    <p>{'%login_link_startLog in%login_link_end to comment.'|i18n( 'design/ezdemo/article/comments', , hash( '%login_link_start', concat( '<a href="', '/login'|ezurl(no), '">' ), '%login_link_end', '</a>' ) )}</p>
                {/if}
            {/if}
        {/if}
    {/if}

    {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'tipafriend' ) )}
    {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
        <div class="attribute-tipafriend">
            <p><a href={concat( "/content/tipafriend/", $node.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ezdemo/full/article' )}">{'Tip a friend'|i18n( 'design/ezdemo/full/article' )}</a></p>
        </div>
    {/if}

    </div>
</div>
