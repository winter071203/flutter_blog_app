;/*FB_PKG_DELIM*/

__d("PolarisIGCoreSpinner",["cx","fbt","IGDSThemeConfig","PolarisIGCoreBox","range","react","vc-tracker"],(function(a,b,c,d,e,f,g,h,i){"use strict";var j=d("react"),k={large:{count:12,length:25,offset:25,size:64,thickness:6},medium:{count:12,length:25,offset:25,size:32,thickness:6},small:{count:8,length:28,offset:22,size:18,thickness:10}},l={__className:"_abdu"},m=i._("__JHASH__r5V4SKigijQ__JHASH__");function a(a){var b=a.animated,d=b===void 0?!0:b;b=a.color;b=b===void 0?"dark":b;var e=a["data-testid"];e=a.position;e=e===void 0?"static":e;var f=a.progress;f=f===void 0?1:f;a=a.size;a=a===void 0?"medium":a;a=k[a];var g=a.count,h=a.length,i=a.offset,n=a.size,o=a.thickness;a=Math.round(g*f);var p=b==="light"?c("IGDSThemeConfig").light["grey-0"]:c("IGDSThemeConfig").light["grey-7"];return j.jsx(c("PolarisIGCoreBox"),babelHelpers["extends"]({},c("vc-tracker").VisualCompletionAttributes.LOADING_STATE,{dangerouslySetClassName:e==="absolute"?l:void 0,"data-testid":void 0,height:n,justifyContent:"center",width:n,children:j.jsx("svg",{"aria-label":m,className:(d?"":"_abdv")+(g===8?" _abdw":"")+(g===12?" _abdx":""),role:"img",viewBox:"0 0 100 100",children:c("range")(0,a).map(function(a){return j.jsx("rect",{fill:"rgb("+p+")",height:o,opacity:d?a/g:1,rx:o/2,ry:o/2,transform:"rotate("+(a-g/4)*360/g+" 50 50)",width:h,x:50-o/2+i,y:50-o/2},a)})})}))}a.displayName=a.name+" [from "+f.id+"]";g["default"]=a}),98);
__d("getImageSourceURLFromImageish",[],(function(a,b,c,d,e,f){"use strict";function a(a){if(typeof a==="string")return a;return a!=null&&typeof a==="object"&&(!a.sprited&&a.uri&&typeof a.uri==="string")?a.uri:""}f["default"]=a}),66);
__d("asset",[],(function(a,b,c,d,e,f){function a(){for(var a=arguments.length,b=new Array(a),c=0;c<a;c++)b[c]=arguments[c];throw new Error("asset("+b.join(",")+"): Unexpected asset reference")}e.exports=a}),null);