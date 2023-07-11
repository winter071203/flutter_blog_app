;/*FB_PKG_DELIM*/

__d("useCounter",["react"],(function(a,b,c,d,e,f,g){"use strict";b=d("react");var h=b.useMemo,i=b.useState;function a(a){a===void 0&&(a=0);a=i(a);var b=a[0],c=a[1];a=h(function(){return{changeBy:function(a){return c(function(b){return b+a})},decrement:function(){return c(function(a){return a-1})},increment:function(){return c(function(a){return a+1})},set:c}},[c]);return[b,a]}g["default"]=a}),98);
__d("usePolarisGetQueryRefetcher",["react","useCounter","usePolarisQueryStore"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react").useCallback;function a(a){var b=c("useCounter")();b[0];var d=b[1].increment,e=c("usePolarisQueryStore")();return h(function(b){e.refetchGetQuery(a,b),d()},[d,a,e])}g["default"]=a}),98);
__d("PolarisExploreMobileHeader.react",["IGDSBox.react","PolarisGenericMobileHeader.react","PolarisSearchBoxContainer.react","react"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react");function a(a){var b=a.analyticsContext;a=a.isSearchOpen;return h.jsx(c("PolarisGenericMobileHeader.react"),{className:"xnz67gz",title:h.jsx(c("IGDSBox.react"),{alignItems:"center",direction:"row",position:"relative",children:h.jsx(c("IGDSBox.react"),{flex:"grow",position:"relative",children:h.jsx(c("PolarisSearchBoxContainer.react"),{analyticsContext:b,isActive:a,useHistory:!0})})})})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisDynamicExploreLoadingSpinner.react",["cx","IGDSSpinner.react","react"],(function(a,b,c,d,e,f,g,h){"use strict";var i=d("react");function a(){return i.jsx("div",{className:"_ac-w",children:i.jsx(c("IGDSSpinner.react"),{position:"absolute",size:"medium"})})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisDynamicExploreGridItemOverlay.react",["PolarisDynamicExploreMediaHelpers","PolarisPostsGridItemStatsOverlay.react","PolarisReactRedux","PolarisShouldHideLikeCountsWithControls","nullthrows","polarisDynamicExploreSelectors","polarisUserSelectors","react"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react");function a(a){var b=a.exploreGridQuery,e=a.exploreGridType,f=a.postId;a=d("PolarisReactRedux").useSelector(function(a){return d("polarisUserSelectors").getViewer(a)});var g=c("nullthrows")(d("PolarisReactRedux").useSelector(function(a){return d("polarisDynamicExploreSelectors").getGridItemFromPostId(a,f,e,b)}));return h.jsx(c("PolarisPostsGridItemStatsOverlay.react"),{commentsDisabled:g.comments_disabled,hideLikes:d("PolarisShouldHideLikeCountsWithControls").shouldHideLikeCountsWithControls(a==null?void 0:a.hideLikeAndViewCounts,g.like_and_view_counts_disabled),isVideo:d("PolarisDynamicExploreMediaHelpers").getIsVideo(g),numComments:g.comment_count,numPreviewLikes:g.like_count,videoViews:g.view_count})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisDynamicExploreGridItem.react",["cx","IGDSBox.react","PolarisDynamicExploreGridItemOverlay.react","PolarisDynamicExploreMediaHelpers","PolarisErrorBoundary.react","PolarisFastLink.react","PolarisGridItemVideoPreview.react","PolarisMediaConstants","PolarisMediaTypes","PolarisPhoto.react","PolarisPostsGridQEHelpers","PolarisReactRedux","PolarisSizing","PolarisUA","PolarisViewpointReact.react","getPolarisVideoSourceByVersions","nullthrows","polarisDynamicExploreSelectors","qex","react","stylex"],(function(a,b,c,d,e,f,g,h){"use strict";var i=d("react");b=d("react");var j=b.useCallback,k=b.useEffect,l=b.useState,m={videoPreview:{height:"x5yr21d",position:"x10l6tqk",start:"x17qophe",top:"x13vifvy",width:"xh8yej3",$$css:!0},videoPreviewWrapper:{paddingBottom:"xs9ks74",$$css:!0},videoPreviewWrapper28px:{"@media (min-width: 736px)_paddingBottom":"x1azhor3",$$css:!0},videoPreviewWrapper4px:{"@media (min-width: 736px)_paddingBottom":"xw0xz5u",$$css:!0}};function a(a){var b=a.constructedLink,e=a.exploreGridQuery,f=a.exploreGridType,g=a.id,h=a.onClick,n=a.onMediaRendered,o=a.size;a=a.viewpointActions;var p=l(!1),q=p[0],r=p[1];p=l(!1);var s=p[0],t=p[1];p=l(!1);var u=p[0],v=p[1];p=c("nullthrows")(d("PolarisReactRedux").useSelector(function(a){return d("polarisDynamicExploreSelectors").getGridItemFromPostId(a,g,f,e)}));var w=d("PolarisDynamicExploreMediaHelpers").getSrcSet(p),x=p.media_type===d("PolarisMediaConstants").MediaTypes.VIDEO,y=c("getPolarisVideoSourceByVersions")(p.video_versions,[d("PolarisMediaTypes").MediaVersionType.VIDEO_480_HIGH,d("PolarisMediaTypes").MediaVersionType.VIDEO_480_LOW]),z=function(a,b){n&&n(g,b)},A=d("PolarisReactRedux").useSelector(function(a){return a.displayProperties.viewportWidth});A=A>d("PolarisSizing").MEDIUM_SCREEN_MIN;q=d("PolarisUA").isDesktop()&&(q&&!u||s);var B=d("PolarisViewpointReact.react").useViewpoint({action:a,id:g}),C=j(function(){v(!1)},[]);u=d("PolarisDynamicExploreMediaHelpers").getPostIcon(p);s=d("PolarisPostsGridQEHelpers").getMarginForPostsGridItems();k(function(){var a=B.current;if(!a)return function(){};a.addEventListener("keyup",C);return function(){a.removeEventListener("keyup",C)}},[C,B]);return i.jsx(c("IGDSBox.react"),{containerRef:B,"data-testid":void 0,display:"block",position:"relative",width:"100%",children:i.jsxs(c("PolarisFastLink.react"),{className:"_acg7",href:b,onBlur:function(){return r(!1)},onClick:function(a){a.detail===1&&v(!0),h&&h(a)},onFocus:function(){return r(!0)},onMouseEnter:function(){return t(!0)},onMouseLeave:function(){return t(!1)},shouldOpenModal:d("PolarisUA").isDesktop(),children:[x&&o===d("PolarisDynamicExploreMediaHelpers").GRID_ITEM_SIZE.ONE_BY_TWO&&y!=null&&c("qex")._("35")===!0?i.jsx("div",{className:c("stylex")([m.videoPreviewWrapper,s===28&&m.videoPreviewWrapper28px,s===4&&m.videoPreviewWrapper4px]),children:i.jsx("div",{className:"x5yr21d x10l6tqk x17qophe x13vifvy xh8yej3",children:i.jsx(c("PolarisGridItemVideoPreview.react"),{coverPhoto:p==null?void 0:(a=p.image_versions2)==null?void 0:(b=a.additional_candidates)==null?void 0:(x=b.first_frame)==null?void 0:x.url,videoID:g,videoSrc:y})})}):i.jsx(c("PolarisPhoto.react"),{accessibilityCaption:d("PolarisDynamicExploreMediaHelpers").getAccessibilityCaption(p),caption:d("PolarisDynamicExploreMediaHelpers").getPostCaption(p),onPhotoRendered:z,placeholderClassName:(o===d("PolarisDynamicExploreMediaHelpers").GRID_ITEM_SIZE.ONE_BY_TWO&&s===28?"_aero":"")+(o===d("PolarisDynamicExploreMediaHelpers").GRID_ITEM_SIZE.ONE_BY_TWO&&s===4?" _al5s":""),rich:!0,src:c("nullthrows")(w[0]).src,srcSet:w}),u&&i.jsx("div",{className:"_acg8",children:i.jsx(u.icon,{alt:u.alt,color:"ig-stroke-on-media",shadow:!0,size:A?24:18})}),q&&i.jsx(c("PolarisErrorBoundary.react"),{errorRenderer:function(a){return null},children:i.jsx(c("PolarisDynamicExploreGridItemOverlay.react"),{exploreGridQuery:e,exploreGridType:f,postId:g})})]})})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisPPRLoggedDynamicExploreGridItem",["PolarisDynamicExploreGridItem.react","polarisWithPPRLogging"],(function(a,b,c,d,e,f,g){"use strict";a=c("polarisWithPPRLogging")(c("PolarisDynamicExploreGridItem.react"));g["default"]=a}),98);
__d("PolarisDynamicExploreSectionalItem.react",["cx","IGDSBox.react","PolarisDynamicExploreMediaHelpers","PolarisPPRLoggedDynamicExploreGridItem","PolarisPostsGridQEHelpers","react"],(function(a,b,c,d,e,f,g,h){"use strict";var i=d("react");function a(a){var b=a.analyticsContext,e=a.exploreGridQuery,f=a.exploreGridType,g=a.isVisible,h=a.logGridItemImpression,j=a.mediaLinkBuilder,k=a.onGridItemClick;a=a.sectionalItem;a.feed_type;a.id;var l=a.layout_content,m=a.layout_type,n=function(a){return function(b){k&&k(b,a,a.row,a.column)}},o=function(a){return!j?null:j(a)},p=function(a){var b=a.item;a=a.size;return h!=null?[h(b,a)]:[]};a=d("PolarisDynamicExploreMediaHelpers").getGridItemPlacement(m);var q=a.position;a=a.size;var r=l.fill_items;l=l.primary_item;var s=d("PolarisPostsGridQEHelpers").getMarginForPostsGridItems();return i.jsxs(c("IGDSBox.react"),{display:"block",position:"relative",children:[l!=null&&i.jsx("div",{className:(s===28?"_ab70":"")+(s===4?" _al5u":"")+(a===d("PolarisDynamicExploreMediaHelpers").GRID_ITEM_SIZE.ONE_BY_TWO&&s===28?" _ab71":"")+(a===d("PolarisDynamicExploreMediaHelpers").GRID_ITEM_SIZE.ONE_BY_TWO&&s===4?" _al5y":"")+(a===d("PolarisDynamicExploreMediaHelpers").GRID_ITEM_SIZE.TWO_BY_TWO&&s===28?" _ab72":"")+(a===d("PolarisDynamicExploreMediaHelpers").GRID_ITEM_SIZE.TWO_BY_TWO&&s===4?" _al5w":"")+(q===d("PolarisDynamicExploreMediaHelpers").GRID_ITEM_POSITION.LEFT?" _ab73":"")+(q===d("PolarisDynamicExploreMediaHelpers").GRID_ITEM_POSITION.RIGHT?" _ab74":""),children:i.jsx(c("PolarisPPRLoggedDynamicExploreGridItem"),{analyticsContext:b,constructedLink:o(l),exploreGridQuery:e,exploreGridType:f,id:d("PolarisDynamicExploreMediaHelpers").getPostId(l),isGridView:!0,isVisible:g,mediaLinkBuilder:j,onClick:n(l),size:a,viewpointActions:p({item:l,size:a})})}),r.map(function(a,h){return i.jsx("div",{className:(s===28?"_ab70":"")+(s===4?" _al5u":""),children:i.jsx(c("PolarisPPRLoggedDynamicExploreGridItem"),{analyticsContext:b,constructedLink:o(a),exploreGridQuery:e,exploreGridType:f,id:d("PolarisDynamicExploreMediaHelpers").getPostId(a),isGridView:!0,isVisible:g,mediaLinkBuilder:j,onClick:n(a),size:d("PolarisDynamicExploreMediaHelpers").getGridFillItemsSize(m),viewpointActions:p({item:a,size:d("PolarisDynamicExploreMediaHelpers").GRID_ITEM_SIZE.ONE_BY_ONE})})},a.id)})]})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisDynamicExploreGrid.react",["cx","PolarisDynamicExploreLoadingSpinner.react","PolarisDynamicExploreSectionalItem.react","PolarisErrorRetrySection.react","PolarisGenericVirtualFeed.react","PolarisSizeCache","PolarisUA","react"],(function(a,b,c,d,e,f,g,h){"use strict";var i=d("react");b=800;var j=1,k=1,l=1.5,m=6,n=new(c("PolarisSizeCache"))({estimatedSize:b});function a(a){var b=a.analyticsContext,e=a.exploreGridQuery,g=a.exploreGridType,h=a.hasNextPage,o=a.hasTopRefinementsSection,p=a.isFetching,q=a.logGridItemImpression,r=a.mediaLinkBuilder,s=a.onGridItemClick,t=a.onNextPage,u=a.onRetry,v=a.sectionalItems;function w(a){return function(b,c,d,e){s&&s(b,c,a,d,e)}}function x(a){var d=a.index;a=a.isVisible;var f=v[d];return i.jsx(c("PolarisDynamicExploreSectionalItem.react"),{analyticsContext:b,exploreGridQuery:e,exploreGridType:g,isVisible:a,logGridItemImpression:q,mediaLinkBuilder:r,onGridItemClick:w(f),sectionalItem:f},d)}x.displayName=x.name+" [from "+f.id+"]";return v.length===0?p?i.jsx(c("PolarisDynamicExploreLoadingSpinner.react"),{}):i.jsx(c("PolarisErrorRetrySection.react"),{onRetry:u}):i.jsx(c("PolarisGenericVirtualFeed.react"),{allowSampledScrollLogging:!0,analyticsContext:b,className:"_acgg"+(o===!0?" _acgh":""),"data-testid":void 0,enablePrefetch:d("PolarisUA").isMobile()!==!0,enablePriorityFetching:!1,hasNextPage:h,initialRenderCount:j,isFetching:p,items:v,nextPageThreshold:k,onNextPage:t,overscanCount:m,prefetchNextPageThreshold:l,renderFeedItem:x,sizeCache:n,visibleCount:v.length})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisExploreVariants",["$InternalEnum"],(function(a,b,c,d,e,f){a=b("$InternalEnum")({FOR_YOU:"for_you",NONPERSONALIZED:"nonpersonalized"});c=a;f["default"]=c}),66);
__d("PolarisDynamicExploreVariantsHelper",["PolarisExploreVariants"],(function(a,b,c,d,e,f,g){"use strict";function a(a){return a==null||c("PolarisExploreVariants").cast(String(a))==="for_you"?!1:!0}g.shouldShowNonPersonalizedExplore=a}),98);
__d("PolarisKeywordExploreStrings",["fbt"],(function(a,b,c,d,e,f,g,h){"use strict";a=h._("__JHASH__CdKcEifxFn-__JHASH__");b=h._("__JHASH__p3XTyV2187D__JHASH__");c=h._("__JHASH__olQZtTO0Zl4__JHASH__");d=h._("__JHASH__IEYBqphYb44__JHASH__");e=h._("__JHASH__Uu4Dg54Se_q__JHASH__");f=h._("__JHASH__8EIUUA8XAQc__JHASH__");h="for_you";var i="not_personalized";g.NO_KEYWORD_GRID_RESULTS_BODY=a;g.NO_KEYWORD_GRID_RESULTS_HEADER=b;g.NO_KEYWORD_GRID_RESULTS_SEARCH_ICON=c;g.FOR_YOU=d;g.NOT_PERSONALIZED=e;g.DOWN_CHEVRON=f;g.FOR_YOU_KEY=h;g.NOT_PERSONALIZED_KEY=i}),98);
__d("PolarisExplorePagePersonalizationPopoverHeaderItem.react",["CometRouteParams","IGDSButton.react","IGDSChevronDownPanoOutline24Icon","IGDSIconButton.react","IGDSLazyPopoverTrigger.react","JSResourceForInteraction","PolarisDynamicExploreVariantsHelper","PolarisKeywordExploreStrings","emptyFunction","react"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react");b=d("react");var i=b.useEffect,j=b.useState,k={labelMargin:{fontSize:"x1jchvi3",fontWeight:"x117nqv4",marginBottom:"xyorhqc",marginEnd:"x1t4t16n",marginStart:"x17adc0v",marginTop:"x1anpbxc",$$css:!0},noShrink:{flexShrink:"x2lah0s",marginEnd:"xeyog9w",marginStart:"x1orzsq4",$$css:!0},tertiaryTextColor:{color:"xb88cxz",$$css:!0}},l=c("JSResourceForInteraction")("PolarisExplorePagePersonalizationMenu.react").__setRef("PolarisExplorePagePersonalizationPopoverHeaderItem.react");function a(a){var b=a.currentKeyword;a=d("CometRouteParams").useRouteParams();a=a.variant;var e=d("PolarisDynamicExploreVariantsHelper").shouldShowNonPersonalizedExplore(a);a=j(e?d("PolarisKeywordExploreStrings").NOT_PERSONALIZED_KEY:d("PolarisKeywordExploreStrings").FOR_YOU_KEY);var f=a[0],g=a[1];a=j(!1);var m=a[0],n=a[1];i(function(){return e?g("not_personalized"):g("for_you")},[e]);return h.jsx(c("IGDSLazyPopoverTrigger.react"),{align:"start",popoverProps:{keyword:b,onClose:c("emptyFunction"),parentState:f,setParentState:g},popoverResource:l,position:"below",preloadTrigger:"button",children:function(a,e){return h.jsxs(h.Fragment,{children:[h.jsx(c("IGDSButton.react"),{label:f===d("PolarisKeywordExploreStrings").FOR_YOU_KEY?d("PolarisKeywordExploreStrings").FOR_YOU:d("PolarisKeywordExploreStrings").NOT_PERSONALIZED,onClick:function(){m?n(!1):n(!0);return e()},ref:a,size:"large",variant:"secondary_link",xstyle:[k.labelMargin,b!==""&&k.tertiaryTextColor]}),h.jsx(c("IGDSIconButton.react"),{onClick:m?function(){n(!1),c("emptyFunction")()}:function(){n(!0),e()},xstyle:k.noShrink,children:h.jsx(c("IGDSChevronDownPanoOutline24Icon"),{alt:d("PolarisKeywordExploreStrings").DOWN_CHEVRON,color:b===""?"ig-secondary-button":"ig-tertiary-text",size:10})})]})}})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisKeywordExplorePillsPlaceholder.react",["IGDSGlimmer.react","range","react"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react"),i={mediaGlimmer:{borderTopStartRadius:"xm3z3ea",borderTopEndRadius:"x1x8b98j",borderBottomEndRadius:"x131883w",borderBottomStartRadius:"x16mih1h",flexShrink:"x2lah0s",height:"xlup9mm",width:"x1247r65",$$css:!0},row:{alignItems:"x6s0dn4",display:"x78zum5",paddingTop:"x1y1aw1k",paddingEnd:"xxbr6pl",paddingBottom:"xwib8y2",paddingStart:"xbbxn1n",$$css:!0}};function a(a){a=a.isNonPersonalizedExplore;return a?null:h.jsx("div",{className:"x6s0dn4 x78zum5 x1y1aw1k xxbr6pl xwib8y2 xbbxn1n",children:c("range")(1,8).map(function(a){return h.jsx("div",{className:"x6s0dn4 x78zum5 x1y1aw1k xxbr6pl xwib8y2 xbbxn1n",children:h.jsx(c("IGDSGlimmer.react"),{index:a,xstyle:i.mediaGlimmer})},a)})})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisKeywordSearchRefinementPill.react",["IGDSButton.react","PolarisDynamicExploreActions","PolarisLinkBuilder","PolarisReactRedux","PolarisSearchActions","react"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react");function a(a){var b=a.keywordRefinement,e=d("PolarisReactRedux").useDispatch();a=function(a){e(d("PolarisDynamicExploreActions").trackKeywordId(b.keywordId,b.keywordName)),e(d("PolarisSearchActions").navigateToSuggestedOrRecentSearch(b.keywordName))};return h.jsx(c("IGDSButton.react"),{display:"block",href:d("PolarisLinkBuilder").getKeywordSearchResultLink(b.keywordName),label:b.displayText,onClick:a,variant:"secondary"})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisKeywordSearchRefinementPillSection.react",["cx","IGDSBox.react","IGDSTab.react","IGDSTabGroup.react","PolarisHSnapScroll.react","PolarisIGVirtualList.react","PolarisKeywordSearchRefinementPill.react","PolarisLinkBuilder","PolarisReactRedux","PolarisUA","emptyFunction","qex","react"],(function(a,b,c,d,e,f,g,h){"use strict";var i=d("react"),j=d("react").useMemo;function a(a){var b=a.currentKeyword,e=a.keywordRefinements,f=function(a){return a.reduce(function(a,b){b=b.displayText.split(" ");return a+b.length},0)};a=j(function(){return f(e)},[e]);var g=d("PolarisReactRedux").useSelector(function(a){return a.dynamicExplore.isNonPersonalizedExplore}),h=c("qex")._("516")===!0,k=j(function(){return b!=null?e.find(function(a){return a.displayText===b}):null},[b,e]),l=function(a){a=a.index;a=e[a];return i.jsx(c("IGDSBox.react"),{direction:"column",marginEnd:3,position:"relative",children:i.jsx(c("PolarisKeywordSearchRefinementPill.react"),{keywordRefinement:a})},a.keywordId)};if(d("PolarisUA").isMobile())return i.jsx("div",{className:"_ad3m",children:i.jsx(c("PolarisIGVirtualList.react"),{containerSize:"auto",direction:"horizontal",itemCount:e.length,renderer:l,style:{alignSelf:"center",flexShrink:0}})});return h?i.jsx(i.Fragment,{children:(!g||b!=="")&&i.jsx(c("IGDSBox.react"),{flex:"grow",width:850,children:i.jsx(c("PolarisHSnapScroll.react"),{disableScrollSnap:!0,itemCount:e.length,itemWidth:a>15?110:100,children:i.jsx(c("IGDSTabGroup.react"),{leftAlign:!0,onChange:c("emptyFunction"),value:k==null?void 0:k.keywordId,children:e.map(function(a){return i.jsx(c("IGDSTab.react"),{href:d("PolarisLinkBuilder").getKeywordSearchResultLink(a.keywordName),label:a.displayText,leftAlign:!0,size:"label",value:a.keywordId},a.keywordId)})})})})}):i.jsx("div",{className:"_ad3n",children:i.jsx(c("IGDSBox.react"),{direction:"row",marginBottom:1,position:"relative",wrap:!0,children:e.map(function(a){return i.jsx(c("IGDSBox.react"),{direction:"column",marginBottom:4,marginEnd:3,position:"relative",children:i.jsx(c("PolarisKeywordSearchRefinementPill.react"),{keywordRefinement:a})},a.keywordId)})})})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisKeywordSearchExploreHeaderContent.react",["cx","IGDSBox.react","PolarisGenericMobileHeader.react","PolarisIGCoreText","PolarisKeywordExplorePillsPlaceholder.react","PolarisKeywordSearchRefinementPill.react","PolarisKeywordSearchRefinementPillSection.react","PolarisNavBackButton.react","PolarisReactRedux","PolarisStringUtils","PolarisUA","gkx","polarisDynamicExploreSelectors","qex","react"],(function(a,b,c,d,e,f,g,h){"use strict";var i=d("react");function a(a){var b=a.keyword;a=d("PolarisReactRedux").useSelector(function(a){return d("polarisDynamicExploreSelectors").getKeywordRefinementItems(a,b)});var e=d("PolarisReactRedux").useSelector(d("polarisDynamicExploreSelectors").getClusters),f=c("qex")._("516")===!0,g=d("PolarisReactRedux").useSelector(function(a){return a.dynamicExplore.isNonPersonalizedExplore});if(d("PolarisUA").isMobile())return i.jsx(c("PolarisGenericMobileHeader.react"),{leftActions:i.jsx(c("PolarisNavBackButton.react"),{}),title:d("PolarisStringUtils").lowercaseAndCapitalizeFirst(b)});return f?e.length===0&&c("gkx")("4927")===!0?i.jsx(c("PolarisKeywordExplorePillsPlaceholder.react"),{isNonPersonalizedExplore:g}):i.jsx(c("PolarisKeywordSearchRefinementPillSection.react"),{currentKeyword:b,keywordRefinements:e.map(function(a){return{displayText:a.name,keywordId:a.id,keywordName:a.name,position:a.ranked_position}})}):i.jsx("div",{className:"_aarr",children:i.jsxs(c("IGDSBox.react"),{position:"relative",children:[i.jsx(c("PolarisIGCoreText").Title,{display:"truncated",children:d("PolarisStringUtils").lowercaseAndCapitalizeFirst(b)}),i.jsx(c("IGDSBox.react"),{direction:"row",position:"relative",wrap:!0,children:a.map(function(a){return i.jsx(c("IGDSBox.react"),{direction:"column",marginEnd:3,marginTop:4,position:"relative",children:i.jsx(c("PolarisKeywordSearchRefinementPill.react"),{keywordRefinement:a})},a.keywordId)})})]})})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisKeywordSearchExploreHeaderWithRetry.react",["CometRouteParams","PolarisDynamicExploreActions","PolarisDynamicExploreVariantsHelper","PolarisKeywordSearchExploreHeaderContent.react","react","usePolarisGetQuery","usePolarisGetQuerySetup"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react");function a(a){a=a.keyword;var b=d("CometRouteParams").useRouteParams();b=b.variant;b=d("PolarisDynamicExploreVariantsHelper").shouldShowNonPersonalizedExplore(b);var e=c("usePolarisGetQuery")("/api/v1/discover/web/explore_grid/",{query:{is_nonpersonalized_explore:b}});c("usePolarisGetQuerySetup")(e,d("PolarisDynamicExploreActions").setupDynamicExploreGrid({isNonPersonalizedExplore:b}));return h.jsx(c("PolarisKeywordSearchExploreHeaderContent.react"),{keyword:a})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisKeywordSearchExploreHeader.react",["CometPlaceholder.react","IGDSBox.react","IGDSDivider.react","PolarisExplorePagePersonalizationPopoverHeaderItem.react","PolarisKeywordExplorePillsPlaceholder.react","PolarisKeywordSearchExploreHeaderContent.react","PolarisKeywordSearchExploreHeaderWithRetry.react","PolarisNavigationLayoutContext","PolarisReactRedux","PolarisScrollawayHeaderWrapper.react","gkx","polarisDynamicExploreSelectors","qex","react","usePolarisNonPersonalizedTabsImpressionLogger"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react"),i=d("react").useContext,j={extraMarginOnGrid:{marginTop:"x1d9vk0g",$$css:!0},scrollawayHeaderWrapper:{maxWidth:"xyzno7u",paddingTop:"x1p5oq8j",width:"xh8yej3",$$css:!0}};function a(a){var b=a.keyword;a=d("PolarisReactRedux").useSelector(function(a){return d("polarisDynamicExploreSelectors").getKeywordRefinementItems(a,b)});var e=d("PolarisReactRedux").useSelector(d("polarisDynamicExploreSelectors").getClusters),f=d("PolarisReactRedux").useSelector(function(a){return a.dynamicExplore.isNonPersonalizedExplore}),g=c("qex")._("516")===!0,k=i(c("PolarisNavigationLayoutContext"));k=k.navigationPosition;k=k==="bottom";var l=c("usePolarisNonPersonalizedTabsImpressionLogger")("exploreLandingPage");if(!g)return h.jsx(c("PolarisKeywordSearchExploreHeaderContent.react"),{keyword:b});g=h.jsxs(h.Fragment,{children:[h.jsxs(c("IGDSBox.react"),{alignItems:"center",containerRef:l,direction:"row",display:"flex",minHeight:50,children:[h.jsx(c("PolarisExplorePagePersonalizationPopoverHeaderItem.react"),{currentKeyword:b}),e.length===0&&a.length===0&&c("gkx")("4927")===!0?h.jsx(c("CometPlaceholder.react"),{fallback:h.jsx(c("PolarisKeywordExplorePillsPlaceholder.react"),{isNonPersonalizedExplore:f}),children:h.jsx(c("PolarisKeywordSearchExploreHeaderWithRetry.react"),{keyword:b})}):h.jsx(c("PolarisKeywordSearchExploreHeaderContent.react"),{keyword:b})]}),h.jsx(c("IGDSDivider.react"),{variant:"elevated"})]});return k?g:h.jsxs(h.Fragment,{children:[h.jsx(c("PolarisScrollawayHeaderWrapper.react"),{xstyle:j.scrollawayHeaderWrapper,children:g}),h.jsx("div",{className:"x1d9vk0g"})]})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisDynamicExplorePageSharedGrid.react",["CometPlaceholder.react","IGRouter","PolarisDynamicExploreGrid.react","PolarisDynamicExploreMediaHelpers","PolarisKeywordSearchExploreHeader.react","PolarisKeywordSearchRefinementPillSection.react","PolarisLogger","PolarisUA","deferredLoadComponent","logPolarisPostModalOpen","polarisDynamicExploreSelectors","polarisUnexpected","qex","react","requireDeferred"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react");b=d("react");var i=b.useEffect,j=b.useState,k=c("deferredLoadComponent")(c("requireDeferred")("PolarisDynamicExplorePostModal.react").__setRef("PolarisDynamicExplorePageSharedGrid.react")),l=1;function a(a){var b=a.clusters,e=a.exploreGridQuery,f=a.exploreGridType,g=a.hasMobileHeaderWithRefinements,m=a.logGridItemClick,n=a.logGridItemImpression,o=a.mediaLinkBuilder,p=a.modalEntryPath,q=a.onNextPage,r=a.pageID,s=a.pagination,t=a.requestInitialGrid,u=a.sectionalItems;a=j(!1);var v=a[0],w=a[1];a=j(null);var x=a[0],y=a[1],z=d("IGRouter").useIGHistory();a=function(a,b,c,e,f){var g=c.layout_content,h=c.layout_type;g=g.fill_items.find(function(a){return a.id===b.id});g=g?d("PolarisDynamicExploreMediaHelpers").GRID_ITEM_SIZE.ONE_BY_ONE:d("PolarisDynamicExploreMediaHelpers").getGridItemPlacement(h).size;m&&m(b,g,c,e,f);d("PolarisLogger").logAction("exploreGridItemClicked");d("PolarisUA").isDesktop()&&(a.preventDefault(),A(d("PolarisDynamicExploreMediaHelpers").getPostId(b)))};function A(a){w(!0);y(a);var b=u.findIndex(function(b){return d("polarisDynamicExploreSelectors").getGridItemsFromSectionalItem(b).some(function(b){return b.pk===a})}),e=d("polarisDynamicExploreSelectors").getGridItemsFromSectionalItem(u[b]).find(function(b){return b.pk===a});e=(e=e==null?void 0:e.media_type)!=null?e:0;e===0&&c("polarisUnexpected")("DynamicExplorePageSharedContent: missing media type for post modal log event");c("logPolarisPostModalOpen")(r,e,"explore_page");e=u.length-b-1;(s==null?void 0:s.moreAvailable)===!0&&!s.isLoading&&e<l&&q()}var B=function(){w(!1),y(null)};i(function(){return z.listen(function(a){z.action==="POP"&&B()})},[z]);var C=!d("PolarisUA").isMobile()&&c("qex")._("516")===!0;return h.jsxs(h.Fragment,{children:[b!=null&&b.length>0&&!C&&h.jsx(c("PolarisKeywordSearchRefinementPillSection.react"),{keywordRefinements:b.map(function(a){return{displayText:a.name,keywordId:a.id,keywordName:a.name,position:a.ranked_position}})}),C&&h.jsx(c("CometPlaceholder.react"),{fallback:null,children:h.jsx(c("PolarisKeywordSearchExploreHeader.react"),{keyword:(b=e)!=null?b:""})}),h.jsx(c("PolarisDynamicExploreGrid.react"),{analyticsContext:r,exploreGridQuery:e,exploreGridType:f,hasNextPage:(C=s==null?void 0:s.moreAvailable)!=null?C:!1,hasTopRefinementsSection:g,isFetching:(b=s==null?void 0:s.isLoading)!=null?b:!1,logGridItemImpression:n,mediaLinkBuilder:o,onGridItemClick:a,onNextPage:q,onRetry:t,sectionalItems:u}),v&&x!=null&&h.jsx(k,{analyticsContext:r,exploreGridQuery:e,exploreGridType:f,modalEntryPath:p,onClose:B,onOpen:A,postId:x})]})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisDynamicExploreMediaPageGrid.react",["PolarisDynamicExploreActions","PolarisDynamicExploreMediaHelpers","PolarisDynamicExplorePageSharedGrid.react","PolarisDynamicExploreTypes","PolarisExploreLogger","PolarisLinkBuilder","PolarisLogger","PolarisOrganicThumbnailImpression","PolarisReactRedux","PolarisRoutes","PolarisUA","emptyFunction","polarisDynamicExploreSelectors","react","usePolarisGetQuerySetup"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react");function i(a){return d("PolarisUA").isMobile()?d("PolarisLinkBuilder").buildChainingMediaLink(d("PolarisDynamicExploreMediaHelpers").getPostCode(a)):d("PolarisLinkBuilder").buildMediaLink(d("PolarisDynamicExploreMediaHelpers").getPostCode(a))}function a(a){var b=a.exploreGridType,e=a.exploreQuery,f=a.pageID,g=d("PolarisReactRedux").useDispatch(),j=d("PolarisReactRedux").useSelector(function(a){return a.dynamicExplore.isNonPersonalizedExplore});c("usePolarisGetQuerySetup")(e,d("PolarisDynamicExploreActions").setupDynamicExploreGrid({isNonPersonalizedExplore:j}));var k=d("PolarisReactRedux").useSelector(function(a){return a.dynamicExplore.pagination});function l(){d("PolarisLogger").logAction("discoverNextLoadAttempt"),g(d("PolarisDynamicExploreActions").requestDynamicExploreGrid({cursor:j?k.nonpersonalized.cursor:k.personalized.cursor,isNonPersonalizedExplore:j,retryHandler:l}))}a=d("PolarisReactRedux").useSelector(function(a){return d("polarisDynamicExploreSelectors").getSupportedSectionalItems(a,d("PolarisDynamicExploreTypes").DYNAMIC_EXPLORE_GRID_TYPES.home_explore_grid)});e=d("PolarisReactRedux").useSelector(function(a){return d("polarisDynamicExploreSelectors").getClusters(a)});var m=function(a,b,c,e,f){d("PolarisExploreLogger").logExploreHomeClick({column:f,gridItemSize:b,mediaType:d("PolarisDynamicExploreMediaHelpers").getMediaType(a),postId:d("PolarisDynamicExploreMediaHelpers").getPostId(a),row:e,type:d("PolarisExploreLogger").getDynamicExploreGridItemType(a)})},n=function(a,b){return d("PolarisOrganicThumbnailImpression").makeThumbnailImpressionAction({analyticsContext:f,column:a.column,gridItemSize:b,itemType:a.item_type,mediaType:(b=a.media_type)!=null?b:void 0,postId:d("PolarisDynamicExploreMediaHelpers").getPostId(a),row:a.row})};return h.jsx(c("PolarisDynamicExplorePageSharedGrid.react"),{clusters:e,exploreGridType:b,hasMobileHeaderWithRefinements:d("PolarisUA").isMobile()&&e!=null&&e.length>0,logGridItemClick:m,logGridItemImpression:n,mediaLinkBuilder:i,modalEntryPath:d("PolarisRoutes").DISCOVER_MEDIA_PATH,onNextPage:l,pageID:f,pagination:j?k.nonpersonalized:k.personalized,requestInitialGrid:c("emptyFunction"),sectionalItems:a})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisErrorBoundaryWithRetry.react",["ErrorBoundary.react","react","useCounter"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react"),i=d("react").useCallback;function a(a){var b=a.fallback,d=a.onError;a=babelHelpers.objectWithoutPropertiesLoose(a,["fallback","onError"]);var e=c("useCounter")(),f=e[0],g=e[1].increment;e=i(function(a){d(a,g)},[d,g]);var j=i(function(a){return b(a,g)},[b,g]);return h.jsx(c("ErrorBoundary.react"),babelHelpers["extends"]({fallback:j,forceResetErrorCount:f,onError:e},a))}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisDynamicExploreMediaPageGridWithRetry.react",["CometPlaceholder.react","PolarisDynamicExploreActions","PolarisDynamicExploreLoadingSpinner.react","PolarisDynamicExploreMediaPageGrid.react","PolarisDynamicExploreTypes","PolarisErrorBoundaryWithRetry.react","PolarisErrorRetrySection.react","PolarisReactRedux","react","usePolarisGetQueryRefetcher"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react"),i=d("react").useCallback;function a(a){var b=a.exploreQuery;a=a.pageID;var e=d("PolarisReactRedux").useDispatch(),f=c("usePolarisGetQueryRefetcher")(b),g=i(function(a){return function(){f(),a()}},[f]),j=i(function(a,b){e(d("PolarisDynamicExploreActions").logErrorAndShowRetryToast(a,g(b)))},[e,g]),k=i(function(a,b){return h.jsx(c("PolarisErrorRetrySection.react"),{onRetry:g(b)})},[g]);return h.jsx(c("CometPlaceholder.react"),{fallback:h.jsx(c("PolarisDynamicExploreLoadingSpinner.react"),{}),children:h.jsx(c("PolarisErrorBoundaryWithRetry.react"),{fallback:k,onError:j,children:h.jsx(c("PolarisDynamicExploreMediaPageGrid.react"),{exploreGridType:d("PolarisDynamicExploreTypes").DYNAMIC_EXPLORE_GRID_TYPES.home_explore_grid,exploreQuery:b,pageID:a})})})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisDynamicExplorePageContentWrapper.react",["cx","PolarisErrorBoundary.react","PolarisNavigationLayoutContext","PolarisSearchResultDisplayTypes","PolarisUA","cr:3851","cr:4318","react","usePolarisIsOnExplorePage"],(function(a,b,c,d,e,f,g,h){"use strict";var i=d("react"),j=d("react").useContext;function a(a){var e=a.children;a=a.pageId;var f=j(c("PolarisNavigationLayoutContext"));f=f.navigationPosition;f=c("usePolarisIsOnExplorePage")()&&d("PolarisUA").isDesktop()&&f==="bottom";return i.jsxs("div",{className:"_ac-t"+(d("PolarisUA").isDesktop()?" _ac-u":"")+(d("PolarisUA").isDesktop()?" _ac-v":""),"data-testid":void 0,children:[f&&b("cr:3851")!=null&&i.jsx(b("cr:3851"),{analyticsContext:a,searchBoxOnExplore:!0,useHistory:!1}),f&&b("cr:4318")!=null&&i.jsx(c("PolarisErrorBoundary.react"),{children:i.jsx(b("cr:4318"),{analyticsContext:a,resultDisplayType:c("PolarisSearchResultDisplayTypes").Popover})}),e]})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisExploreRootContent.react",["CometPlaceholder.react","PolarisDynamicExploreLoadingSpinner.react","PolarisDynamicExploreMediaPageGridWithRetry.react","PolarisDynamicExplorePageContentWrapper.react","PolarisMonitorErrors","PolarisQPManager.react","PolarisReactRedux","PolarisRoutes","PolarisSearchResultsListContainer.react","PolarisUA","react","useCometRouterDispatcher","usePolarisPreloadedGetQuery"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react"),i=d("react").useEffect,j="exploreLandingPage";function a(a){a=a.routeProps;var b=a.is_search_open,e=a.nonpersonalized;a=a.polaris_preload;var f=c("useCometRouterDispatcher")(),g=d("PolarisReactRedux").useDispatch();g({isNonPersonalizedExplore:e,type:"NON_PERSONALIZED_EXPLORE"});g=c("usePolarisPreloadedGetQuery")(a.explore);i(function(){if(d("PolarisUA").isMobile())try{f==null?void 0:f.prefetchRouteDefinition(d("PolarisRoutes").DISCOVER_SEARCH_PATH)}catch(a){d("PolarisMonitorErrors").logError(a)}},[f]);e=b===!0&&d("PolarisUA").isMobile();return h.jsxs(c("PolarisDynamicExplorePageContentWrapper.react"),{pageId:j,children:[h.jsx(c("PolarisQPManager.react"),{slot:"explore"}),e?h.jsx(c("PolarisSearchResultsListContainer.react"),{analyticsContext:j,isVisibleInPopup:!1}):h.jsx(c("CometPlaceholder.react"),{fallback:h.jsx(c("PolarisDynamicExploreLoadingSpinner.react"),{}),children:h.jsx(c("PolarisDynamicExploreMediaPageGridWithRetry.react"),{exploreQuery:g,pageID:j})})]})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("PolarisExploreRoot.react",["PolarisConditionalPageLayoutHandler.react","PolarisExploreMobileHeader.react","PolarisExploreRootContent.react","PolarisFooter.react","PolarisPageMetadata.react","PolarisShell.react","PolarisSizing","PolarisUA","react"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react"),i="exploreLandingPage";function a(a){a=a.props.routeProps;var b=a.is_search_open;b=h.jsxs(c("PolarisShell.react"),{footerVariant:d("PolarisUA").isMobile()?c("PolarisFooter.react").VARIANTS.slim:c("PolarisFooter.react").VARIANTS.centered,maxWidth:d("PolarisUA").isMobile()?d("PolarisSizing").SITE_WIDTHS.narrow:d("PolarisSizing").SITE_WIDTHS.wide,mobileHeader:h.jsx(c("PolarisExploreMobileHeader.react"),{analyticsContext:i,isSearchOpen:b===!0}),pageIdentifier:i,children:[h.jsx(c("PolarisPageMetadata.react"),{id:i}),h.jsx(c("PolarisExploreRootContent.react"),{routeProps:a})]});return h.jsx(c("PolarisConditionalPageLayoutHandler.react"),{mainComponent:b})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);