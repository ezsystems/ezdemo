{* Gallery - Full view *}

<div class="content-view-full">
    <div class="class-gallery">

        <div class="attribute-header">
            <h1>{$node.name|wash()}</h1>
        </div>

        {def $children_count = fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id,
                                                                     'class_filter_type', 'include',
                                                                     'class_filter_array', array( 'image' ) ) )
             $children = array()
             $first = false()
             $image = false()
             $big_image_class = 'galleryfull'}

        {if $children_count}
        <div class="full-gallery">
            {set $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                             'class_filter_type', 'include',
                                                             'class_filter_array', array( 'image' ),
                                                             'sort_by', $node.sort_array ) )
                 $first = $children.0
                 $image = $first.data_map.image.content[$big_image_class]}
            <div class="gallery-viewer" id="gallery{$node.node_id}">
                <h2>
                    <span class="counter"><span>1</span>/{$children_count}</span>
                    <a href={$first.url_alias|ezurl}>{$first.name|wash()}</a>
                </h2>
                <figure>
                    <img src={$image.url|ezroot} alt="{$first.name|wash()}" height="{$image.height}" width="{$image.width}" />
                    <figcaption>
                        {if $first.data_map.caption.has_content}
                            {attribute_view_gui attribute=$first.data_map.caption}
                        {/if}
                    </figcaption>
                </figure>
            </div>
            <div class="gallery-navigator">
                <a href="#" class="navig prev" style="opacity:0;"><span class="hide">&lt;</span></a>
                <a href="#" class="navig next"><span class="hide">&gt;</span></a>

                <img src={'fg-selected.png'|ezimage} alt="Selected indicator" class="cursor" />
                <ul class="images">
                {foreach $children as $k => $img}
                    <li>{node_view_gui view='gallery_item' thumb_class='gallerythumbnail' big_class=$big_image_class content_node=$img}</li>
                {/foreach}
                </ul>
            </div>

        </div>
        <script type="text/javascript">
        {literal}

        YUI(YUI3_config).use('ezgallery', 'event', function (Y) {
            Y.on('domready', function () {
                var g = new Y.eZ.Gallery({
                    autoFixSizes: false,
                    navigator: {
                        gallery: '.full-gallery'
                    },
                    initFunc: function () {
                        var imgs = this.navigator.getImages();

                        // make the browser caches images
                        setTimeout(function () {
                            imgs.each(function(elem) {
                                (new Image).src = elem.getAttribute('data-gallery-src');
                            });
                        }, 0);
                    },
                    updateFunc: function (item) {
                        var node = item.imageNode,
                            t = this.container.one(this.conf.title),
                            img = this.container.one(this.conf.image),
                            cap = this.container.one(this.conf.caption);
                            c = this.container.one(this.conf.counter);

                        t.setContent(node.get('title'));
                        t.setAttribute('href', node.getAttribute('data-gallery-node-url'));
                        c.setContent(item.index + 1);
                        img.setAttribute('src', node.getAttribute('data-gallery-src'));
                        img.setAttribute('alt', node.get('title'));
                        img.setAttribute('height', node.getAttribute('data-gallery-height'));
                        img.setAttribute('width', node.getAttribute('data-gallery-width'));
                        cap.setContent(node.one('figcaption').getContent());
                    }
                });
            });
        });
        
        {/literal}
        </script>
        {/if}
        {undef $children_count $children $first $big_image_class $image}
    </div>
</div>
