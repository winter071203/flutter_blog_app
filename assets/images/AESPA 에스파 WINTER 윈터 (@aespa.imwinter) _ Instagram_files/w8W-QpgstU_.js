;/*FB_PKG_DELIM*/

__d("DOMEvent",["invariant"],(function(a,b,c,d,e,f,g,h){a=function(){function a(a){this.event=a||window.event,typeof this.event.srcElement!=="unknown"||h(0,5798),this.target=this.event.target||this.event.srcElement}var b=a.prototype;b.preventDefault=function(){var a=this.event;a.preventDefault?(a.preventDefault(),"defaultPrevented"in a||(a.defaultPrevented=!0)):a.returnValue=!1;return this};b.isDefaultPrevented=function(){var a=this.event;return"defaultPrevented"in a?a.defaultPrevented:a.returnValue===!1};b.stopPropagation=function(){var a=this.event;a.stopPropagation?a.stopPropagation():a.cancelBubble=!0;return this};b.kill=function(){this.stopPropagation().preventDefault();return this};a.killThenCall=function(b){return function(c){new a(c).kill();return b()}};return a}();g["default"]=a}),98);
__d("dedupString",[],(function(a,b,c,d,e,f){"use strict";function a(a){var b;return Object.keys((b={},b[a]=0,b))[0]}f["default"]=a}),66);
__d("wrapFunction",[],(function(a,b,c,d,e,f){var g={};function a(a,b,c){var d=b in g?g[b](a,c):a;return function(){for(var a=arguments.length,b=new Array(a),c=0;c<a;c++)b[c]=arguments[c];return d.apply(this,b)}}a.setWrapper=function(a,b){g[b]=a};f["default"]=a}),66);
__d("DOMEventListener",["invariant","dedupString","emptyFunction","passiveEventListenerUtil","wrapFunction"],(function(a,b,c,d,e,f,g){var h=b("passiveEventListenerUtil").isPassiveEventListenerSupported,i,j;window.addEventListener?(i=function(a,c,d,e){e===void 0&&(e=!1),d.wrapper=b("wrapFunction")(d,"entry",b("dedupString")("DOMEventListener.add "+c)),a.addEventListener(c,d.wrapper,h?e:!1)},j=function(a,b,c,d){d===void 0&&(d=!1),a.removeEventListener(b,c.wrapper,h?d:!1)}):window.attachEvent?(i=function(a,c,d,e){e===void 0,d.wrapper=b("wrapFunction")(d,"entry","DOMEventListener.add "+c),a.attachEvent||g(0,2798),a.attachEvent("on"+c,d.wrapper)},j=function(a,b,c,d){d===void 0,a.detachEvent||g(0,2799),a.detachEvent("on"+b,c.wrapper)}):j=i=b("emptyFunction");a={add:function(a,b,c,d){d===void 0&&(d=!1);i(a,b,c,d);return{remove:function(){j(a,b,c,d)}}},remove:j};e.exports=a}),null);
__d("createArrayFromMixed",["invariant"],(function(a,b,c,d,e,f,g,h){function i(a){var b=a.length;!Array.isArray(a)&&(typeof a==="object"||typeof a==="function")||h(0,3914);typeof b==="number"||h(0,3915);b===0||b-1 in a||h(0,3916);typeof a.callee!=="function"||h(0,3917);if(a.hasOwnProperty)try{return Array.prototype.slice.call(a)}catch(a){}var c=Array(b);for(var d=0;d<b;d++)c[d]=a[d];return c}function j(a){return!!a&&(typeof a==="object"||typeof a==="function")&&"length"in a&&!("setInterval"in a)&&typeof a.nodeType!=="number"&&(Array.isArray(a)||"callee"in a||"item"in a)}function a(a){if(!j(a))return[a];else if(Array.isArray(a))return a.slice();else return i(a)}g["default"]=a}),98);
__d("isElementNode",["isNode"],(function(a,b,c,d,e,f){function a(a){return b("isNode")(a)&&a.nodeType==1}e.exports=a}),null);
__d("DOMQuery",["CSS","FBLogger","containsNode","createArrayFromMixed","createObjectFrom","ge","ifRequired","isElementNode","isNode"],(function(a,b,c,d,e,f,g){var h=/^\.-?[_a-zA-Z]+[\w-]*$/;function i(a,b){return a.hasAttribute?a.hasAttribute(b):a.getAttribute(b)!==null}function a(a,b){a=j(a,b);return a[0]}function b(a,b,c){b=j(a,b);a=j(a,c);b.length===1&&a.length===1&&b[0]===a[0]?c=b:c=b.concat(a);return c[0]}function j(a,b){if(!a||!a.getElementsByTagName)return[];b=b.split(" ");var e=[a];for(var f=0;f<b.length;f++){if(e.length===0)break;if(b[f]==="")continue;var g=b[f],j=b[f],k=[],l=!1;if(g.charAt(0)=="^")if(f===0)l=!0,g=g.slice(1);else return[];g=g.replace(/\[(?:[^=\]]*=(?:\"[^\"]*\"|\'[^\']*\'))?|[.#]/g," $&");g=g.split(" ");var m=g[0]||"*",n=m=="*",o=g[1]&&g[1].charAt(0)=="#";if(o){o=c("ge")(g[1].slice(1),a,m);if(o&&(n||o.tagName.toLowerCase()==m))for(var p=0;p<e.length;p++)if(l&&c("containsNode")(o,e[p])){k=[o];break}else if(document==e[p]||c("containsNode")(e[p],o)&&e[p]!==o){k=[o];break}}else{o=[];p=e.length;var q,r=!l&&j.indexOf("[")<0&&document.querySelectorAll;for(var s=0;s<p;s++){if(l){q=[];var t=e[s].parentNode;while(c("isElementNode")(t))(n||t.tagName.toLowerCase()==m)&&q.push(t),t=t.parentNode}else r?h.test(j)?q=e[s].getElementsByClassName(j.substring(1)):q=e[s].querySelectorAll(j):q=e[s].getElementsByTagName(m);t=q.length;for(var u=0;u<t;u++)o.push(q[u])}if(!r)for(q=1;q<g.length;q++){t=g[q];u=t.charAt(0)==".";n=t.substring(1);for(s=0;s<o.length;s++){p=o[s];if(!p||p.nodeType!==1)continue;if(u){d("CSS").hasClass(p,n)||delete o[s];continue}else{j=t.slice(1,t.length-1);m=j.indexOf("=");if(m<0){if(!i(p,j)){delete o[s];continue}}else{r=j.substr(0,m);j=j.substr(m+1);j=j.slice(1,j.length-1);if(p.getAttribute(r)!=j){delete o[s];continue}}}}}for(s=0;s<o.length;s++)if(o[s]){k.push(o[s]);if(l)break}}e=k}return e}function e(){var a=window.getSelection;if(a)return a()+"";else{a=document.selection;if(a)return a.createRange().text}return null}function f(a,b){(typeof a==="string"||typeof b==="string")&&c("FBLogger")("dom_query").info("Support for node IDs is deprecated. Use containsNode(ge(<id1>), ge(<id2>)) instead");return c("containsNode")(c("ge")(a),c("ge")(b))}function k(){var a=c("ifRequired")("Quickling",function(a){return a.isActive()?c("ge")("content"):null});return a||document.body}function l(a,b){b=c("createArrayFromMixed")(b).join("|").toUpperCase().split("|");b=c("createObjectFrom")(b);return c("isNode")(a)&&a.nodeName in b}function m(a){return l(a,["input","textarea"])||a.contentEditable==="true"}g.find=a;g.findPushSafe=b;g.scry=j;g.getSelection=e;g.contains=f;g.getRootElement=k;g.isNodeOfType=l;g.isInputNode=m}),98);
__d("EventProfiler",["cr:708886"],(function(a,b,c,d,e,f,g){g["default"]=b("cr:708886")}),98);
__d("Scroll",[],(function(a,b,c,d,e,f){function g(a,b){return!!b&&(a===b.documentElement||a===b.body)}function a(a){var b;if(a==null)return 0;var c=a.ownerDocument;return g(a,c)?(c==null?void 0:(b=c.body)==null?void 0:b.scrollTop)||(c==null?void 0:(b=c.documentElement)==null?void 0:b.scrollTop)||0:a.scrollTop||0}function b(a,b){if(a==null)return;var c=a.ownerDocument;g(a,c)?((c==null?void 0:c.body)&&(c.body.scrollTop=b||0),(c==null?void 0:c.documentElement)&&(c.documentElement.scrollTop=b||0)):a.scrollTop=b||0}function c(a){var b,c=a.ownerDocument;return g(a,c)?(c==null?void 0:(b=c.body)==null?void 0:b.scrollLeft)||(c==null?void 0:(b=c.documentElement)==null?void 0:b.scrollLeft)||0:a.scrollLeft||0}function d(a,b){var c=a.ownerDocument;g(a,c)?((c==null?void 0:c.body)&&(c.body.scrollLeft=b||0),(c==null?void 0:c.documentElement)&&(c.documentElement.scrollLeft=b||0)):a.scrollLeft=b||0}f.getTop=a;f.setTop=b;f.getLeft=c;f.setLeft=d}),66);
__d("FlowMigrationUtilsForLegacyFiles",["FBLogger"],(function(a,b,c,d,e,f,g){"use strict";var h="flow_typing_for_legacy_code";function a(a){c("FBLogger")(h).blameToPreviousFile().event(h+".bad_call").mustfix(a);return new Error("["+h+"] "+a)}g.invariantViolation=a}),98);
__d("getDocumentScrollElement",["FlowMigrationUtilsForLegacyFiles"],(function(a,b,c,d,e,f,g){"use strict";var h=typeof navigator!=="undefined"&&navigator.userAgent.indexOf("AppleWebKit")>-1;function a(a){a=a||document;if(a.scrollingElement)return a.scrollingElement;a=!h&&a.compatMode==="CSS1Compat"?a.documentElement:a.body;a||d("FlowMigrationUtilsForLegacyFiles").invariantViolation("null result in getDocumentScrollElement");return a}g["default"]=a}),98);
__d("getObjectValues",[],(function(a,b,c,d,e,f){function a(a){var b=[];for(var c in a)b.push(a[c]);return b}f["default"]=a}),66);
__d("Event",["$","Arbiter","DOMEvent","DOMEventListener","DOMQuery","DataStore","ErrorGuard","EventProfiler","ExecutionEnvironment","FBLogger","Parent","Scroll","TimeSlice","UserAgent","dedupString","fb-error","getDocumentScrollElement","getObjectValues"],(function(a,b,c,d,e,f){var g,h=b("fb-error").TAAL,i="Event.listeners";Event.prototype||(Event.prototype={});function j(a){(a.type==="click"||a.type==="mouseover"||a.type==="keydown")&&b("Arbiter").inform("Event/stop",{event:a})}var k=function(){"use strict";function a(a,b,c){this.cancelBubble=!1,this.target=a,this.type=b,this.data=c}var c=a.prototype;c.getData=function(){this.data=this.data||{};return this.data};c.stop=function(){return Event.stop(this)};c.prevent=function(){return Event.prevent(this)};c.isDefaultPrevented=function(){return Event.isDefaultPrevented(this)};c.kill=function(){return Event.kill(this)};c.getTarget=function(){return new(b("DOMEvent"))(this).target||null};return a}();function l(a){if(a instanceof k)return a;a||(!window.addEventListener&&document.createEventObject?a=window.event?document.createEventObject(window.event):{}:a={});if(!a._inherits_from_prototype)for(var b in Event.prototype)try{a[b]=Event.prototype[b]}catch(a){}return a}Object.assign(Event.prototype,{_inherits_from_prototype:!0,getRelatedTarget:function(){var a=this.relatedTarget||(this.fromElement===this.srcElement?this.toElement:this.fromElement);return a&&a.nodeType?a:null},getModifiers:function(){var a={control:!!this.ctrlKey,shift:!!this.shiftKey,alt:!!this.altKey,meta:!!this.metaKey};a.access=b("UserAgent").isPlatform("Mac OS X")?a.control:a.alt;a.any=a.control||a.shift||a.alt||a.meta;return a},isRightClick:function(){return this.which?this.which===3:this.button&&this.button===2},isMiddleClick:function(){return this.which?this.which===2:this.button&&this.button===4},isDefaultRequested:function(){return this.getModifiers().any||this.isMiddleClick()||this.isRightClick()}},k.prototype);c={listen:function(a,c,d,e,f){typeof d==="function"&&(d=b("TimeSlice").guard(d,b("dedupString")("Event.js "+c+" handler")));!f||typeof f==="boolean"?f={passive:!1}:f={passive:f.passive||!1};if(!b("ExecutionEnvironment").canUseDOM)return new t(a,d,null,c,e,null,f);typeof a==="string"&&(a=b("$")(a));typeof e==="undefined"&&(e=Event.Priority.NORMAL);if(typeof c==="object"){var g={};for(var j in c)g[j]=Event.listen(a,j,c[j],e,f);return g}if(c.match(/^on/i))throw new TypeError("Bad event name `"+c+"': use `click', not `onclick'.");if(!a){j=h.blameToPreviousFrame(new Error("Cannot listen to an undefined element."));b("FBLogger")("event").catching(j).mustfix("Tried to listen to element of type %s",c);throw j}if(a.nodeName=="LABEL"&&c=="click"){g=a.getElementsByTagName("input");a=g.length==1?g[0]:a}else if(a===window&&c==="scroll"){j=b("getDocumentScrollElement")();j!==document.documentElement&&j!==document.body&&(a=j)}g=b("DataStore").get(a,i,{});j=n[c];j&&(c=j.base,j.wrap&&(d=j.wrap(d)));p(a,g,c,f);j=g[c];e in j||(j[e]=[]);var k=j[e].length;d=new t(a,d,g,c,e,k,f);j[e][k]=d;j.numHandlers++;f.passive||(j.numNonPassiveHandlers++,o(a,g[c],c));return d},stop:function(a){var c=new(b("DOMEvent"))(a).stopPropagation();j(c.event);return a},prevent:function(a){new(b("DOMEvent"))(a).preventDefault();return a},isDefaultPrevented:function(a){return new(b("DOMEvent"))(a).isDefaultPrevented(a)},kill:function(a){a=new(b("DOMEvent"))(a).kill();j(a.event);return!1},getKeyCode:function(a){a=new(b("DOMEvent"))(a).event;if(!a)return!1;switch(a.keyCode){case 63232:return 38;case 63233:return 40;case 63234:return 37;case 63235:return 39;case 63272:case 63273:case 63275:return null;case 63276:return 33;case 63277:return 34}if(a.shiftKey)switch(a.keyCode){case 33:case 34:case 37:case 38:case 39:case 40:return null}return a.keyCode},getPriorities:function(){if(!m){var a=b("getObjectValues")(Event.Priority);a.sort(function(a,b){return a-b});m=a}return m},fire:function(a,b,c){c=new k(a,b,c);var d;do{var e=Event.__getHandler(a,b);e&&(d=e(c));a=a.parentNode}while(a&&d!==!1&&!c.cancelBubble);return d!==!1},__fire:function(a,b,c){a=Event.__getHandler(a,b);if(a)return a(l(c))},__getHandler:function(a,c){var d=b("DataStore").get(a,i);return d&&d[c]?d[c].domHandler:a["on"+c]},getPosition:function(a){a=new(b("DOMEvent"))(a).event;var c=b("getDocumentScrollElement")(),d=a.clientX+b("Scroll").getLeft(c);a=a.clientY+b("Scroll").getTop(c);return{x:d,y:a}}};Object.assign(Event,c);var m=null;d=function(a){return function(c){if(!b("DOMQuery").contains(this,c.getRelatedTarget()))return a.call(this,c)}};var n;!window.navigator.msPointerEnabled?n={mouseenter:{base:"mouseover",wrap:d},mouseleave:{base:"mouseout",wrap:d}}:n={mousedown:{base:"MSPointerDown"},mousemove:{base:"MSPointerMove"},mouseup:{base:"MSPointerUp"},mouseover:{base:"MSPointerOver"},mouseout:{base:"MSPointerOut"},mouseenter:{base:"MSPointerOver",wrap:d},mouseleave:{base:"MSPointerOut",wrap:d}};if(b("UserAgent").isBrowser("Firefox < 52")){f=function(a,b){b=l(b);var c=b.getTarget();while(c)Event.__fire(c,a,b),c=c.parentNode};document.documentElement.addEventListener("focus",f.bind(null,"focusin"),!0);document.documentElement.addEventListener("blur",f.bind(null,"focusout"),!0)}var o=function(a,c,d){var e=c.numNonPassiveHandlers==0;e!=c.options.passive&&(c.domHandlerRemover.remove(),c.options.passive=e,c.domHandlerRemover=b("DOMEventListener").add(a,d,c.domHandler,{passive:e}))},p=function(a,c,d,e){if(d in c)return;var f=b("TimeSlice").guard(s.bind(a,d),b("dedupString")("Event listenHandler "+d));c[d]={numHandlers:0,numNonPassiveHandlers:0,domHandlerRemover:b("DOMEventListener").add(a,d,f,e),domHandler:f,options:e};c="on"+d;if(a[c]){f=a===document.documentElement?Event.Priority._BUBBLE:Event.Priority.TRADITIONAL;var g=a[c];a[c]=null;Event.listen(a,d,g,f,e)}};function q(a){return!a.href.endsWith("#")?!1:a.href===document.location.href||a.href===document.location.href+"#"}function r(a,b){return a.nodeName==="INPUT"&&a.type===b}var s=b("EventProfiler").__wrapEventListenHandler(function(a,c){c=l(c);if(!b("DataStore").get(this,i))throw new Error("Bad listenHandler context.");var d=b("DataStore").get(this,i)[a];if(!d)throw new Error("No registered handlers for `"+a+"'.");if(a=="click"||a=="contextmenu"||a=="mousedown"&&c.which==2){a=c.getTarget();var e=b("Parent").byTag(a,"a");e instanceof HTMLAnchorElement&&e.href&&q(e)&&!r(a,"file")&&!r(a,"submit")&&c.prevent()}e=Event.getPriorities();for(a=0;a<e.length;a++){var f=e[a];if(f in d){f=d[f];for(var g=0;g<f.length;g++){if(!f[g])continue;var h=f[g].fire(this,c);if(h===!1)return c.kill();else c.cancelBubble&&c.stop()}}}return c.returnValue});Event.Priority={URGENT:-20,TRADITIONAL:-10,NORMAL:0,_BUBBLE:1e3};var t=function(){"use strict";function a(a,b,c,d,e,f,g){this.$1=a,this.$2=b,this.$3=c,this.$7=d,this.$6=e,this.$4=f,this.$5=g}var c=a.prototype;c.isRemoved=function(){return!this.$3};c.remove=function(){if(b("ExecutionEnvironment").canUseDOM){if(this.isRemoved()){b("FBLogger")("Event").warn("Event handler has already been removed");return}var a=this.$3[this.$7];a.numHandlers<=1?(a.domHandlerRemover.remove(),delete this.$3[this.$7]):(delete a[this.$6][this.$4],a.numHandlers--,this.$5.passive||(a.numNonPassiveHandlers--,o(this.$1,this.$3[this.$7],this.$7)));this.$3=null}};c.fire=function(a,c){return b("ExecutionEnvironment").canUseDOM?(g||(g=b("ErrorGuard"))).applyWithGuard(this.$2,a,[c],{name:"eventhandler:"+c.type+":"+(typeof a.name=="string"?a.name:a.id)}):!0};return a}();a.$E=Event.$E=l;e.exports=Event}),null);
__d("ghlTestUBT",["cr:1543261","cr:334"],(function(a,b,c,d,e,f,g){"use strict";b("cr:1543261")&&b("cr:1543261")(),g["default"]=b("cr:334")}),98);
__d("EventProfilerSham",[],(function(a,b,c,d,e,f){a={__wrapEventListenHandler:function(a){return a},tagCurrentActiveInteractionsAs:function(a){},setCurrentAdAccountId:function(a){},setAdsConfig:function(a){}};b=a;f["default"]=b}),66);