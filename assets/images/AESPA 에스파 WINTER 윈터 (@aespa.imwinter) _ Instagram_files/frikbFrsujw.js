;/*FB_PKG_DELIM*/

__d("PolarisDynamicExplorePostModal.react",["PolarisDynamicExploreMediaHelpers","PolarisDynamicExploreTypes","PolarisIsLoggedInDesktop","PolarisLinkBuilder","PolarisPost.react","PolarisReactRedux","cr:5667","polarisDynamicExploreSelectors","react"],(function(a,b,c,d,e,f,g){"use strict";var h=d("react");function a(a){var e=a.analyticsContext,f=a.exploreGridQuery,g=a.exploreGridType,i=a.modalEntryPath,j=a.onClose,k=a.onOpen,l=a.postId;a=d("PolarisReactRedux").useSelector(function(a){return d("polarisDynamicExploreSelectors").getPostModalCompatibleGridItemIds(a,g,f)});var m=d("PolarisReactRedux").useSelector(function(a){return d("polarisDynamicExploreSelectors").getGridItems(a,g,f).find(function(a){return d("PolarisDynamicExploreMediaHelpers").getPostId(a)===l})});return m!=null&&h.jsx(b("cr:5667"),{analyticsContext:e,combinedPostIds:a,dimensions:d("PolarisDynamicExploreMediaHelpers").getPostDimensions(m),mediaLinkBuilder:d("PolarisLinkBuilder").buildMediaLink,modalEntryPath:i,onClose:j,onlyReplaceModalHistory:g===d("PolarisDynamicExploreTypes").DYNAMIC_EXPLORE_GRID_TYPES.keyword_grid,onOpen:k,postCode:d("PolarisDynamicExploreMediaHelpers").getPostCode(m),postId:l,children:h.jsx(c("PolarisPost.react"),{analyticsContext:e+"Modal",autoplay:d("PolarisIsLoggedInDesktop").isLoggedInDesktop(),id:l,isVisible:!0,visiblePosition:0})})}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("ServerRedirect",["ReloadPage","URI"],(function(a,b,c,d,e,f,g){function a(a,b,d){c("URI").go(a,b,d)}function b(){d("ReloadPage").now()}g.redirectPageTo=a;g.reloadPage=b}),98);