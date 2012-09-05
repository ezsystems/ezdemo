{if is_unset( $load_css_file_list )}
    {def $load_css_file_list = true()}
{/if}

{if $load_css_file_list}
  {ezcss_load( array( 'bootstrap.css',
                      'responsive.css',
                      'debug.css',
                      'websitetoolbar.css',
                      ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ),
                      ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' ) ) )}
{else}
  {ezcss_load( array( 'bootstrap.css',
                      'responsive.css',
                      'debug.css',
                      'websitetoolbar.css' ) )}
{/if}

{if ne(ezini('StylesheetSettings','ClassesCSS','design.ini'), '')}
<link rel="stylesheet" type="text/css" href={ezini('StylesheetSettings','ClassesCSS','design.ini')|ezroot()} />
{/if}
{if ne(ezini('StylesheetSettings','SiteCSS','design.ini'), '')}
<link rel="stylesheet" type="text/css" href={ezini('StylesheetSettings','SiteCSS','design.ini')|ezroot()} />
{/if}
<link rel="stylesheet" type="text/css" href={"stylesheets/print.css"|ezdesign} media="print" />
